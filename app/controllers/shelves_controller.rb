class ShelvesController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @shelves = current_user.shelves
    @other_selves = 'var'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shelves }
    end
  end

  def show
    @shelf = Shelf.find(params[:id])
    @domains = @shelf.domains
    
    if current_user.has_shelf_access(@shelf)
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @shelf }
      end
    else
      redirect_to :root, :notice => 'Its not your shelf!'
    end
    
  end

  def new
    @shelf = Shelf.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shelf }
    end
  end

  def edit
    @shelf = Shelf.find(params[:id])
  end

  def create
    @shelf = Shelf.new(params[:shelf])
    @shelf.user_id = current_user.id
    
    respond_to do |format|
      if @shelf.save
        format.html { redirect_to @shelf, notice: 'Shelf was successfully created.' }
        format.json { render json: @shelf, status: :created, location: @shelf }
      else
        format.html { render action: "new" }
        format.json { render json: @shelf.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @shelf = Shelf.find(params[:id])

    respond_to do |format|
      if @shelf.update_attributes(params[:shelf])
        format.html { redirect_to @shelf, notice: 'Shelf was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shelf.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shelf = Shelf.find(params[:id])
    
    if current_user.has_object(@shelf)
      @shelf.destroy
    elsif current_user.has_shelf_access(@shelf)
      @shelf_access = ShelfAccess.where(:shelf_id => @shelf.id, :user_id => current_user.id).first
      @shelf_access.destroy
    end

    respond_to do |format|
      format.html { redirect_to shelves_url }
      format.json { head :no_content }
    end
  end
end
