-- MySQL dump 10.13  Distrib 5.6.10, for osx10.8 (x86_64)
--
-- Host: localhost    Database: dc_development
-- ------------------------------------------------------
-- Server version	5.6.10

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `analytics`
--

DROP TABLE IF EXISTS `analytics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `report_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics`
--

LOCK TABLES `analytics` WRITE;
/*!40000 ALTER TABLE `analytics` DISABLE KEYS */;
INSERT INTO `analytics` VALUES (2,'uberszio.com','domain',0,'2013-04-10 17:23:05','2013-04-10 17:23:05'),(3,'uberspoint.com','domain',0,'2013-04-10 17:23:05','2013-04-10 17:23:05'),(4,'ubersba.com','domain',0,'2013-04-10 17:23:05','2013-04-10 17:23:05'),(5,'asdadadsadsa.com','domain',0,'2013-04-10 22:19:04','2013-04-10 22:19:04'),(6,'asdfasdfas.org','domain',0,'2013-04-12 14:58:43','2013-04-12 14:58:43'),(7,'dgadsgkasksadgamechanic.com','domain',0,'2013-04-12 15:31:39','2013-04-12 15:31:39'),(8,'dfsgsdgsdgsdfgopia.net','domain',0,'2013-04-12 15:58:42','2013-04-12 15:58:42');
/*!40000 ALTER TABLE `analytics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shelf_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `body` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tld` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_body` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_domains_on_shelf_id` (`shelf_id`),
  KEY `index_domains_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domains`
--

LOCK TABLES `domains` WRITE;
/*!40000 ALTER TABLE `domains` DISABLE KEYS */;
INSERT INTO `domains` VALUES (2,1,3,'wowowowowboat','com','wowowowowboat.com','default','2013-04-12 21:33:06','2013-04-12 21:33:06'),(3,4,3,'kasabouts','com','kasabouts.com','default','2013-04-13 01:53:41','2013-04-13 01:53:41'),(4,4,3,'kastrekking','com','kastrekking.com','default','2013-04-13 01:54:34','2013-04-13 01:54:34');
/*!40000 ALTER TABLE `domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endings`
--

DROP TABLE IF EXISTS `endings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `price` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endings`
--

LOCK TABLES `endings` WRITE;
/*!40000 ALTER TABLE `endings` DISABLE KEYS */;
INSERT INTO `endings` VALUES (5,'Travel & Leisure','venue, place, value, history, live, biking, bike, rent, atv, sail, sailing, boat, edition, jaunt, journey, omotion, pade, quest, range, roam, tour, trek, vant, venture, voyage, about, boat, craft, cruiser, cutter, ferry, frigate, monitor, rigger, schooner, skiff, sloop, trawler, safari, biking, bike, backpacking, animals, animal, architecture, art, canoeing, canoe, climbing, climb, culture, ruins, ruin, fishing, fish, history, hiking, training, train, mountain, mount, outdoor, photography, boats, boat, sailing, sail, snowboarding, snowboard, skiing, touring, tour, shiping, ship, trekking, explorer, exploring, discovery, walking, walk, rafting, raft, water, skiing, ski, wilderness, geographic, path, camping, camp, cycling, cycle, hiking, surfing, surf, agent, agents, agency, agencies, commercial, business, online, world, romance, love, travel, expensive, cheap, hotel, hotels, motel, motels, adventure, adventures, tourism, popular, coast, sea, voyage, voyages, package, virtual, route, sacred, excursion, cruise, cruises, rentals, rental, service, public, private, transit, ticket, tickets, airline, airlines, guides, guide, plan, history, tour, tours, asia, africa, europe, oceania, north, south, museum, museums, island, islands, beach, beachs, temple, temples, river, rivers, extreme, ghetto, wildlife, water, geography, sports, space, shark, culture, cultural, alternative, international, national, domestic, culinary, ethno, health, nautical, religious, religion, internal, outbound, inbound, hotel, hotels, suite, boutique, luxury, lux, cheap, meeting, meet, resort, resorts, corporate, spa, casinos, casino, airport, business, family, leisure, apartment, eco, love, holiday, motels, motel, spa, fine, dinning, nightout, magazine, inn, booking, book, guide, tour, holiday, boutique, cheaphotel, book, weather, breakfast, bnb, assist, safe, marine, airport, transport, transfer, transit, harbour, lake, sea, local, coffee, bar, club, nightlife, life, routine, native, estate, rent, villa, apart, cheap, flight, route, magazine, mag, inside',0,'2013-04-13 01:46:07','2013-04-13 01:46:07','en'),(6,'Computers & Technology & Internet & Games','adventure, battle, casual, compete, console, fun, game, match, mmo, play, sim, strategy, video, bit, buzz, code, data, digi, giga, info, link, object, tech, tele, trade, venture, verti, atom, atomi, bit, micro, mini, pint, pico, tiny, unit, sport, sports, arcade, emulator, action, adventure, strategy, racing, simulator, simulation shooting, fps, frp, rpg, rpgs, puzzle, skill, ball, paddle, fight, maze, pinball, platform, platforms, shooter, mmo, tactic, tactical, gun, stealth, survival, horror, war, battle, tower, board, electronic, casual, art, rail, mmorpg, browser, console, mobile, multiplayer, card, board, role, play, flash, word, ps, xbox, dota, lol, wow, league, leagues, fire, player, players, char, guard, shield, game, games, video, videos, image, images, img, graphics, hardware, internet, technology, multi, media, medias, multimedia, program, soft, ware, software, online, offline, digital, mouse, board, serial, storage, memory, power, cache, logic, analog, system, systems, main, frame, mobile, server, servers, ware, smart, mobile, add, adders, gate, array, signal, data, unit, socket, sockets, open, close, tube, smart, clone, control, area, network, info, box, form, device, devices, optic, database, dos, micro, net, dot, access, spot, spots, ip, link, module, mode, modes, disk, connect, hd, solid, client, clients, code, codes, encode, touch, multi, key, keys, layout, screen, text, scan, point, user, move, web, print, app, console, block, cmd, line, cloud, chrome, supply, tape, backup, protect, file, host, share, click, archive, format, tool, tools, list, lists, name, names, archive, binary, bug, codec, audio, contain, split, edit, editor, pack, packets, title, titles, mail, script, lang, doc, domain, source, store, stores, sub, warez, bit, torrent, site, sites, proxy, band, broad, content, browser, region, status, message, msg, forward, chat, clear, use, talk, transfer, agent, agents, delivery, spam, filter, social, secure, safety, bot,  manage, real, time, station, temp, series, remote, desk, project, stream, voice, library, cast, theme, blog, blogs, icon, copy, advanced, search, directory, direct, active, capture, word, words, private, public, portal, usage, global, group, groups, forum, engine, sphere, service, op, gallery, method, market, bank, banks, product, products, model, models, center, centers, set, signal, record, config, quality, centric, port, place, dynamic, type, types, event, events, high, robot, class, pattern, cyber, select, build, builder, expert, join, space, esc, delete, del, insert, lock, enter, caps, wave, sound, sounds, camera, cam, auto, focus, movie, movies, film, films, number, num, chart, loop, academy, launch, local, tips, misc, tracks, music, radio, tag, mix, sing, live, visual, effect, guide, lab, land, up, down, load, loader, slide, trailer, stage, volume, vol, object, player, players, way, road, life, core, chip, co, virtual, shop, self, target, rapid, index, machine, view, limit, term, trade, farm, boot, reader, token, hot, drive, switch, non, scroll, shift, toggle, bar, banner, dial, hit, page, home, hyper, my, pay, ping, map, maps, sky, static, dev, zone, add, alert, cell, check, menu, cut, dash, drag, drop, find, finder, folder, master, log, macro, office, raw, pup, pop, quick, bin, root, run, pack, skin, snap, start, task, tutorial, utility, clean, room, crop, full, on, off, login, null, pixel, push, rate, safe, stand, table, post, zip, rar, byte, mega, only, reset, guard, tech, save, elite, shell, maker, band, circuit, cluster, frame, line, link, net, port, route, station, switch, torrent, base, bay, bin, case, deck, dock, hold, house, shelf, stack, store, vault, cast, cube, digita, feed, fire, ology, space, span, technica, ware, wire, works, atar, blog, bot, bug, flash, host, icon, source, src, space, ware, way, work, base, bit, code, load, map, module, script, serv, server, set, state, system, token, tag, unit, blab, buzz, club, cube, mix, nic, opia, pad, path, point, space, sphere, vine, zone, zoom, ble, ba, deo, do, jo, mbo, ndo, nix, tz, vee, yo, zio, zu, zzle, cloud, colony, flight, flock, gaggle, herd, horde, pack, pod, pride, shoal, swarm, tribe, troop, ality, ate, ient, ify, ity, ium, ius, ize, izer, nik, opoly, ster',0,'2013-04-13 01:47:00','2013-04-13 01:47:00','en'),(7,'Music & Graphics & Arts','ly, tint, hue, draft, sketch, vox, visi, band, clan, club, crew, gang, group, guild, league, lot, mob, order, party, squad, team, troop, brush, paint, color, colors, white, pink, red, orange, brown, yellow, green, blue, purple, gray, black, amber, aqua, azure, bronze, coral, copper, crimson, cyan, ginger, gold, hazel, indigo, jade, silver, logo, logos, design, designer, studio, studios, print, poetry, pattern, patterns, writer, writers, font, photoshop, fontshop, fusion, paint, page, layout, adobe, suite, artwork, art, arts, line, grid, clip, cover, creative, pic, picture, pictures, vector, style, styler, image, images, poster, neo, motion, effect, effects, texture, map, opengl, directx, engine, engines, visual, display, texture, light, draw, gallery, retina, node, sub, wave, listen, hear, noise, art, artist, tablet, pen, dye, amp, hear, voice, synth, play, watch, see, dude, puff, audio, video, vid, pixel, note, sketch, draw, drawing, inspiration, inspire, woot, roll, rock, zine, bang, pow, band, press, beat, tune, radio, bass, dub, step, shake, vibe, color, chill, out',0,'2013-04-13 06:21:21','2013-04-13 06:21:21','en'),(8,'Colors & Tones','white, pink, red, orange, brown, yellow, green, blue, purple, gray, black, amber, aqua, azure, bronze, coral, copper, crimson, cyan, ginger, gold, hazel, indigo, jade, silver, aero, blue, violet, alice, alloy, amazon, amber, almond, green, white, brass, bronze, ruby, apricot, ao, ash, grey, ashgrey, auburn, aqua, arsenic, azure, pink, powder, red, bazaar, beaver, beige, bisque, bistre, brown, bitter, black, bean, olive, lime, blond, sapphire, yonder, bole, blush, bone, bondi, bone, brick, buff, rose, burnt, cadet, poly, cal, camel, cameo, capri, cardinal, caribbean, carrot, orange, carnelian, cerise, cherry, chocolate, yellow, cinnabar, cinnamon, coral, copper, congo, corn, cream, cyan, grape, silk, latte, candy, dark, blue, chestnut, gray, jungle, liver, lavender, magenta, midnight, night, sienna, sky, slate, spring, tan, taupe, vanilla, deep, carmine, space, taupe, tuscan, deer, denim, desert, sand, diamond, dirt, dodger, drab, ecru, ebony, eton, fern, feldspar, fawn, fallow, flax, folly, fresh, fuzzy, ginger, glitter, go, grape, grullo, indigo, dye, warm, iris, jade, jasper, jet, berry, keppel, kobe, kobi, lava, lapis, lemon, glacier, curry, light, linen, lust, maize, mantis, mauve, melon, midori, mint, kimado, whip, dew, snow, lace, golden, honey, glow, sun, straw',0,'2013-04-13 06:21:41','2013-04-13 06:21:41','en'),(9,'Transport & Freight','about,boat,craft,cruiser,cutter,ferry,frigate,rigger,schooner,skiff,sloop,trawler,train,route,go,fly,road,sign,rail,transfer,transport,transit,trans,gogo,bike,car,ship,water,way,ski,jet,step,move,land,air,water,tir,line',0,'2013-04-25 18:58:40','2013-04-25 18:58:40','en'),(10,'Telecommunication','wire,host,port,post,tube,dial,tone,connect,cable,hub,get,direction,direct,way,press,stream,watch,read,bit,byte,graph,gram,push,pull',0,'2013-04-25 18:59:56','2013-04-25 18:59:56','en'),(11,'Startups & Small Business','unit,alizer,builder,itect,ineer,inator,maker,mason,mechanic,miller,smith,wright,uber,vibe,rush,gogo,yard,ify,ity,ium,ius,ize,izer,nik,opoly,ster,gram,co,team,work,ace,igy,mage,mancer,maven,uoso,pro,runner,sage,star,wizard,wiz,puff,tech,signal,nest,echo,blog,bite,byte,woot,alizer,builder,itect,ineer,inator,maker,mason,mechanic,miller,smith,wright,note,bucks,cash,coin,ero,inero,funds,loot,pay,ency,ney,ace,igy,mage,mancer,maven,uoso,pro,runner,sage,star,wizard,wiz',0,'2013-04-25 19:00:20','2013-04-25 19:48:16','en'),(12,'Mining & Materials','ore,lava,barite,bornite,dolomite,cinnabar,beryl,galena,gold,magnetite,volcano,rock,glass,erb,neo,albite,borax,copper,cerite,diamond,silver,flame,opal,pearl,ruby,crystal,sapphire,onyx,emerald,zircon,yogo,topaz,jade,garnet,facet,tin,titanium,titan,coal,salt,tin,silver,uranium,lead,coal',0,'2013-04-25 19:00:48','2013-04-25 19:00:48','en'),(13,'Energy & Utility','alizer,builder,itect,ineer,inator,maker,mason,mechanic,miller,smith,wright,wind,sea,aero,alternative,thermal,power,watt,sun,bio,mass,offshore,farm,source,energy,solar,shine,silicone,green,hydro,biofuel,biomass,turbine,global,swell,yield,yard,kinetic,heat,light,wave,joule,watt,earth,magnet,ecology,eco,system,eer,el,electro,voltage,carbon,capacity,coke,oil,gas,cord,curie,mine,delta,demand,dump,fusion,hertz,hybrid,laser,light,lumen',0,'2013-04-25 19:01:15','2013-04-25 19:01:15','en'),(14,'Shop & Retail','collection,selection,ware,boutique,sells,shopping,item,pick,select,keep,keeper,merchant,baron,ster,mogul,monger,master,seller,saler,shop,foundry,forge,form,mill,works,mill,tory,tary,ary,ery,al,stock,pay,shop,price,prices,store,online,gift,mark,trade,order,express,free,outlet,best,sell,seller,bag,add,vendor,ticket,service,buy,rent,list,market,place,share,house,planet,mall,collect,maker,center,zone,spot,buy,collect',0,'2013-04-25 19:01:53','2013-04-25 19:01:53','en'),(15,'Computers & Technology & Internet & Games','adventure,battle,casual,compete,console,fun,game,match,mmo,play,sim,strategy,video,bit,buzz,code,data,digi,giga,info,link,object,tech,tele,trade,venture,verti,atom,atomi,bit,micro,mini,pint,pico,tiny,unit,sport,sports,arcade,emulator,action,adventure,strategy,racing,simulator,simulation shooting,fps,frp,rpg,rpgs,puzzle,skill,ball,paddle,fight,maze,pinball,platform,platforms,shooter,mmo,tactic,tactical,gun,stealth,survival,horror,war,battle,tower,board,electronic,casual,art,rail,mmorpg,browser,console,mobile,multiplayer,card,board,role,play,flash,word,ps,xbox,dota,lol,wow,league,leagues,fire,player,players,char,guard,shield,game,games,video,videos,image,images,img,graphics,hardware,internet,technology,multi,media,medias,multimedia,program,soft,ware,software,online,offline,digital,mouse,board,serial,storage,memory,power,cache,logic,analog,system,systems,main,frame,mobile,server,servers,ware,smart,mobile,add,adders,gate,array,signal,data,unit,socket,sockets,open,close,tube,smart,clone,control,area,network,info,box,form,device,devices,optic,database,dos,micro,net,dot,access,spot,spots,ip,link,module,mode,modes,disk,connect,hd,solid,client,clients,code,codes,encode,touch,multi,key,keys,layout,screen,text,scan,point,user,move,web,print,app,console,block,cmd,line,cloud,chrome,supply,tape,backup,protect,file,host,share,click,archive,format,tool,tools,list,lists,name,names,archive,binary,bug,codec,audio,contain,split,edit,editor,pack,packets,title,titles,mail,script,lang,doc,domain,source,store,stores,sub,warez,bit,torrent,site,sites,proxy,band,broad,content,browser,region,status,message,msg,forward,chat,clear,use,talk,transfer,agent,agents,delivery,spam,filter,social,secure,safety,bot,manage,real,time,station,temp,series,remote,desk,project,stream,voice,library,cast,theme,blog,blogs,icon,copy,advanced,search,directory,direct,active,capture,word,words,private,public,portal,usage,global,group,groups,forum,engine,sphere,service,op,gallery,method,market,bank,banks,product,products,model,models,center,centers,set,signal,record,config,quality,centric,port,place,dynamic,type,types,event,events,high,robot,class,pattern,cyber,select,build,builder,expert,join,space,esc,delete,del,insert,lock,enter,caps,wave,sound,sounds,camera,cam,auto,focus,movie,movies,film,films,number,num,chart,loop,academy,launch,local,tips,misc,tracks,music,radio,tag,mix,sing,live,visual,effect,guide,lab,land,up,down,load,loader,slide,trailer,stage,volume,vol,object,player,players,way,road,life,core,chip,co,virtual,shop,self,target,rapid,index,machine,view,limit,term,trade,farm,boot,reader,token,hot,drive,switch,non,scroll,shift,toggle,bar,banner,dial,hit,page,home,hyper,my,pay,ping,map,maps,sky,static,dev,zone,add,alert,cell,check,menu,cut,dash,drag,drop,find,finder,folder,master,log,macro,office,raw,pup,pop,quick,bin,root,run,pack,skin,snap,start,task,tutorial,utility,clean,room,crop,full,on,off,login,null,pixel,push,rate,safe,stand,table,post,zip,rar,byte,mega,only,reset,guard,tech,save,elite,shell,maker,band,circuit,cluster,frame,line,link,net,port,route,station,switch,torrent,base,bay,bin,case,deck,dock,hold,house,shelf,stack,store,vault,cast,cube,digita,feed,fire,ology,space,span,technica,ware,wire,works,atar,blog,bot,bug,flash,host,icon,source,src,space,ware,way,work,base,bit,code,load,map,module,script,serv,server,set,state,system,token,tag,unit,blab,buzz,club,cube,mix,nic,opia,pad,path,point,space,sphere,vine,zone,zoom,ble,ba,deo,do,jo,mbo,ndo,nix,tz,vee,yo,zio,zu,zzle,cloud,colony,flight,flock,gaggle,herd,horde,pack,pod,pride,shoal,swarm,tribe,troop,ality,ate,ient,ify,ity,ium,ius,ize,izer,nik,opoly,ster',0,'2013-04-25 19:02:34','2013-04-25 19:02:34','en'),(16,'Music & Graphics & Arts','ly,tint,hue,draft,sketch,vox,visi,band,clan,club,crew,gang,group,guild,league,lot,mob,order,party,squad,team,troop,brush,paint,color,colors,white,pink,red,orange,brown,yellow,green,blue,purple,gray,black,amber,aqua,azure,bronze,coral,copper,crimson,cyan,ginger,gold,hazel,indigo,jade,silver,logo,logos,design,designer,studio,studios,print,poetry,pattern,patterns,writer,writers,font,photoshop,fontshop,fusion,paint,page,layout,adobe,suite,artwork,art,arts,line,grid,clip,cover,creative,pic,picture,pictures,vector,style,styler,image,images,poster,neo,motion,effect,effects,texture,map,opengl,directx,engine,engines,visual,display,texture,light,draw,gallery,retina,node,sub,wave,listen,hear,noise,art,artist,tablet,pen,dye,amp,hear,voice,synth,play,watch,see,dude,puff,audio,video,vid,pixel,note,sketch,draw,drawing,inspiration,inspire,woot,roll,rock,zine,bang,pow,band,press,beat,tune,radio,bass,dub,step,shake,vibe,color,chill,out',0,'2013-04-25 19:03:10','2013-04-25 19:03:10','en'),(17,'Colors & Tones','white,pink,red,orange,brown,yellow,green,blue,purple,gray,black,amber,aqua,azure,bronze,coral,copper,crimson,cyan,ginger,gold,hazel,indigo,jade,silver,aero,blue,violet,alice,alloy,amazon,amber,almond,green,white,brass,bronze,ruby,apricot,ao,ash,grey,ashgrey,auburn,aqua,arsenic,azure,pink,powder,red,bazaar,beaver,beige,bisque,bistre,brown,bitter,black,bean,olive,lime,blond,sapphire,yonder,bole,blush,bone,bondi,bone,brick,buff,rose,burnt,cadet,poly,cal,camel,cameo,capri,cardinal,caribbean,carrot,orange,carnelian,cerise,cherry,chocolate,yellow,cinnabar,cinnamon,coral,copper,congo,corn,cream,cyan,grape,silk,latte,candy,dark,blue,chestnut,gray,jungle,liver,lavender,magenta,midnight,night,sienna,sky,slate,spring,tan,taupe,vanilla,deep,carmine,space,taupe,tuscan,deer,denim,desert,sand,diamond,dirt,dodger,drab,ecru,ebony,eton,fern,feldspar,fawn,fallow,flax,folly,fresh,fuzzy,ginger,glitter,go,grape,grullo,indigo,dye,warm,iris,jade,jasper,jet,berry,keppel,kobe,kobi,lava,lapis,lemon,glacier,curry,light,linen,lust,maize,mantis,mauve,melon,midori,mint,kimado,whip,dew,snow,lace,golden,honey,glow,sun,straw',0,'2013-04-25 19:03:47','2013-04-25 19:03:47','en'),(18,'Social & Networks','band,clan,club,crew,gang,group,guild,league,lot,mob,order,party,squad,team,troop,circle,cycle,curve,curl,ical,icus,ique,idian,igee,loop,orbit,quel,sphere,wheel,amigo,bud,buddy,fan,friend,kin,mate,pal,partner,band,clan,club,crew,gang,group,guild,league,lot,mob,order,party,squad,team,troop,air,ly,io,app,social,folk',0,'2013-04-25 19:04:34','2013-04-25 19:04:34','en'),(19,'Fashion & Textile & Accessories','cotton,wear,fab,fash,fashion,dye,alum,batik,boutique,fiber,batt,yarn,wool,blend,body,textile,design,charka,clip,color,accessories,textile,copp,cotton,craft,curl,tailor,tailoring,denim,diz,doff,twist,draft,sew,sewing,felt,fiber,fine,quality,gutta,hemp,hook,hue,indigo,jute,kemp,knop,loom,lock,lofty,linen,line,flax,level,lea,kate,marl,madder,medulla,mawata,micron,milling,mill,mungo,mushy,nap,neps,noil,pelt,pick,picker,piece,collect,ply,plying,silk,raw,sett,tex,top,tow,twill,type,tying,web,weft,yolk,yield',0,'2013-04-25 19:04:57','2013-04-25 19:05:03','en'),(20,'Fruits & Vegetable','acai,aibu,mango,hazelnut,banana,bael,bacuri,apple,pear,grape,melon,cape,cherry,gac,genip,plum,imbe,apple,onion,aubergine,avocado,bean,beetroot,beet,root,broccoli,cabbage,carrot,cauli,cucumber,garlic,lettuce,mushroom,olive,onion,pepper,potato,apricot,avocado,banana,muz,fruit,berry,blackberry,currant,blueberry,clementine,coconut,date,damson,dragonfruit,durian,eggplant,fig,gooseberry,grape,guava,huckle,honeydew,dew,jack,jettamelon,jambul,jujube,kiwi,kumquat,legume,lemon,lime,loquat,lychee,mandarine,mango,melon,canary,cantaloupe,honeydew,watermelon,nectarine,nut,orange,peach,pear,persimmon,pineapple,pomelo,raspberry,satsuma,strawberry,tangerine,tomato,ugli,ugly',0,'2013-04-25 19:05:35','2013-04-25 19:05:35','en'),(21,'Animals & Nature','grow,hamster,ape,piggy,crop,tory,yard,stead,range,land,hold,ery,age,ation,scape,bat,bird,cat,chilla,dog,fin,fish,fox,gale,gator,hound,lope,shark,wolf,ant,beetle,bug,cada,cricket,fly,hopper,hornet,mantis,mite,moth,pillar,roller,wasp,shrimp,ant,ape,donkey,bison,baboon,badger,bat,bear,beaver,bee,boar,buffalo,camel,caribou,cat,cattle,chicken,clam,cobra,cod,coyote,crab,crane,crow,curlew,deer,dog,dolphin,dove,dragon,duck,eagle,dunlin,eel,eland,elk,emu,seal,ferret,fish,fly,fox,frog,gaur,gnat,gnu,goat,panda,gorilla,gull,hamster,hare,hawk,fowl,heron,hornet,horse,koala,mite,kudu,gull,eel,fox,gnat,gnu,jay,beetle,wren,yak,human,kudu,lark,lemur,lion,llama,komodo,loris,marten,moose,monkey,mole,mink,mule,mouse,octopus,oryx,otter,owl,parrot,penguin,pig,pigeon,pony,quail,ram,rail,rabbit,rat,raven,rook,ruff,root,seal,lion,sheep,shrew,skunk,snail,snake,spider,squid,squirrel,starling,stork,swan,tapir,tiger,toad,trout,walrus,wasp,viper,wolf,zebra,yak,wren,worm,wombat,wolf,earth,planet,water,sea,tree,root,pure,bog,brood,crop,corpse,flower,fry,fungi,fallow,fen,gut,plant,green,native,rook,air,fresh,bay,cove,creek,harbor,port,rain,river,sea,stream,tide,wave',0,'2013-04-25 19:06:03','2013-04-25 19:06:03','en'),(22,'Bank & Financial','unit,note,bucks,cash,coin,ero,inero,funds,loot,pay,ency,ney,dollar,buck,pig,graph,chart,graph,line,map,print,struct,tect,ture,keep,keeper,merchant,baron,ster,mogul,monger,master,keeper,seller,saler,shop,foundry,forge,form,mill,works,mill,tory,tary,ary,ery,al',0,'2013-04-25 19:48:55','2013-04-25 19:48:55','en'),(23,'Get Lucky','cogi,fa,ka,ki,my,qua,ska,twi,vi,ya,yo,ality,ate,ient,ify,ity,ium,ius,ize,izer,nik,opoly,ster,adier,blazer,boss,chief,onaut,oneer,ovator,major,master,pilot,setter,draft,hap,put,dock,ks,co,ba,foo,star,war,place,eye,look,hear,wear,dear,bear,gear,fear',0,'2013-04-25 19:50:54','2013-04-25 19:50:54','en');
/*!40000 ALTER TABLE `endings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_notifications`
--

DROP TABLE IF EXISTS `payment_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `params` text COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_notifications`
--

LOCK TABLES `payment_notifications` WRITE;
/*!40000 ALTER TABLE `payment_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrar_tlds`
--

DROP TABLE IF EXISTS `registrar_tlds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registrar_tlds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tld` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `registrar_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrar_tlds`
--

LOCK TABLES `registrar_tlds` WRITE;
/*!40000 ALTER TABLE `registrar_tlds` DISABLE KEYS */;
/*!40000 ALTER TABLE `registrar_tlds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrars`
--

DROP TABLE IF EXISTS `registrars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registrars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_param` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrars`
--

LOCK TABLES `registrars` WRITE;
/*!40000 ALTER TABLE `registrars` DISABLE KEYS */;
/*!40000 ALTER TABLE `registrars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `related_words`
--

DROP TABLE IF EXISTS `related_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `related_words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_related_words_on_word` (`word`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `related_words`
--

LOCK TABLES `related_words` WRITE;
/*!40000 ALTER TABLE `related_words` DISABLE KEYS */;
INSERT INTO `related_words` VALUES (1,'sex','[{\"relationship_type\":\"verb-form\",\"words\":[\"sexed\",\"sexes\",\"sexing\",\"sexs\"]},{\"relationship_type\":\"hypernym\",\"words\":[\"family\",\"class\",\"secern\"]},{\"relationship_type\":\"cross-reference\",\"words\":[\"female\",\"sex up\",\"male\",\"gender\"]},{\"relationship_type\":\"synonym\",\"words\":[\"gender\",\"coitus\",\"see\"]},{\"relationship_type\":\"rhyme\",\"words\":[\"Czechs\",\"Ex\",\"Lex\",\"Rex\",\"Tex\",\"Triplex\",\"X\",\"aix\",\"annex\",\"becks\"]},{\"relationship_type\":\"unknown\",\"words\":[\"Erotica\",\"LGBTQ\"]},{\"relationship_type\":\"same-context\",\"words\":[\"love\",\"race\",\"movie\",\"animal\",\"nature\",\"Art\",\"porn\",\"action\"]},{\"relationship_type\":\"other\",\"words\":[\"gender\",\"coitus\"]}]','2013-04-13 04:48:48','2013-04-13 04:48:48'),(2,'example','[{\"relationship_type\":\"verb-form\",\"words\":[]},{\"relationship_type\":\"hypernym\",\"words\":[\"warning\",\"lesson\"]},{\"relationship_type\":\"cross-reference\",\"words\":[\"warning\"]},{\"relationship_type\":\"form\",\"words\":[]},{\"relationship_type\":\"synonym\",\"words\":[\"case\",\"sample\",\"model\",\"warning\"]},{\"relationship_type\":\"rhyme\",\"words\":[\"ample\",\"sample\",\"trample\"]},{\"relationship_type\":\"same-context\",\"words\":[\"result\",\"type\",\"account\",\"model\",\"aspect\"]},{\"relationship_type\":\"other\",\"words\":[\"kind\",\"type\",\"picture\",\"paragon\",\"ideal\",\"lead\",\"lesson\",\"warning\"]}]','2013-04-13 04:49:15','2013-04-13 04:49:15'),(3,'test','[{\"relationship_type\":\"equivalent\",\"words\":[\"testa\"]},{\"relationship_type\":\"verb-form\",\"words\":[\"tested\",\"testes\",\"testing\",\"tests\"]},{\"relationship_type\":\"hypernym\",\"words\":[\"submit\",\"take\",\"attempt\",\"effort\",\"try\",\"be\",\"cover\"]},{\"relationship_type\":\"cross-reference\",\"words\":[]},{\"relationship_type\":\"etymologically-related-term\",\"words\":[\"attest\",\"protest\",\"contest\",\"detest\"]},{\"relationship_type\":\"variant\",\"words\":[\"exam\"]},{\"relationship_type\":\"synonym\",\"words\":[\"proof\",\"trial\"]},{\"relationship_type\":\"rhyme\",\"words\":[\"Best\",\"Blessed\",\"Brest\",\"Celeste\",\"Este\",\"Midwest\",\"Pest\",\"West\",\"abreast\"]},{\"relationship_type\":\"unknown\",\"words\":[\"Voices\"]},{\"relationship_type\":\"same-context\",\"words\":[\"data\",\"control\",\"train\",\"level\",\"problem\"]},{\"relationship_type\":\"other\",\"words\":[\"trial\",\"proof\",\"probe\",\"assay\",\"examine\",\"analyze\",\"try\",\"essay\",\"check\",\"quiz\"]}]','2013-04-13 04:49:38','2013-04-13 04:49:38'),(4,'sample','[{\"relationship_type\":\"verb-form\",\"words\":[\"sampled\",\"samples\"]},{\"relationship_type\":\"cross-reference\",\"words\":[\"example\"]},{\"relationship_type\":\"synonym\",\"words\":[\"example\",\"pattern\",\"match\",\"swatch\",\"relish\",\"try\"]},{\"relationship_type\":\"rhyme\",\"words\":[\"ample\",\"example\",\"trample\"]},{\"relationship_type\":\"same-context\",\"words\":[\"data\",\"test\",\"product\",\"supply\",\"load\",\"layer\"]},{\"relationship_type\":\"other\",\"words\":[\"swatch\",\"try\",\"taste\",\"trial\"]}]','2013-04-13 04:49:43','2013-04-13 04:49:43'),(5,'dot','[{\"relationship_type\":\"equivalent\",\"words\":[\"D.O.T.\"]},{\"relationship_type\":\"verb-form\",\"words\":[\"dots\",\"dotted\",\"dotting\"]},{\"relationship_type\":\"hypernym\",\"words\":[\"saucer\",\"disk\",\"disc\",\"mark\",\"write\",\"LSD\",\"cover\",\"extend\"]},{\"relationship_type\":\"cross-reference\",\"words\":[\"act\",\"fare\",\"diffuse\",\"scatter\",\"rest\"]},{\"relationship_type\":\"variant\",\"words\":[\"dotted\",\"dotting\"]},{\"relationship_type\":\"form\",\"words\":[\"dotted\",\"dotting\"]},{\"relationship_type\":\"synonym\",\"words\":[\"dowry\",\"act\",\"deed\",\"answer\",\"suffice\",\"inflict\",\"render\",\"perform\",\"achieve\"]},{\"relationship_type\":\"rhyme\",\"words\":[\"Bhatt\",\"Kott\",\"Lot\",\"Lotte\",\"Minot\",\"Mott\",\"Ott\",\"Sadat\",\"Scot\"]},{\"relationship_type\":\"same-context\",\"words\":[\"speck\",\"streak\",\"com\",\"stripe\",\"blur\",\"patch\",\"bead\",\"disk\",\"blotch\",\"spot\"]},{\"relationship_type\":\"other\",\"words\":[\"speck\",\"spot\",\"period\",\"speckle\",\"freak\"]}]','2013-04-13 04:49:48','2013-04-13 04:49:48');
/*!40000 ALTER TABLE `related_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20130320194604'),('20130320194631'),('20130320194647'),('20130320194752'),('20130320194831'),('20130320210138'),('20130321002803'),('20130326003356'),('20130326010139'),('20130326085005'),('20130328055211'),('20130328055424'),('20130329041459'),('20130329041526'),('20130329071228'),('20130409194151'),('20130410170756'),('20130425184149');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shelf_accesses`
--

DROP TABLE IF EXISTS `shelf_accesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shelf_accesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shelf_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_shelf_accesses_on_shelf_id` (`shelf_id`),
  KEY `index_shelf_accesses_on_user_id` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shelf_accesses`
--

LOCK TABLES `shelf_accesses` WRITE;
/*!40000 ALTER TABLE `shelf_accesses` DISABLE KEYS */;
/*!40000 ALTER TABLE `shelf_accesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shelves`
--

DROP TABLE IF EXISTS `shelves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shelves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `shelf_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_shelves_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shelves`
--

LOCK TABLES `shelves` WRITE;
/*!40000 ALTER TABLE `shelves` DISABLE KEYS */;
INSERT INTO `shelves` VALUES (1,'My First Shelf',3,'domain_shelf','2013-04-10 15:22:45','2013-04-10 15:22:45'),(2,'mahmure',3,'domain_shelf','2013-04-12 21:32:41','2013-04-12 21:32:41'),(3,'zikkosiker',3,'domain_shelf','2013-04-12 21:32:45','2013-04-12 21:32:45'),(4,'tatil',3,'domain_shelf','2013-04-13 01:53:41','2013-04-13 01:53:41');
/*!40000 ALTER TABLE `shelves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `membership_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `super` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'okeoke@gmail.com','$2a$10$y12NLc/l0TuY.oPztAVw3uJFZGm77yc3ZzhIWail1F8Vh2x52zHbi',NULL,NULL,NULL,1,'2013-04-25 18:49:56','2013-04-25 18:49:56','127.0.0.1','127.0.0.1','2013-04-10 13:46:20','2013-04-25 18:49:56',NULL,NULL,1),(2,'sago@sago.com','$2a$10$FNC7/DuJ9Cjf6khIpkm9KO1R5dnPcO.XCZWneMJ4nEdGRJJiKTWye',NULL,NULL,NULL,1,'2013-04-10 13:51:17','2013-04-10 13:51:17','127.0.0.1','127.0.0.1','2013-04-10 13:51:16','2013-04-10 13:51:17',NULL,NULL,NULL),(3,'okebye@gmail.com','$2a$10$5WNEs7YW9YJc.dH4cIuhbu9wkKU/pCqj2D7klIzERopC3aoouYDC.',NULL,NULL,NULL,5,'2013-04-25 18:40:51','2013-04-12 21:24:33','127.0.0.1','127.0.0.1','2013-04-10 15:22:27','2013-04-25 18:40:51',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watch_domains`
--

DROP TABLE IF EXISTS `watch_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watch_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_body` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_watch_domains_on_full_body` (`full_body`),
  KEY `index_watch_domains_on_expire_date` (`expire_date`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watch_domains`
--

LOCK TABLES `watch_domains` WRITE;
/*!40000 ALTER TABLE `watch_domains` DISABLE KEYS */;
INSERT INTO `watch_domains` VALUES (1,'uberclub.com','2013-02-28','2013-04-10 13:05:23','2013-04-10 13:05:23'),(2,'uberspace.com','2014-08-12','2013-04-10 13:05:25','2013-04-10 13:05:25'),(3,'ubernic.com','2013-11-09','2013-04-10 13:05:29','2013-04-10 13:05:29'),(4,'ubertz.com','2014-01-30','2013-04-10 13:05:31','2013-04-10 13:05:31'),(5,'uberbuilder.com','2014-01-27','2013-04-10 13:05:32','2013-04-10 13:05:32'),(6,'ubersmith.com','2014-03-21','2013-04-10 13:05:33','2013-04-10 13:05:33'),(7,'uberbuzz.com','2015-05-09','2013-04-10 13:05:34','2013-04-10 13:05:34'),(8,'uber.com','2019-07-13','2013-04-10 13:05:36','2013-04-10 13:05:36'),(9,'uberzone.com','2013-11-06','2013-04-10 13:05:38','2013-04-10 13:05:38'),(10,'uberzu.com','2013-04-14','2013-04-10 13:05:39','2013-04-10 13:05:39'),(11,'uberpoint.com','2013-09-11','2013-04-10 13:05:41','2013-04-10 13:05:41'),(12,'ubermix.com','2013-05-25','2013-04-10 13:05:41','2013-04-10 13:05:41'),(13,'ubercube.com','2013-09-29','2013-04-10 13:05:43','2013-04-10 13:05:43'),(14,'ubersphere.com','2014-03-30','2013-04-10 13:05:44','2013-04-10 13:05:44'),(15,'uberdo.com','2015-09-09','2013-04-10 13:05:46','2013-04-10 13:05:46'),(16,'ubermechanic.com','2013-10-29','2013-04-10 13:05:48','2013-04-10 13:05:48'),(17,'uberpad.com','2013-10-10','2013-04-10 13:05:49','2013-04-10 13:05:49'),(18,'uberzoom.com','2015-08-12','2013-04-10 13:05:50','2013-04-10 13:05:50'),(19,'ubervine.com','2014-01-25','2013-04-10 13:05:51','2013-04-10 13:05:51'),(20,'ubernix.com','2013-09-23','2013-04-10 13:05:53','2013-04-10 13:05:53'),(21,'loveinator.com','2014-01-17','2013-04-10 15:20:49','2013-04-10 15:20:49'),(22,'lovezone.com','2015-01-05','2013-04-10 15:20:50','2013-04-10 15:20:50'),(23,'lovesmith.com','2013-10-25','2013-04-10 15:20:57','2013-04-10 15:20:57'),(24,'lovenix.com','2013-11-24','2013-04-10 15:20:59','2013-04-10 15:20:59'),(25,'lovedeo.com','2014-11-24','2013-04-10 15:21:01','2013-04-10 15:21:01'),(26,'lovendo.com','2015-01-04','2013-04-10 15:21:02','2013-04-10 15:21:02'),(27,'lovemaker.com','2014-05-16','2013-04-10 15:21:03','2013-04-10 15:21:03'),(28,'lovemix.com','2013-06-01','2013-04-10 15:21:04','2013-04-10 15:21:04'),(29,'loveba.com','2019-10-24','2013-04-10 15:21:06','2013-04-10 15:21:06'),(30,'love.com','2013-10-21','2013-04-10 15:21:09','2013-04-10 15:21:09'),(31,'loveclub.com','2014-03-07','2013-04-10 15:21:10','2013-04-10 15:21:10'),(32,'lovepath.com','2014-01-17','2013-04-10 15:21:12','2013-04-10 15:21:12'),(33,'lovemason.com','2013-11-06','2013-04-10 15:21:14','2013-04-10 15:21:14'),(34,'lovewright.com','2015-03-08','2013-04-10 15:21:14','2013-04-10 15:21:14'),(35,'lovedo.com','2013-05-26','2013-04-10 15:21:19','2013-04-10 15:21:19'),(36,'lovezio.com','2013-10-01','2013-04-10 15:21:21','2013-04-10 15:21:21'),(37,'lovezu.com','2015-08-12','2013-04-10 15:21:24','2013-04-10 15:21:24'),(38,'lovetz.com','2014-03-29','2013-04-10 15:21:27','2013-04-10 15:21:27'),(39,'lovebuilder.com','2014-04-28','2013-04-10 15:21:28','2013-04-10 15:21:28'),(40,'lovevee.com','2013-05-11','2013-04-10 15:21:31','2013-04-10 15:21:31'),(41,'lovezoom.com','2014-02-24','2013-04-10 15:21:33','2013-04-10 15:21:33'),(42,'lovepoint.com','2014-02-08','2013-04-10 15:21:34','2013-04-10 15:21:34'),(43,'lovespace.com','2017-09-27','2013-04-10 15:21:36','2013-04-10 15:21:36'),(44,'lovecube.com','2013-10-01','2013-04-10 15:21:37','2013-04-10 15:21:37'),(45,'loveble.com','2014-11-20','2013-04-10 15:21:39','2013-04-10 15:21:39'),(46,'lovealizer.com','2013-05-07','2013-04-10 15:21:39','2013-04-10 15:21:39'),(47,'loveblab.com','2015-08-25','2013-04-10 15:21:41','2013-04-10 15:21:41'),(48,'lovesphere.com','2013-05-14','2013-04-10 15:21:44','2013-04-10 15:21:44'),(49,'lovejo.com','2013-04-18','2013-04-10 15:21:47','2013-04-10 15:21:47'),(50,'lovenic.com','2013-09-13','2013-04-10 15:21:48','2013-04-10 15:21:48'),(51,'lovemechanic.com','2013-10-10','2013-04-10 15:21:49','2013-04-10 15:21:49'),(52,'lovevine.com','2013-10-31','2013-04-10 15:21:51','2013-04-10 15:21:51'),(53,'loveyo.com','2013-08-13','2013-04-10 15:21:53','2013-04-10 15:21:53'),(54,'lovebuzz.com','2015-05-11','2013-04-10 15:21:54','2013-04-10 15:21:54'),(55,'lovepad.com','2016-01-31','2013-04-10 15:21:54','2013-04-10 15:21:54'),(56,'loveopia.com','2013-02-06','2013-04-10 15:21:56','2013-04-10 15:21:56'),(57,'memecan.com','2013-10-03','2013-04-10 16:45:16','2013-04-10 16:45:16'),(58,'londoncraft.com','2013-07-18','2013-04-10 16:48:28','2013-04-10 16:48:28'),(59,'londonabout.com','2013-12-05','2013-04-10 16:48:32','2013-04-10 16:48:32'),(60,'londonmonitor.com','2014-03-07','2013-04-10 16:48:34','2013-04-10 16:48:34'),(61,'london.com','2021-11-06','2013-04-10 16:48:38','2013-04-10 16:48:38'),(62,'londonboat.com','2013-11-22','2013-04-10 16:48:39','2013-04-10 16:48:39'),(63,'camoon.com','2014-06-19','2013-04-10 16:56:35','2013-04-10 16:56:35'),(64,'uberduck.com','2014-02-13','2013-04-10 17:13:17','2013-04-10 17:13:17'),(65,'uberhorse.com','2013-05-19','2013-04-10 17:13:19','2013-04-10 17:13:19'),(66,'uberfrog.com','2014-01-29','2013-04-10 17:13:23','2013-04-10 17:13:23'),(67,'ubermoose.com','2014-10-03','2013-04-10 17:13:25','2013-04-10 17:13:25'),(68,'uberowl.com','2014-02-17','2013-04-10 17:13:31','2013-04-10 17:13:31'),(69,'ubersquid.com','2013-07-18','2013-04-10 17:13:32','2013-04-10 17:13:32'),(70,'ubereel.com','2013-08-03','2013-04-10 17:13:35','2013-04-10 17:13:35'),(71,'uberwasp.com','2013-12-07','2013-04-10 17:13:38','2013-04-10 17:13:38'),(72,'ubercat.com','2013-10-12','2013-04-10 17:13:40','2013-04-10 17:13:40'),(73,'uberseal.com','2014-04-29','2013-04-10 17:13:42','2013-04-10 17:13:42'),(74,'uberkoala.com','2013-08-10','2013-04-10 17:13:43','2013-04-10 17:13:43'),(75,'uberjay.com','2013-12-10','2013-04-10 17:13:46','2013-04-10 17:13:46'),(76,'uberfish.com','2014-01-15','2013-04-10 17:13:47','2013-04-10 17:13:47'),(77,'ubermouse.com','2013-12-09','2013-04-10 17:13:49','2013-04-10 17:13:49'),(78,'naban.com','2013-10-30','2013-04-10 17:14:46','2013-04-10 17:14:46'),(79,'nabanyo.com','2016-02-07','2013-04-10 17:14:53','2013-04-10 17:14:53'),(80,'sezenaksu.com','2013-07-04','2013-04-10 17:18:15','2013-04-10 17:18:15'),(81,'ubers.com','2016-05-04','2013-04-10 17:22:43','2013-04-10 17:22:43'),(82,'ubersclub.com','2013-10-25','2013-04-10 17:22:50','2013-04-10 17:22:50'),(83,'salak.com','2019-05-11','2013-04-10 22:14:11','2013-04-10 22:14:11'),(84,'percent.com','2013-11-20','2013-04-12 13:28:23','2013-04-12 13:28:23'),(85,'walala.com','2018-12-30','2013-04-12 13:32:34','2013-04-12 13:32:34'),(86,'meshaid.com','2014-04-09','2013-04-12 13:32:37','2013-04-12 13:32:37'),(87,'bufet.com','2013-09-15','2013-04-12 13:32:40','2013-04-12 13:32:40'),(88,'shesaid.com','2014-03-02','2013-04-12 13:32:42','2013-04-12 13:32:42'),(89,'moby.com','2013-10-05','2013-04-12 13:35:34','2013-04-12 13:35:34'),(90,'sdfasfasf.com','2013-07-15','2013-04-12 13:36:03','2013-04-12 13:36:03'),(91,'arabpoint.com','2013-05-31','2013-04-12 13:53:20','2013-04-12 13:53:20'),(92,'arabbuzz.com','2014-02-09','2013-04-12 13:53:27','2013-04-12 13:53:27'),(93,'arabpath.com','2014-02-23','2013-04-12 13:53:29','2013-04-12 13:53:29'),(94,'arabzone.com','2014-11-18','2013-04-12 13:53:34','2013-04-12 13:53:34'),(95,'arabbuilder.com','2013-08-03','2013-04-12 13:53:35','2013-04-12 13:53:35'),(96,'arabzoom.com','2013-11-29','2013-04-12 13:53:36','2013-04-12 13:53:36'),(97,'arabba.com','2013-09-29','2013-04-12 13:53:37','2013-04-12 13:53:37'),(98,'arabnic.com','2013-07-01','2013-04-12 13:53:38','2013-04-12 13:53:38'),(99,'arabpad.com','2014-03-08','2013-04-12 13:53:41','2013-04-12 13:53:41'),(100,'arabcube.com','2013-12-31','2013-04-12 13:53:43','2013-04-12 13:53:43'),(101,'arabnix.com','2013-05-20','2013-04-12 13:53:50','2013-04-12 13:53:50'),(102,'arabjo.com','2017-02-02','2013-04-12 13:53:52','2013-04-12 13:53:52'),(103,'arabvine.com','2013-07-05','2013-04-12 13:53:58','2013-04-12 13:53:58'),(104,'arabclub.com','2014-02-04','2013-04-12 13:54:01','2013-04-12 13:54:01'),(105,'arab.com','2016-12-25','2013-04-12 13:54:02','2013-04-12 13:54:02'),(106,'arabyo.com','2014-02-14','2013-04-12 13:54:07','2013-04-12 13:54:07'),(107,'arabdo.com','2014-04-09','2013-04-12 13:54:09','2013-04-12 13:54:09'),(108,'arabspace.com','2013-06-21','2013-04-12 13:54:10','2013-04-12 13:54:10'),(109,'arabmix.com','2013-10-16','2013-04-12 13:54:11','2013-04-12 13:54:11'),(110,'asdfasdfas.com','2013-06-08','2013-04-12 14:58:06','2013-04-12 14:58:06'),(111,'flysahil.com','2013-08-12','2013-04-12 15:33:57','2013-04-12 15:33:57'),(112,'fly.com','2015-02-16','2013-04-12 15:34:00','2013-04-12 15:34:00'),(113,'flybilet.com','2013-10-28','2013-04-12 15:34:03','2013-04-12 15:34:03'),(114,'flyotel.com','2013-06-17','2013-04-12 15:34:06','2013-04-12 15:34:06'),(115,'mahmure.com','2013-10-31','2013-04-12 15:48:13','2013-04-12 15:48:13'),(116,'mahmure.net','2013-12-16','2013-04-12 15:49:07','2013-04-12 15:49:07'),(117,'mahmure.org','2014-01-02','2013-04-12 15:49:33','2013-04-12 15:49:33'),(118,'fafafafafa.com','2013-05-30','2013-04-12 21:01:31','2013-04-12 21:01:31'),(119,'wowowowow.com','2013-11-16','2013-04-12 21:32:56','2013-04-12 21:32:56'),(120,'wavebuzz.com','2013-09-17','2013-04-12 22:22:23','2013-04-12 22:22:23'),(121,'wavedo.com','2013-05-29','2013-04-12 22:22:24','2013-04-12 22:22:24'),(122,'wavespace.com','2013-05-20','2013-04-12 22:22:28','2013-04-12 22:22:28'),(123,'wavemaker.com','2013-06-14','2013-04-12 22:22:30','2013-04-12 22:22:30'),(124,'wavezone.com','2013-04-18','2013-04-12 22:22:33','2013-04-12 22:22:33'),(125,'wavebuilders.com','2013-12-27','2013-04-12 22:22:34','2013-04-12 22:22:34'),(126,'wavepads.com','2013-09-18','2013-04-12 22:22:35','2013-04-12 22:22:35'),(127,'wavepoint.com','2015-07-13','2013-04-12 22:22:36','2013-04-12 22:22:36'),(128,'wavejo.com','2013-06-11','2013-04-12 22:22:38','2013-04-12 22:22:38'),(129,'waveclub.com','2013-08-30','2013-04-12 22:22:51','2013-04-12 22:22:51'),(130,'wavepoints.com','2013-10-22','2013-04-12 22:22:54','2013-04-12 22:22:54'),(131,'wavesmith.com','2013-10-31','2013-04-12 22:22:57','2013-04-12 22:22:57'),(132,'wavemix.com','2014-06-25','2013-04-12 22:22:58','2013-04-12 22:22:58'),(133,'wavepad.com','2015-02-09','2013-04-12 22:23:00','2013-04-12 22:23:00'),(134,'wavemechanics.com','2017-01-08','2013-04-12 22:23:02','2013-04-12 22:23:02'),(135,'wave.com','2017-03-04','2013-04-12 22:23:03','2013-04-12 22:23:03'),(136,'wavepaths.com','2013-05-19','2013-04-12 22:23:05','2013-04-12 22:23:05'),(137,'wavemakers.com','2014-03-28','2013-04-12 22:23:08','2013-04-12 22:23:08'),(138,'wavemason.com','2015-12-14','2013-04-12 22:23:10','2013-04-12 22:23:10'),(139,'waveinator.com','2014-03-23','2013-04-12 22:23:11','2013-04-12 22:23:11'),(140,'wavebuilder.com','2014-04-07','2013-04-12 22:23:11','2013-04-12 22:23:11'),(141,'wavepath.com','2013-06-24','2013-04-12 22:23:13','2013-04-12 22:23:13'),(142,'wavesphere.com','2014-01-09','2013-04-12 22:23:16','2013-04-12 22:23:16'),(143,'dotopia.com','2013-07-10','2013-04-12 22:23:35','2013-04-12 22:23:35'),(144,'dotpath.com','2014-02-04','2013-04-12 22:23:36','2013-04-12 22:23:36'),(145,'dotzoom.com','2014-03-02','2013-04-12 22:23:38','2013-04-12 22:23:38'),(146,'dotnics.com','2013-08-28','2013-04-12 22:23:39','2013-04-12 22:23:39'),(147,'dotdo.com','2014-02-11','2013-04-12 22:23:42','2013-04-12 22:23:42'),(148,'dotzio.com','2014-03-27','2013-04-12 22:23:43','2013-04-12 22:23:43'),(149,'dotba.com','2014-03-30','2013-04-12 22:23:44','2013-04-12 22:23:44'),(150,'dotzone.com','2014-01-16','2013-04-12 22:23:45','2013-04-12 22:23:45'),(151,'dotnic.com','2013-06-17','2013-04-12 22:23:46','2013-04-12 22:23:46'),(152,'dotpads.com','2013-04-17','2013-04-12 22:23:46','2013-04-12 22:23:46'),(153,'dotcube.com','2016-02-06','2013-04-12 22:23:48','2013-04-12 22:23:48'),(154,'dotbas.com','2014-03-24','2013-04-12 22:23:50','2013-04-12 22:23:50'),(155,'dotjo.com','2014-08-20','2013-04-12 22:23:50','2013-04-12 22:23:50'),(156,'dotnix.com','2014-01-03','2013-04-12 22:23:51','2013-04-12 22:23:51'),(157,'dottz.com','2014-03-04','2013-04-12 22:23:52','2013-04-12 22:23:52'),(158,'dot.com','2017-06-21','2013-04-12 22:23:53','2013-04-12 22:23:53'),(159,'dotyo.com','2013-08-26','2013-04-12 22:23:54','2013-04-12 22:23:54'),(160,'dotclub.com','2014-03-26','2013-04-12 22:23:55','2013-04-12 22:23:55'),(161,'dotbuzz.com','2013-10-25','2013-04-12 22:23:57','2013-04-12 22:23:57'),(162,'dotmix.com','2013-04-24','2013-04-12 22:23:58','2013-04-12 22:23:58'),(163,'dotpad.com','2013-12-01','2013-04-12 22:24:00','2013-04-12 22:24:00'),(164,'dotzu.com','2014-01-29','2013-04-12 22:24:02','2013-04-12 22:24:02'),(165,'dotvine.com','2013-12-29','2013-04-12 22:24:02','2013-04-12 22:24:02'),(166,'kasrental.com','2022-03-04','2013-04-13 01:53:26','2013-04-13 01:53:26'),(167,'kastours.com','2013-02-08','2013-04-13 01:53:30','2013-04-13 01:53:30'),(168,'kasonline.com','2014-02-19','2013-04-13 01:53:45','2013-04-13 01:53:45'),(169,'kasbars.com','2014-03-22','2013-04-13 01:54:11','2013-04-13 01:54:11'),(170,'kasmag.com','2017-02-12','2013-04-13 01:54:44','2013-04-13 01:54:44'),(171,'kasvilla.com','2013-10-25','2013-04-13 01:56:21','2013-04-13 01:56:21'),(172,'kasadventure.com','2013-06-22','2013-04-13 01:56:33','2013-04-13 01:56:33'),(173,'kasinternational.com','2014-01-29','2013-04-13 01:56:34','2013-04-13 01:56:34'),(174,'kasbook.com','2013-06-10','2013-04-13 01:57:40','2013-04-13 01:57:40'),(175,'kasoutdoors.com','2013-08-05','2013-04-13 01:59:42','2013-04-13 01:59:42'),(176,'kasservice.com','2014-03-04','2013-04-13 01:59:44','2013-04-13 01:59:44'),(177,'kasboutique.com','2014-03-13','2013-04-13 02:01:09','2013-04-13 02:01:09'),(178,'kasrentals.com','2013-09-27','2013-04-13 02:01:15','2013-04-13 02:01:15'),(179,'kasrent.com','2013-09-11','2013-04-13 02:01:32','2013-04-13 02:01:32'),(180,'kasculture.com','2013-12-21','2013-04-13 02:01:52','2013-04-13 02:01:52'),(181,'kascamping.com','2013-05-29','2013-04-13 02:02:15','2013-04-13 02:02:15'),(182,'kastravel.com','2014-04-04','2013-04-13 02:02:18','2013-04-13 02:02:18'),(183,'kasapartment.com','2015-08-28','2013-04-13 02:02:31','2013-04-13 02:02:31'),(184,'kastour.com','2014-06-23','2013-04-13 02:02:33','2013-04-13 02:02:33'),(185,'kashealth.com','2014-08-28','2013-04-13 02:02:49','2013-04-13 02:02:49'),(186,'kasbusiness.com','2023-03-12','2013-04-13 02:03:01','2013-04-13 02:03:01'),(187,'kasestate.com','2018-07-01','2013-04-13 02:03:53','2013-04-13 02:03:53'),(188,'kasvillas.com','2014-03-11','2013-04-13 02:05:09','2013-04-13 02:05:09'),(189,'kasboat.com','2013-09-14','2013-04-13 02:06:52','2013-04-13 02:06:52'),(190,'kascruise.com','2013-09-19','2013-04-13 02:07:37','2013-04-13 02:07:37'),(191,'kasguide.com','2013-04-25','2013-04-13 02:10:52','2013-04-13 02:10:52'),(192,'kaslive.com','2013-09-19','2013-04-13 02:12:08','2013-04-13 02:12:08'),(193,'kasexplorers.com','2015-01-14','2013-04-13 02:12:32','2013-04-13 02:12:32'),(194,'kasventures.com','2013-10-26','2013-04-13 02:13:24','2013-04-13 02:13:24'),(195,'kasservices.com','2015-01-22','2013-04-13 02:13:41','2013-04-13 02:13:41'),(196,'kashotels.com','2013-11-24','2013-04-13 02:14:27','2013-04-13 02:14:27'),(197,'kasholidays.com','2014-03-01','2013-04-13 02:16:58','2013-04-13 02:16:58'),(198,'kastourism.com','2013-04-25','2013-04-13 02:17:00','2013-04-13 02:17:00'),(199,'kaseco.com','2014-07-19','2013-04-13 02:17:56','2013-04-13 02:17:56'),(200,'kasholiday.in','2014-04-06','2013-04-13 02:18:12','2013-04-13 02:18:12'),(201,'kasmarine.com','2013-05-31','2013-04-13 02:18:23','2013-04-13 02:18:23'),(202,'kassailing.com','2013-08-05','2013-04-13 02:20:17','2013-04-13 02:20:17'),(203,'kasfamily.com','2013-08-22','2013-04-13 02:21:49','2013-04-13 02:21:49'),(204,'kasmagazine.com','2014-01-26','2013-04-13 02:22:21','2013-04-13 02:22:21'),(205,'kasmotel.com','2014-04-12','2013-04-13 02:24:15','2013-04-13 02:24:15'),(206,'kaslife.com','2013-11-29','2013-04-13 02:26:10','2013-04-13 02:26:10'),(207,'kaseurope.com','2013-11-01','2013-04-13 02:26:38','2013-04-13 02:26:38'),(208,'kas.co','2013-07-20','2013-04-13 02:31:24','2013-04-13 02:31:24'),(209,'kasphotography.com','2013-05-09','2013-04-13 02:35:46','2013-04-13 02:35:46'),(210,'kasbooks.com','2013-12-12','2013-04-13 02:37:15','2013-04-13 02:37:15'),(211,'kasapartments.com','2013-04-26','2013-04-13 02:37:43','2013-04-13 02:37:43'),(212,'kasski.com','2013-05-11','2013-04-13 02:39:15','2013-04-13 02:39:15'),(213,'kasarts.com','2014-03-17','2013-04-13 02:39:21','2013-04-13 02:39:21'),(214,'kasagent.com','2013-06-08','2013-04-13 02:40:30','2013-04-13 02:40:30'),(215,'kashotel.com','2013-11-10','2013-04-13 02:42:09','2013-04-13 02:42:09'),(216,'kasapart.com','2013-07-14','2013-04-13 02:46:51','2013-04-13 02:46:51'),(217,'kasholiday.com','2014-01-28','2013-04-13 02:46:54','2013-04-13 02:46:54'),(218,'kasbar.com','2014-08-08','2013-04-13 02:49:51','2013-04-13 02:49:51'),(219,'kasaparts.com','2014-03-20','2013-04-13 02:53:23','2013-04-13 02:53:23'),(220,'kas.in','2013-11-25','2013-04-13 02:54:10','2013-04-13 02:54:10'),(221,'kas.com','2013-06-22','2013-04-13 03:00:43','2013-04-13 03:00:43'),(222,'kasairline.com','2014-03-13','2013-04-13 03:00:46','2013-04-13 03:00:46'),(223,'kastransfer.com','2014-03-12','2013-04-13 03:05:13','2013-04-13 03:05:13'),(224,'kasart.com','2014-02-12','2013-04-13 03:05:59','2013-04-13 03:05:59'),(225,'maroonbikes.com','2013-06-15','2013-04-13 03:19:43','2013-04-13 03:19:43'),(226,'marooncoffee.com','2014-01-08','2013-04-13 03:19:47','2013-04-13 03:19:47'),(227,'maroonarts.com','2013-10-21','2013-04-13 03:19:49','2013-04-13 03:19:49'),(228,'maroonfish.com','2013-12-27','2013-04-13 03:19:52','2013-04-13 03:19:52'),(229,'maroonbike.com','2013-08-10','2013-04-13 03:19:59','2013-04-13 03:19:59'),(230,'maroonriver.com','2013-07-20','2013-04-13 03:20:13','2013-04-13 03:20:13'),(231,'maroonresorts.com','2013-08-08','2013-04-13 03:20:15','2013-04-13 03:20:15'),(232,'marooninternational.com','2014-03-16','2013-04-13 03:20:23','2013-04-13 03:20:23'),(233,'maroonhotel.com','2014-03-13','2013-04-13 03:20:38','2013-04-13 03:20:38'),(234,'maroonspa.com','2013-08-28','2013-04-13 03:20:46','2013-04-13 03:20:46'),(235,'domain1.com','2018-12-16','2013-04-13 04:46:04','2013-04-13 04:46:04'),(236,'domain2.net','2013-09-11','2013-04-13 04:46:05','2013-04-13 04:46:05'),(237,'domain4.me','2014-08-08','2013-04-13 04:46:07','2013-04-13 04:46:07'),(238,'abicim.com','2013-09-26','2013-04-14 22:45:17','2013-04-14 22:45:17');
/*!40000 ALTER TABLE `watch_domains` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-25 23:04:23
