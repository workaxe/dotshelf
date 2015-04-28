class RegistrarsController < ApplicationController
  # GET /registrars
  # GET /registrars.json
  def index
    @registrars = Registrar.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registrars }
    end
  end

  # GET /registrars/1
  # GET /registrars/1.json
  def show
    @registrar = Registrar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @registrar }
    end
  end

  # GET /registrars/new
  # GET /registrars/new.json
  def new
    @registrar = Registrar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @registrar }
    end
  end

  # GET /registrars/1/edit
  def edit
    @registrar = Registrar.find(params[:id])
  end

  # POST /registrars
  # POST /registrars.json
  def create
    @registrar = Registrar.new(params[:registrar])

    respond_to do |format|
      if @registrar.save
        format.html { redirect_to @registrar, notice: 'Registrar was successfully created.' }
        format.json { render json: @registrar, status: :created, location: @registrar }
      else
        format.html { render action: "new" }
        format.json { render json: @registrar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /registrars/1
  # PUT /registrars/1.json
  def update
    @registrar = Registrar.find(params[:id])

    respond_to do |format|
      if @registrar.update_attributes(params[:registrar])
        format.html { redirect_to @registrar, notice: 'Registrar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @registrar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrars/1
  # DELETE /registrars/1.json
  def destroy
    @registrar = Registrar.find(params[:id])
    @registrar.destroy

    respond_to do |format|
      format.html { redirect_to registrars_url }
      format.json { head :no_content }
    end
  end
end
