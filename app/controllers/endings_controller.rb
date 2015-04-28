class EndingsController < ApplicationController
  
  before_filter :authenticate_user!
  
  # GET /endings
  # GET /endings.json
  def index
    
    if current_user.is_super_user?
      @endings = Ending.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @endings }
      end
    else
      redirect_to root_url
    end

  end

  # GET /endings/1
  # GET /endings/1.json
  def show
    
    if current_user.is_super_user?
      @ending = Ending.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @ending }
      end
    else
      redirect_to root_url
    end
    
  end

  # GET /endings/new
  # GET /endings/new.json
  def new
    if current_user.is_super_user?
      @ending = Ending.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @ending }
      end
    else
      redirect_to root_url
    end
  end

  # GET /endings/1/edit
  def edit
    if current_user.is_super_user?
      @ending = Ending.find(params[:id])
    else
      redirect_to root_url
    end
  end

  def create
    
    if current_user.is_super_user?
      
      fix_endings = params[:ending][:content].gsub(/(?:\n\r?|\r\n?)/, ', ')
      params[:ending][:content] = fix_endings.downcase

      @ending = Ending.new(params[:ending])

      respond_to do |format|
        if @ending.save
          format.html { redirect_to @ending, notice: 'Ending was successfully created.' }
          format.json { render json: @ending, status: :created, location: @ending }
        else
          format.html { render action: "new" }
          format.json { render json: @ending.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_url
    end
    
  end

  # PUT /endings/1
  # PUT /endings/1.json
  def update
    if current_user.is_super_user?
      @ending = Ending.find(params[:id])

      fix_endings = params[:ending][:content].gsub(/(?:\n\r?|\r\n?)/, ', ')
      params[:ending][:content] = fix_endings.downcase

      respond_to do |format|
        if @ending.update_attributes(params[:ending])
          format.html { redirect_to @ending, notice: 'Ending was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @ending.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_url
    end
  end

  # DELETE /endings/1
  # DELETE /endings/1.json
  def destroy
    if current_user.is_super_user?
      @ending = Ending.find(params[:id])
      @ending.destroy

      respond_to do |format|
        format.html { redirect_to endings_url }
        format.json { head :no_content }
      end
    else
      redirect_to root_url
    end
  end
end
