/* Hej */

var offline_shelves = [];

var template_endings = [], m_arr, m_i,
		running_right_now=false,
		global_chunk_size = 10,
		last_shelf_data = [],
		last_clicked_element,
		last_todo_string = "",
		last_fixed_tag = "",
		last_clicked_domain = "http://dotshelf.com",
		is_first_run = true,
		dots_robot_alert_timeout,
		last_navigation_state = "home",
		seen_notifications = [],
		seen_notifications_timeout,
		global_zebra_avail_i = 0,
		global_zebra_navail_i = 0,
		_analytics = [],
		last_domain_filter = [],
		global_lock_to_bottom = false,
		dots = { robot:{}, shelf:{}, helpers:{}, popup:{}, users:{} };


/****************** helpers */
dots.helpers.chunk = function(arr,chunk_size) {
	var array=arr;
	return [].concat.apply([],
		array.map(function(elem,i) {
			return i%chunk_size ? [] : [array.slice(i,i+chunk_size)];
		})
	);
};

dots.helpers.r_arr = function(arr)
{
	var i = arr.length, j, tempi, tempj;
	if ( i == 0 ) return false;
	while ( --i ) {
		j = Math.floor( Math.random() * ( i + 1 ) );
		tempi = arr[i];
		tempj = arr[j];
		arr[i] = tempj;
		arr[j] = tempi;
	}
};

dots.helpers.fixtr = function(s)
{
	s = s.replace(/\u00c2/g, 'A'); // Â
	s = s.replace(/\u00e2/g, 'a'); // â
	s = s.replace(/\u00fb/g, 'u'); // û
	s = s.replace(/\u00c7/g, 'C'); // Ç
	s = s.replace(/\u00e7/g, 'c'); // ç
	s = s.replace(/\u011e/g, 'G'); // Ğ
	s = s.replace(/\u011f/g, 'g'); // ğ
	s = s.replace(/\u0130/g, 'I'); // İ
	s = s.replace(/\u0131/g, 'i'); // ı
	s = s.replace(/\u015e/g, 'S'); // Ş
	s = s.replace(/\u015f/g, 's'); // ş
	s = s.replace(/\u00d6/g, 'O'); // Ö
	s = s.replace(/\u00f6/g, 'o'); // ö
	s = s.replace(/\u00dc/g, 'U'); // Ü
	s = s.replace(/\u00fc/g, 'u'); // ü
	s = s.toLowerCase().replace(/[^a-zA-Z0-9]/g,'');
	return s;
};

String.prototype.capitalize = function() {
    return this.charAt(0).toUpperCase() + this.slice(1);
}

var pad = function(num, totalChars) {
    var pad = '0';
    num = num + '';
    while (num.length < totalChars) {
        num = pad + num;
    }
    return num;
};

// Ratio is between 0 and 1
var changeColor = function(color, ratio, darker) {
    // Trim trailing/leading whitespace
    color = color.replace(/^\s*|\s*$/, '');

    // Expand three-digit hex
    color = color.replace(
        /^#?([a-f0-9])([a-f0-9])([a-f0-9])$/i,
        '#$1$1$2$2$3$3'
    );

    // Calculate ratio
    var difference = Math.round(ratio * 256) * (darker ? -1 : 1),
        // Determine if input is RGB(A)
        rgb = color.match(new RegExp('^rgba?\\(\\s*' +
            '(\\d|[1-9]\\d|1\\d{2}|2[0-4][0-9]|25[0-5])' +
            '\\s*,\\s*' +
            '(\\d|[1-9]\\d|1\\d{2}|2[0-4][0-9]|25[0-5])' +
            '\\s*,\\s*' +
            '(\\d|[1-9]\\d|1\\d{2}|2[0-4][0-9]|25[0-5])' +
            '(?:\\s*,\\s*' +
            '(0|1|0?\\.\\d+))?' +
            '\\s*\\)$'
        , 'i')),
        alpha = !!rgb && rgb[4] != null ? rgb[4] : null,

        // Convert hex to decimal
        decimal = !!rgb? [rgb[1], rgb[2], rgb[3]] : color.replace(
            /^#?([a-f0-9][a-f0-9])([a-f0-9][a-f0-9])([a-f0-9][a-f0-9])/i,
            function() {
                return parseInt(arguments[1], 16) + ',' +
                    parseInt(arguments[2], 16) + ',' +
                    parseInt(arguments[3], 16);
            }
        ).split(/,/),
        returnValue;

    // Return RGB(A)
    return !!rgb ?
        'rgb' + (alpha !== null ? 'a' : '') + '(' +
            Math[darker ? 'max' : 'min'](
                parseInt(decimal[0], 10) + difference, darker ? 0 : 255
            ) + ', ' +
            Math[darker ? 'max' : 'min'](
                parseInt(decimal[1], 10) + difference, darker ? 0 : 255
            ) + ', ' +
            Math[darker ? 'max' : 'min'](
                parseInt(decimal[2], 10) + difference, darker ? 0 : 255
            ) +
            (alpha !== null ? ', ' + alpha : '') +
            ')' :
        // Return hex
        [
            '#',
            pad(Math[darker ? 'max' : 'min'](
                parseInt(decimal[0], 10) + difference, darker ? 0 : 255
            ).toString(16), 2),
            pad(Math[darker ? 'max' : 'min'](
                parseInt(decimal[1], 10) + difference, darker ? 0 : 255
            ).toString(16), 2),
            pad(Math[darker ? 'max' : 'min'](
                parseInt(decimal[2], 10) + difference, darker ? 0 : 255
            ).toString(16), 2)
        ].join('');
};
var lighterColor = function(color, ratio) {
    return changeColor(color, ratio, false);
};
var darkerColor = function(color, ratio) {
    return changeColor(color, ratio, true);
};

$.xhrRetryPool = [];
$.xhrPool = [];
$.xhrPool.abortAll = function() {
    $(this).each(function(idx, jqXHR) {
			jqXHR.abort();
    });
    $.xhrPool.length = 0
};

$.ajaxSetup({
    beforeSend: function(jqXHR) {
			$.xhrPool.push(jqXHR);
    },
    complete: function(jqXHR) {
			var index = $.xhrPool.indexOf(jqXHR);
			if (index > -1) {
				$.xhrPool.splice(index, 1);
			}
    },
		error : function(xhr, textStatus, errorThrown ) {
			if(xhr.status == 401)
			{
				dots.users.show_login();
			}
			else
			{
				
				this.tryCount++;
				if (this.tryCount <= 3)
				{
					//try again
					$.ajax(this);
					return;
				}
				dots.robot.notify(lang['give_in']);
				return;
			}
		}
});
/****************** /helpers */


/****************** users */
dots.users.close = function()
{
	$('.user_screen').hide();
};

dots.users._reset_view = function()
{
	$(".login_signup_notify").html("").hide();
	
	$("#us_login_email,#us_login_password").val("");
	$("#us_reset_email").val("");
	$("#us_signup_email,#us_signup_password,#us_signup_password_again").val("");
	
	$(".user_screen .form_signup").hide();
	$('.user_screen .form_login').hide();
	$('.user_screen .form_reset').hide();
};

dots.users.show_login = function(show)
{
	dots.users._reset_view();
	
	$('.user_screen .form_login').show();
	$('.user_screen').show();
	
};

dots.users.show_signup = function(show)
{
	dots.users._reset_view();
	
		
	$(".user_screen .form_signup").show();
	$('.user_screen').show();
};

dots.users.show_reset = function(show)
{
	dots.users._reset_view();
	
	$('.user_screen .form_reset').show();
	$('.user_screen').show();
	
};

dots.users.login = function(e,p)
{
	var old_label = $("#us_login_btn").text();
	$("#us_login_btn").html("<img src='assets/255.gif' height='16' style='margin-top:6px;'>");
	$(".login_signup_notify").slideUp(300,function(){
		$(this).html("");
	});
	
	$.getJSON("/api/users/sign_in/?email="+e+"&password="+p,function(data){
		dots.popup.hide();
		$("#us_login_btn").html(old_label);
		if(data.status === true)
		{
			$("#main_login_button,#home_login_button").html(lang["logout"]).attr("onclick","dots.users.logout();");
			dots.users.close();
			dots.robot.notify(lang["logged_in_succesfully"]);
		}
		else if(data['error_text'] !== undefined)
		{
			$(".login_signup_notify").html(data.error_text).slideDown();
		}
	});
};

dots.users.signup = function(e,p,pr)
{
	var old_label = $("#us_signup_btn").text();
	$("#us_signup_btn").html("<img src='assets/255.gif' height='16' style='margin-top:6px;'>");
	$(".login_signup_notify").slideUp(300,function(){
		$(this).html("");
	});
	
	$.getJSON("/api/users/sign_up/?email="+e+"&password="+p+"&password_confirmation="+pr,function(data){
		$("#us_signup_btn").html(old_label);
		if(data.status === true)
		{
			dots.users.login(e,p);
		}
		else if(data['error_text'] !== undefined)
		{
			$(".login_signup_notify").html(data.error_text).slideDown();
		}
	});
};

dots.users.logout = function(e,p)
{
	$.getJSON("/api/users/sign_out",function(data){
		if(data.status === true)
		{
			last_shelf_data = [];
			$("#main_login_button,#home_login_button").html(lang["login"]).attr("onclick","dots.users.show_login();");
		}
	});
};

dots.users.reset_password = function(e)
{
	$.getJSON("/api/users/sign_out",function(data){
		if(data.status === true)
		{
			$("#main_login_button,#home_login_button").html(lang["login"]).attr("onclick","dots.users.show_login();");
		}
	});
};

/****************** /users */


/****************** popup */
dots.popup.show = function(html)
{
	if(html == 'loading')
	{
		var html = '';
		html += '<div class="droplist_loader"></div>';
	}
	setTimeout(function(){
		var t = last_clicked_element.closest('.popup_holder');
		var dl = $('.droplist');
		
		// :(
		dl.removeClass('dp_a').removeClass('dp_a');
		dl.removeClass('dp_f').removeClass('dp_f');

		if(t.hasClass('shelves'))
		{
			dl.addClass('dp_f');
		}
		else
		{
			dl.addClass('dp_a');
		}

		dl.find('.list').html(html);
		
		if(t!==undefined&&t.offset()!==undefined)
		{
			var dl_vars = {
				'left': t.offset().left,
				'top'	: t.offset().top + t.outerHeight() + 10
			};

			dl.find('.triangle').css('margin-left','0');

			if((t.offset().left + 300) > $(window).width())
			{
				dl_vars = {
					'left': t.offset().left - dl.outerWidth() + t.outerWidth(),
					'top'	: t.offset().top + t.outerHeight() + 10
				};
				dl.find('.triangle').css('margin-left','130px');
			}
			
			dl.css(dl_vars).fadeIn(100);
		}
		
		dl.fadeIn(100);

		$(window).on('click',dots.popup.hide);
		
	},10);
};

dots.popup.hide = function(event)
{
	if(event !== undefined &&
		(
			$(event.target).hasClass('shelves')||
			$(event.target).parent().hasClass('shelves')||
			$(event.target).hasClass('add_to_shelf')||
			$(event.target).parent().hasClass('add_to_shelf')||
			$(event.target).is("input")
		)
	)
	{
		// Fix
	}
	else
	{
		$('.droplist').stop().hide();
		$(window).off('click',dots.popup.hide);
	}
};
/****************** /popup */


/****************** robot */

/* deprecated
dots.robot.show_shelf = function(id)
{
	// #TODO
	console.log('asdas:' + id);
	var shelves = last_shelf_data;
	var shelf_data;
	
	for(var i=0; i<shelves.length; i++)
	{
		console.log(shelves[i].id);
		if(shelves[i].id == id)
		{
			shelf_data = shelves[i];
			
			$("#shelf_top_label").html(shelf_data.label);
			
			shelf_data_domains = shelf_data.domains;
			
			$("#shelf_domains_list").html("");
			
			for(var j=0; j<shelf_data_domains.length; j++)
			{
				var this_html = "";
				this_html += "";
				this_html += "<li>";
				this_html += "	<a class='domain_btn'>"+shelf_data_domains[j].full_body+"</a>";
        this_html += "";
				this_html += "	<a class='delete_domain_btn'>&#215;</a>";
				this_html += "	<a class='buy_domain_btn'>Buy</a>";
				this_html += "</li>";
				
				$("#shelf_domains_list").append(this_html);
				
			}
			$("#shelf_screen").show();
			
			console.log(shelf_data);
			return;
		}
	}
};

*/

dots.robot.combine = function(limit,domains)
{
	var r = [];
	
	var v = $('#beginnings').val();
	var beginnings = v.split(",");
	var endings = $('#endings').val() || [];
		
	// beginnings combine together and add TLDs
	for(var i=0; i<beginnings.length; i++)
	{
		var first = beginnings[i];
		
		for(var j=0; j<beginnings.length; j++)
		{
			if(j!=i)
			{
				var newa = first+beginnings[j];
				
				for(var x=0; x<domains.length; x++)
				{
					r.push([newa,'.'+domains[x].toLowerCase()]);
				}
			}
		}
	}
	
	// set endings
	var new_endings = [];
	
	for(var i=0; i<endings.length; i++)
	{
		var ending_id = endings[i];
		
		var ending_data;
		
		for(var c=0,ww=template_endings.length; c<ww; c++)
		{
			if(template_endings[c][3] == ending_id)
			{
				ending_data = template_endings[c][1].split(',');
			}
		}
		
		
		for(var j=0; j<ending_data.length; j++)
		{
			var trimmed_data = $.trim(ending_data[j]);
			
			new_endings.push(trimmed_data);
			
			var last_three = trimmed_data.charAt( trimmed_data.length-3 );
			var last_two = trimmed_data.charAt( trimmed_data.length-2 );
			var last_one = trimmed_data.charAt( trimmed_data.length-1 );
			
			if(last_two!="ss"&&last_one=="s")
			{
				
			}
			else if(last_three == "ies")
			{
				
			}
			else if(last_two == "es")
			{
				
			}
			else
			{
				new_endings.push(owl.pluralize(trimmed_data));
			}
		}
	}

	endings = new_endings;
	
	// Push them to r
	
	for(var i=0; i<beginnings.length; i++)
	{
		
		for(var c=0; c<domains.length; c++)
		{
			r.push([beginnings[i],'.'+domains[c].toLowerCase()]);
		}
		
		for(var j=0; j<endings.length; j++)
		{
			for(var c=0; c<domains.length; c++)
			{
				r.push([beginnings[i]+endings[j],'.'+domains[c].toLowerCase()]);
				//r.push([endings[j]+beginnings[i],'.'+domains[c].toLowerCase()]);
			}
		}
	}
	
	// Remove longer than limits
	if(limit!==undefined)
	{
		var new_r = [];
		for(var i=0; i<r.length; i++)
		{
			if(r[i][0].length <= limit)
			{
				new_r.push([r[i][0],r[i][1]]);
			}
		}
		r = new_r;
	}
	
	// And return 
	return r;
};

dots.robot.skip_domain = function(naa)
{
	m_i++;
	dots.robot.check_next();
};

dots.robot.finish = function()
{
	if(running_right_now)
	{
		running_right_now = false;
		//$('#progress_bar .percent').html(lang['completed']).addClass("progress_completed");
		//$('#progress_bar .bar').fadeOut(function(){
		//	$(this).css('width','0%').show();
		//});
		//$('#progress_bar .bg').fadeOut();
		
		$(".f_progress").slideUp();
		$('.progress_mini').hide();
		
		var tot = $('#results li').not(".is_not_available").length;
		if(tot==0)
		{
			if($('.animated_bg').is(':visible'))
				$('.animated_bg').hide();
			
			$('.avails').hide();
			$('.not_find').fadeIn();
			
		}
	}
};


dots.robot.get_chunk = function(n)
{
	var c = dots.helpers.chunk(m_arr,global_chunk_size);
	if(c[n] !== undefined && c[n].length > 0)
	{
		var r = "";
		for(var i=0; i<c[n].length; i++)
		{
			r += $.trim(c[n][i][0])+c[n][i][1]+",";
		}
		return r.substring(0, r.length - 1);
	}
	else
	{
		return false;
	}
};

dots.robot.echo = function(data)
{
	for(var i=0; i<data.length; i++)
	{
		if(data[i].available)
		{
			var check_has = false;
			
			// #TODO
			$('#results').find('li').each(function(){
				if($(this).find('.domain').text().indexOf(data[i].domain)!=-1)
				{
					check_has = true;
				}
			});
			
			if($('.animated_bg').is(':visible'))
				$('.animated_bg').hide();
			
			var this_tld = data[i].domain.split(".");
			this_domain = this_tld[0];
			this_tld = this_tld[1];
			
			var show_it = true;
			
			if(last_domain_filter.indexOf(this_tld)==-1)
			{
				show_it = false;
			}
			
			if(check_has == false)
			{
				$(".f_number").html(parseInt($(".f_number").html())+1);
				var append_html = "";
				
				append_html += '<li class="is_available '+(global_zebra_avail_i%2==0?"zebraed":"")+'" data-domain="'+this_domain+'.'+this_tld+'" data-tld="'+this_tld+'" '+((show_it==false)?"style='display:none;'":"")+'>';
				//append_html += '	<div class="score">'+(i+1)+'</div>';
				append_html += '	<div class="left">';
				append_html += '		<div class="domain"><i class="available"></i> '+data[i].domain+'</div>';
				append_html += '	</div>';
				append_html += '	<div class="extra">';
				append_html += '		<div class="buy_domain popup_holder r_btns" data-domain="'+data[i].domain+'">';
				
				append_html += '			' + dots.robot.create_buy_btn(data[i].domain,'<span aria-hidden="true" data-icon="&#xe002;"></span>');
				//append_html += '			<span aria-hidden="true" data-icon="&#xe002;"></span>';
				append_html += '		</div>';
				append_html += '		<div class="add_to_shelf popup_holder r_btns" data-domain="'+data[i].domain+'">';
				append_html += '			<span aria-hidden="true" class="slf" data-icon="&#xe000;"></span><span class="pls" aria-hidden="true" data-icon="&#xe001;"></span>';
				append_html += '		</div>';
				append_html += '	</div>';
				append_html += '</li>';
				// data-no-click="true"
				$('#results').append(append_html);
				global_zebra_avail_i++;
			}
		}
		// else
		// {
		// 	var append_html = "";
		// 	
		// 	var extras = "<span class='mini_btn whois'>"+lang['whois']+"</span> <span class='mini_btn ntf'>"+lang['notify_expire']+"</span>";
		// 	
		// 	append_html += '<li style="display:none;" class="is_not_available '+(global_zebra_navail_i%2==0?"zebraed":"")+'" data-tld="'+this_tld+'">';
		// 	//append_html += '	<div class="score">'+(i+1)+'</div>';
		// 	append_html += '	<div class="left">';
		// 	append_html += '		<div class="domain not_available_domain"><i class="available not_available"></i> '+data[i].domain+'</div>';
		// 	append_html += '	</div>';
		// 	append_html += '	<div class="extra">';
		// 	append_html += '		<div class="buy_domain popup_holder r_btns" data-domain="'+data[i].domain+'">';
		// 	append_html += '			<span aria-hidden="true" data-icon="&#xe002;"></span>';
		// 	append_html += '		</div>';
		// 	append_html += '		<div class="add_to_shelf popup_holder r_btns" data-domain="'+data[i].domain+'">';
		// 	append_html += '			<span aria-hidden="true" class="slf" data-icon="&#xe000;"></span><span class="pls" aria-hidden="true" data-icon="&#xe001;"></span>';
		// 	append_html += '		</div>';
		// 	append_html += '	</div>';
		// 	append_html += '</li>';
		// 	// data-no-click="true"
		// 	$('#results').append(append_html);
		// 	global_zebra_navail_i++;
		// }
		
	}

	if(global_lock_to_bottom)
	{
		$("html, body").animate({ scrollTop: $(document).height() }, 1000);
	}
};

dots.robot._echo = function(diff)
{
	$('#results li:lt('+diff+')').each(function(){
		$(this).animate({backgroundColor: '#cc0000'})
	});
};

dots.robot.create_buy_btn = function(domains,insidea)
{
	var this_id = new Date().getTime() + "_" + Math.floor(Math.random() * (9999 - 1000 + 1)) + 1000;
	
	var add_html = '<form id="'+this_id+'" action="http://dotshelter.com/domain-registration/index.php?action=check_availability&formaction=domain-name-registration.php" method="post"  target="_blank">';
	add_html += '<input type="hidden" name="txtDomainName" value="'+domains+'">';
	add_html += '<div onclick="document.getElementById(\''+this_id+'\').submit();">' + insidea + '</div>';
	add_html += '</form>';
	return add_html;
};

dots.robot.progress = function(perc)
{
	var percent = $('#progress_bar').find('.percent');
	var bar = $('#progress_bar').find('.bar');
	
	perc = (perc>100)?100:perc;
	perc = (perc<0)?0:perc;
	
	if (percent.hasClass("progress_completed"))
	{
	  percent.removeClass('progress_completed');
	}
	bar.stop().animate({
		width: perc + '%'
	},
	{
		duration:1500,
		step: function(now, fx) {
			var data = fx.elem.id + ' ' + fx.prop + ': ' + now;
			if(fx.prop=='width')
			{
				var now_perc = Math.floor(now);
				percent.html('%'+now_perc);
			}
		}
	});
};

dots.robot.calculate_progress = function()
{
	var processed = m_i*global_chunk_size;
	var total = m_arr.length;
	var perc = (processed*100)/total;
	
	return perc;
};

dots.robot.check_next = function()
{
	if(m_arr!==undefined)
	{
		var chunkie = dots.robot.get_chunk(m_i);
		running_right_now = true;
		
		console.log(chunkie);
		
		var calculated_progress = dots.robot.calculate_progress(m_i);
		dots.robot.progress(calculated_progress);
		
		
		if(chunkie != false && chunkie.length > 3)
		{
			$.getJSON("/api/domains/check?domains="+chunkie,function(data){
				dots.robot.echo(data.found);
			}).success(function() { 
				setTimeout(function(){
					m_i++;
					dots.robot.check_next();
				},1e3);
			});
		}
		else
		{
			setTimeout(function(){
				dots.robot.finish();
			},3e3);
		}
		
	}
	else
	{
		dots.robot.notify('ERR #01');
	}
};

dots.robot.add_endings = function(i)
{
	$('#te').addTag("___endings___"+i);
};

dots.robot.get_endings = function()
{
	$.getJSON("/api/domains/endings",function(data){

		template_endings = [];
		
		for(var i=0; i<data.length; i++)
		{
			template_endings.push([data[i].title, data[i].content, data[i].language, data[i].id]);
		}
	});
};

dots.robot.deck = function(open)
{
	if(open)
	{
		$('.endings_holder').stop().slideDown(150);
	}
	else
	{
		$('.endings_holder').stop().slideUp(150);
	}
};

dots.robot.check_placeholders = function(){
	var beginnings_holder_choices = $('#beginnings_tagsinput .tag').length;
	$('.beginning_placeholder').stop().hide();
	$('.dropdown_placeholder').stop().hide();
	
	if(beginnings_holder_choices == 0)
	{
		$('.beginning_placeholder').show();
	}
	
	var endings_holder_choices = $('.endings_holder .select2-search-choice').length;
	if(endings_holder_choices == 0)
	{
		$('.dropdown_placeholder').show();
	}
};

dots.robot.notifications = function()
{
	$.getJSON("/api/users/notifications",function(data){
		if(data.length > 0)
		{
			var return_notification = "";
			for(var i=0; i<data.length; i++)
			{
				var shelf_name = data[i]['d']['label'];
				var owners_m = data[i]['d']['shelf_owner'];
				owners_m = owners_m.split("@");
				owners_m = owners_m[0];
				
				dots.robot.seen_notification(data[i]['n']['id']);
				
				return_notification += "Woot! You've been granted access manage "
					+ "<a href='javascript:void(0);'>" + shelf_name + "</a> by " + owners_m + ".";
				
			}
			
			dots.robot.notify(return_notification);
		}
	});
};

dots.robot.seen_notification = function(id)
{
	if(seen_notifications.indexOf(id)==-1)
	{
		console.log("Seen notification: " + id);
		
		seen_notifications.push(id);
		
		dots.robot.clear_notifications_timeout();
		seen_notifications_timeout = setTimeout(dots.robot.clear_notifications,4e3);
	}
};

dots.robot.clear_notifications_timeout = function()
{
	seen_notifications_timeout = clearTimeout(seen_notifications_timeout);
	seen_notifications_timeout = null; // #ie
};

dots.robot.clear_notifications = function()
{
	dots.robot.clear_notifications_timeout();
	var seen_string = "";
	for(var i=0; i<seen_notifications.length; i++)
	{
		seen_string += "&seen[]=" + seen_notifications[i];
	}
	
	var seen_url = "/api/users/notifications/?" + seen_string;
	console.log(seen_url);
	
	$.getJSON(seen_url,function(data){
		console.log(data);
	});
};

dots.robot.update_filter = function(initer)
{
	last_domain_filter = [];
	
	$(".main_dc a").each(function(){
		if($(this).hasClass("domaincheck_active"))
		{
			last_domain_filter.push($(this).text().toLowerCase());
		}
	});
	
	if(initer!==true)
	{
		dots.robot._update_filter();
	}
};

dots.robot._update_filter = function()
{
	$("#results li").each(function(){
		var row_tld = $(this).data("tld").toLowerCase();
		if(last_domain_filter.indexOf(row_tld)==-1)
		{
			$(this).hide();
		}
		else
		{
			$(this).show();
		}
	});
	
	dots.robot.fix_zebras();
};

dots.robot.fix_zebras = function()
{
	var new_sebra_set_i = 0;
	$("#results li").each(function(){
		$(this).removeClass("zebraed").removeClass("zebraed").removeClass("zebraed").removeClass("zebraed");
		if(new_sebra_set_i%2==0)
		{
			$(this).addClass("zebraed")
		}
		new_sebra_set_i++;
	});
};

dots.robot.binds = function()
{
	
	$(".main_dc a").click(function(){
		if($(this).hasClass("domaincheck_active"))
		{
			$(this).removeClass("domaincheck_active");
		}
		else
		{
			$(this).addClass("domaincheck_active");
		}
		dots.robot.update_filter();
	});
	$(".lockbutton").click(function(){
		if($(this).hasClass("is_not_locked"))
		{
			$(this).removeClass("is_not_locked");
			
			$(this).find(".locked").show();
			$(this).find(".notlocked").hide();
			
			global_lock_to_bottom = true;
		}
		else
		{
			$(this).addClass("is_not_locked");
			
			$(this).find(".locked").hide();
			$(this).find(".notlocked").show();
			
			global_lock_to_bottom = false;
		}
	});
	
	dots.robot.notifications();
	
	$("body").on("click",".delete_domain_btn",function(){
		var domain_id = $(this).data("domain-id");
		var shelf_id = $(this).data("shelf-id");
		dots.shelf.remove(domain_id,shelf_id);
	});
	
	$("body").on("mousedown",".domain",function(){
		var a = $.trim($(this).text());
		_analytics.push($.base64.encode(a));
	});
	
	setInterval(function(){
		if(_analytics.length == 0)
		{
			return;
		}
		var temp = []; for(var i=0; i<_analytics.length; i++) { temp.push($.base64.decode(_analytics[i])); }
		var a = $.base64.encode(temp.toString());
		$.post("/api/analytics/?hash="+a,function(data){ if(data.status===true) { _analytics=[]; } });
		console.log(a);
	},7e3);
	
	$("#reset_password_btn").click(dots.users.show_reset);
	$("#reset_password_btn").click(dots.users.show_reset);
	
	//$("body").on("click",".buy_domain_btn",function(){
	//	alert($(this).data("domain"));
	//});
	
	$("#create_a_new_shelf_input").bind("keydown",function(event){
		if(event.keyCode==13&&$(this).val().length > 0)
		{
			$(this).attr('disabled','disabled');
			dots.shelf.create($(this).val());
			$(this).val("");
		}
	});
	
	$("body").on("click",".delete_shelf_button",function(){
		var conf = confirm("Are you really want to delete shelf?");
		
		if(conf)
		{
			dots.shelf.destroy(parseInt($(this).data("shelf-id")));
		}
	});
	
	$("#already_signup").click(dots.users.show_signup);
	$("#already_login").click(dots.users.show_login);
	
	$("#us_login_password,#us_login_email").on("keyup",function(event){
		if(event.keyCode == 13)
		{
			dots.users.login($('#us_login_email').val(),$('#us_login_password').val());
		}
	});
	
	$("#us_reset_btn").click(function(){
		dots.users.reset_password($('#us_reset_email').val());
	});
	
	$('#us_reset_email').on("keyup",function(event){
		if(event.keyCode==13&&$(this).val().length > 0)
		{
			dots.users.reset_password($(this).val());
		}
	})
	
	$('.not_avail').click(function(){
		if($(this).hasClass('active'))
		{
			$('.is_not_available').hide();
		}
		else
		{
			$('.is_not_available').show();
		}
		
		$('.not_avail').toggleClass('active');
	});
	
	$('.avail').click(function(){
		if($(this).hasClass('active'))
		{
			$('.is_available').show();
		}
		else
		{
			$('.is_available').hide();
		}
		
		$('.avail').toggleClass('active');
	});
	
	
	$('body').on('click','.mini_btn',function(){
		dots.robot.notify("You need to be a pro!");
	});
	
	$('.closer').click(function(){
		dots.users.close();
		$("#shelf_screen").hide();
	});
	
	$('#us_login_btn').click(function(){
		dots.users.login($('#us_login_email').val(),$('#us_login_password').val());
	});
	
	$('#us_signup_btn').click(function(){
		dots.users.signup($('#us_signup_email').val(),$('#us_signup_password').val(),$('#us_signup_password_again').val());
	});
	
	$('.fbconnect').click(function(){
		dots.robot.notify('Are u serious?');
	});
	
	$('.notification').click(function(){
		dots.robot._notify();
		$('.notification').slideUp();
	});
	
	$('.not_find a').click(function(){
		dots.robot.state('home');
	});
	
	$('.char_limit').keyup(function(){
		var ths = $(this);
		setTimeout(function(){
				ths.val(ths.val().toLowerCase().replace(/[^0-9]/g, ''));
		},1e2);
	});
	$('.cancel_btn').click(function(){
		dots.robot.state('home');
	});
	
	$('.remove_from_shelf').click(function(){
		var clicked = $(this);
		var domain_id = clicked.data('domain-id');
		var shelf_id = clicked.data('shelf-id');
		dots.shelf.remove(domain_id,shelf_id);
	});
	
	$('body').on('click','.add_to_shelf', function(){
		var clicked = $(this);
		var domain = clicked.data('domain');
		last_clicked_domain = domain;
		dots.shelf.add(domain);
	});
	
	$(".home_dc").find('.domaincheck').click(function(){
		if($(this).hasClass('domaincheck_active'))
		{
			$(this).removeClass('domaincheck_active');
		}
		else
		{
			$(this).addClass('domaincheck_active');
		}
	});
	
	$('#robot_button').click(dots.robot.init);
	
	$('#beginnings').tagsInput({
		width: '620px',
		height:'40px',
		'defaultText': '',
		'minChars' : 2,
		onChange: function(){
			
			dots.robot.check_placeholders();
			
			dots.robot.fix_ending_tags();
			
		},
		'onAddTag': function(e){
			if(e!=last_fixed_tag&&e!="")
			{
				var old_c = e;
				$(this).removeTag(e);
				var fix_c = dots.helpers.fixtr(old_c);
				last_fixed_tag = fix_c;
				$(this).addTag(fix_c);
				$('#beginnings_tag').focus();
			}
		}
	});
	
	$('.taggable_input').tagsInput({
		width: '940px',
		height:'100px',
		'defaultText': 'add',
		'minChars' : 2
	});
	
	$('body').on('click','.add_ending_button', function(){
		var clicked = $(this);
		var ending_id = clicked.data('ending-id');
		dots.robot.add_endings(ending_id);
	});
	
	$('#begginings_tag').on('keydown',function(event){
		var ek = event.ctrlKey || event.altKey || event.metaKey;
		var et = $(this);
		
		setTimeout(function(){
			if(!ek)
				et.val(dots.helpers.fixtr(et.val()));
		},1e2);
	});
	
	$('body').on('click','.tag',function(event){
		var ths = $(this);
		setTimeout(function(){
			dots.popup.show('loading');
			dots.robot.brainstorm(ths.find('span').text(),ths);
		},100);
	});
	
	$('.global_shelves_button').click(function(){
		dots.popup.show('loading');
		dots.shelf.index();
	});
	
	$(window).resize(function(){
		dots.popup.hide();
	});
		
	$('body').on('keypress', '.create_shelf_input', function(e) {
		if(e.which == 13)
		{
			dots.shelf.create_from_droplist($(this).val());
		}
	});	
	
	$('#right_triangle_button').hover(function(){
		var tri = $(this).children();
		if(!tri.hasClass('right_triangle_upside_down'))
			tri.addClass('right_triangle_hover');
	},function(){
		var tri = $(this).children();
		if(!tri.hasClass('right_triangle_upside_down'))
			tri.removeClass('right_triangle_hover');
	}).mousedown(function(){
		$(this).children().addClass('right_triangle_active');
	}).mouseup(function(){
		$(this).children().removeClass('right_triangle_active');
	}).click(function(){
		var toggle = ($(this).data('toggle') == undefined) ? true : $(this).data('toggle');
		
		if(toggle)
		{
			$(this).children().addClass('right_triangle_upside_down');
		}
		else
		{
			$(this).children().removeClass('right_triangle_upside_down');
		}
		
		dots.robot.deck(toggle);
		$(this).data('toggle', !toggle);
	});
	
	$('.dropdown_placeholder').click(function(e){
		$("#endings").select2('open');
	});
	$('.beginning_placeholder').click(function(e){
		$('#beginnings_tag').focus();
	});
	
	$('body').on('blur','.select2-input',function(){
		dots.robot.check_placeholders();
	});
	$('body').on('blur','#beginnings_tag',function(){
		dots.robot.check_placeholders();
	});
	
	$('body').on('focus','.select2-input',function(){
		$('.dropdown_placeholder').stop().hide();
	});
	$('body').on('focus','#beginnings_tag',function(){
		$('.beginning_placeholder').stop().hide();
	});
	
	$("#endings").select2({
		minimumInputLength: 0,
		maximumSelectionSize: 3
	});
	
	dots.open_curtain();
	
	$(document).click(function(event) {
		last_clicked_element = $(event.target);
	});
	
};

dots.open_curtain = function() {
	setTimeout(function(){
		$('#m_curtain .logo_holder').fadeIn(700, function(){

			setTimeout(function(){
				$('#m_curtain').fadeOut();
			},1000);
			
		});
	},1000);
};

dots.robot.brainstorm = function(word,src)
{
	word = dots.helpers.fixtr(word);
	
	var go_query = '/api/domains/related_words/';
	go_query += '?word=' + $.trim(word);
	
	$.getJSON(go_query,function(data){
		var popup_html = "No results";
		
		if(data.length > 0)
			popup_html = "";
			
		for(var i=0; i<data.length; i++)
		{
			if(data[i].words.length > 0)
			{
				var rel_type = data[i].relationship_type.capitalize();
				
				if(rel_type == "Etymologically-related-term")
					rel_type = "Etymologically Related";
					
				popup_html += "<li class='related_word_type'>";
				popup_html += "	" + rel_type;
				popup_html += "</li>";
				
				for(var j=0; j<data[i].words.length; j++)
				{
					popup_html += "<li>";
					popup_html += "	<a href='javascript:void(0);' onclick='dots.robot.add_tag(\""+data[i].words[j]+"\")'>";
					popup_html += "		"+dots.helpers.fixtr(data[i].words[j])+"";
					popup_html += "	</a>";
					popup_html += "</li>";
				}
			}
			
			
		}
		dots.popup.show(popup_html);
		
	});
	
	/*
	
	
	*/
};

dots.robot.add_tag = function(b,e)
{
	if(b!==null&&b!==undefined)
	{
		$('#beginnings').addTag(b);
	}
	if(e!==null&&e!==undefined)
	{
		alert(e);
	}
};

dots.robot.init = function(e)
{
	$(".f_progress").slideDown();
	$(".f_number").html(0);
	
	global_zebra_navail_i = 0;
	global_zebra_avail_i = 0;
	
	if(template_endings.length == 0)
	{
		dots.robot.get_endings();
		setTimeout(function(){
			dots.robot.init(e);
		},2e3);
	}
	
	$('#progress_bar .bg').show();
	$('.progress_mini').hide();
	//$('.avails').show();
	$('.not_find').hide();
	
	var cl = parseInt($('input[name=char_limit]').val());
	cl = (cl > 3) ? cl : 30;
	
	$(".main_dc a").each(function(){
		$(this).hide();
	});
	
	var domains = [];
	
	$(".home_dc").find('.domaincheck_active').each(function(){
		var domains_text = $(this).html();
		domains.push(domains_text);
		$(".main_dc a").each(function(){
			if($(this).text()==domains_text)
			{
				$(this).addClass("domaincheck_active").show();
			}
		});
	});
	
	dots.robot.update_filter(true);
	
	var r = dots.robot.combine(cl,domains);
	
	m_arr = r;
	m_i = 0;
	
	dots.robot.state('main');
	
	$('#status').html('Checking domains, please wait..<br><img src="/assets/loading.gif">');
	
	dots.helpers.r_arr(m_arr);
	
	dots.robot.check_next();
};

dots.robot.fix_ending_tags = function()
{
	/*
	$('#begginings_tagsinput .tag').each(function(){
		if($(this).text().indexOf('___endings___')!=-1)
		{
			var fix_expand_i = $(this).text().replace('___endings___','');
			fix_expand_i = parseInt(fix_expand_i);
			var fix_expand = template_endings[fix_expand_i][1];
			
			$(this).addClass('tag_is_active')
				.find('span')
				.html(template_endings[fix_expand_i][0]+'&nbsp;&nbsp;');
			
			$(this).append('<input type="hidden" class="tag_expand" value="'+fix_expand+'">');
		}
	});

	$('#begginings_tagsinput .tag_is_active').each(function(){
		$('.endings_holder').find('[data-title="'+$.trim($(this).find('span').text())+'"]').hide();
	});
	
	*/
};

dots.robot.state = function(go_state)
{
	if(is_first_run)
	{
		is_first_run = false;
		last_navigation_state = 'home';
		$('.animated_bg').hide();
		$('#main').stop().hide();
		$('#home').stop().show();
		return;
	}
	
	if(running_right_now)
	{
		var conf = confirm(lang['really_want_to']);

		if(!conf)
		{
			return;
		}
	}
	
	$("html, body").animate({ scrollTop: 0 }, "slow");
	
	$('.notification').removeClass('main_type').removeClass('main_type');
	$('.notification').removeClass('user_type').removeClass('user_type');
	
	$('.user_screen .form_login').hide();
	$('.user_screen .form_signup').hide();
	
	if(go_state == '-1')
	{
		dots.robot.state(last_navigation_state);
		return;
	}
	
	if(go_state == 'home')
	{
		last_navigation_state = go_state;
		$('.animated_bg').hide();
		$('#main').stop().hide();
		$('#home').stop().show();
		$('#results').html('');
		dots.robot.progress(0);
	}
	else if(go_state == 'main')
	{
		last_navigation_state = go_state;
		$('.animated_bg').show();
		setTimeout(function(){
			$('#main').stop().show();
			$('#home').stop().hide();
			$('.notification').addClass('main_type');
		},1e3);
	}
};

dots.robot.notify = function(s)
{
	dots.robot._notify();
	
	$('.notification .info_text').html(s);
	$('.notification').stop().slideDown();
	
	dots_robot_alert_timeout = setTimeout(function(){
		$('.notification').stop().slideUp();
	},6500);
};

dots.robot._notify = function()
{
	dots_robot_alert_timeout = clearTimeout(dots_robot_alert_timeout);
	dots_robot_alert_timeout = null;
};
/****************** /robot */


/****************** shelf */
dots.shelf.popup_index = function(todo,focus_input)
{
	last_todo_string = todo;
	
	$.getJSON('/api/shelves/',function(data){
		
		last_shelf_data = data;
		
		var popup_html = "<li>No shelves</li>";
		
		if(data.length > 0)
			popup_html = "";
		
		popup_html += "<li>";
		popup_html += "	<input type='text' class='create_shelf_input' placeholder='Create a shelf?'>";
		popup_html += "</li>";
			
		for(var i=0; i<data.length; i++)
		{
			popup_html += "<li class='shelf_border'>";
			popup_html += "	<a href='javascript:void(0);' onclick='"+todo.replace('__ID__',data[i].id)+"'>";
			popup_html += "		"+data[i].label+"";
			popup_html += "	</a>";
			popup_html += "</li>";
		}
		dots.popup.show(popup_html);
		
		setTimeout(function(){
			if(focus_input)
				$('.create_shelf_input').focus();
		},1000);
		
	});
};

dots.shelf.index = function()
{
	// #TODO
	
	if(last_shelf_data===undefined||last_shelf_data===null||last_shelf_data.length == 0)
	{
		dots.shelf.get_and_parse_index();
	}
	else
	{
		dots.shelf.parse_index();
	}
};

dots.shelf.get_and_parse_index = function()
{
	$.getJSON('/api/shelves/',function(data){
		last_shelf_data = data;
		dots.shelf.parse_index();
	});
};

dots.shelf.parse_index = function()
{
	$("#create_a_new_shelf_input").val("").removeAttr("disabled");
	
	var shelves = last_shelf_data;
	var this_html = "";
		
	for(var i=0; i<shelves.length; i++)
	{
		shelf_data_domains = shelves[i].domains;
		
		var domains_stringz = [];
		for(var foo=0; foo<shelf_data_domains.length; foo++)
		{
			domains_stringz.push(shelf_data_domains[foo].full_body);
		}
		
		domains_stringz = domains_stringz.join(",");
	
		this_html += '<div class="former domain_former">';
		this_html += '	<div class="top_text">';
		this_html += '		<span id="shelf_top_label">'+shelves[i].label+' <span class="shelf_count">('+(shelf_data_domains.length>0?shelf_data_domains.length+" "+lang["domains"]:lang["empty"])+')</span></span>';
		this_html += '		<a class="delete delete_shelf_button" data-shelf-id="'+shelves[i].id+'">';
		this_html += '			X';
		this_html += '		</a>';
		this_html += '		<a class="check check_shelf_button" data-shelf-id="'+shelves[i].id+'" style="'+(shelf_data_domains.length > 0?"":"display:none;")+'">';
		this_html += '			'+ dots.robot.create_buy_btn(domains_stringz,lang["check_out"]);
		this_html += '		</a>';
		this_html += '	</div>';
    this_html += '';
		
		
		if(shelf_data_domains.length > 0)
		{
			this_html += '	<ul class="domains_list">';

			for(var j=0; j<shelf_data_domains.length; j++)
			{
				var this_inner_html = "";
				this_inner_html += "";
				this_inner_html += "<li>";
				this_inner_html += "	<a class='domain_btn'>"+shelf_data_domains[j].full_body+"</a>";
	      this_inner_html += "";
				this_inner_html += "	<a class='delete_domain_btn' href='javascript:void(0);' data-domain-id='"+shelf_data_domains[j].id+"' data-shelf-id='"+shelves[i].id+"'>&#215;</a>";
				// this_inner_html += "	" + dots.robot.create_buy_btn(shelf_data_domains[j].full_body,"Buy");
				this_inner_html += "	<a class='buy_domain_btn'  href='javascript:void(0);' data-domain='"+shelf_data_domains[j].full_body+"'>"+dots.robot.create_buy_btn(shelf_data_domains[j].full_body,lang["buy"])+"</a>";
				this_inner_html += "</li>";

				this_html += this_inner_html;
			}

			this_html += '	</ul>';
		}
		
		this_html += '</div>';
	}
	
	$("#shelves_listing").html(this_html);
	
	$("#shelf_screen").show();
};

dots.shelf.create_from_droplist = function(shelf_label)
{
	var from_header = $('.droplist').hasClass('dp_f');
	
	if(from_header)
	{
		dots.shelf.add("", 0, shelf_label);
	}
	else
	{
		dots.shelf.add(last_clicked_domain, 0, shelf_label);
	}
	
};

dots.shelf.create = function(shelf_label)
{
	$.getJSON("/api/shelves/create/?shelf_label=" + shelf_label,function(data){
		if(data.status==true)
		{
			last_shelf_data = [];
			dots.shelf.index();
		}
		else if(data.error_text!==undefined)
		{
			dots.robot.notify(data.error_text);
		}
	});
};

dots.shelf.destroy = function(shelf_id)
{
	$.getJSON("/api/shelves/destroy/?shelf_id=" + shelf_id,function(data){
		if(data.status==true)
		{
			last_shelf_data = [];
			dots.shelf.index();
		}
		else if(data.error_text!==undefined)
		{
			dots.robot.notify(data.error_text);
		}
	});
};

dots.shelf.add = function(domain, shelf_id, shelf_label)
{
	var add_string = "/api/shelves/add/?domain="+domain;
	
	if(domain!==undefined)
	{
		if(shelf_id!==undefined&&shelf_id!=0)
		{
			add_string += "&shelf_id="+shelf_id;
		}
		else if(shelf_label!==undefined)
		{
			add_string += "&shelf_label="+shelf_label;
		}
		else
		{
			dots.popup.show('loading');
			dots.shelf.popup_index('dots.shelf.add("'+domain+'",__ID__)');
			return;
		}

		$.getJSON(add_string,function(data){
			if(data.status==true)
			{
				if(domain=='')
				{
					last_shelf_data = [];
					dots.shelf.popup_index(last_todo_string,true);
					dots.shelf.index();
				}
				else
				{
					
					last_shelf_data = [];
					
					if(shelf_label!==undefined)
					{
						dots.robot.notify(lang['created_and_added']);
						dots.shelf.popup_index(last_todo_string,true);
					}
					else
					{
						dots.robot.notify(lang['added']);
					}
				}
			}
			else
			{
				dots.robot.notify(data.error_text);
			}
		});
	}
	
};

dots.shelf.remove = function(domain_id,shelf_id)
{
	$.getJSON("/api/shelves/remove/?domain_id="+domain_id+"&shelf_id="+shelf_id,function(data){
		if(data.status == true)
		{
			$('*[data-domain-id="'+domain_id+'"]').parent().slideUp();
		}
		else
		{
			dots.robot.notify(data.error_text);
		}
	});
};
/****************** /shelf */


$(document).ready(function(){
	dots.robot.binds();
});