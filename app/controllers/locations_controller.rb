class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.xml
  def index
    @packages = Package.all
  end

  # GET /locations/1
  # GET /locations/1.xml
  def show
    @location = Location.find(params[:id])
  end

  # GET /locations/new
  # GET /locations/new.xml
  def new
    @location = Location.new

    if params[:package].nil?
      flash[:error] = 'Can\'t create a location without a package!'
      redirect_to :back rescue redirect_to packages_url
      return
    end

    @location.package = Package.find_by_id(params[:package])
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.xml
  def create
    @location = Location.new(params[:location])

    if @location.save
      flash[:notice] = 'Location was successfully created.'
      redirect_to(@location)
    else
      render :action => "new"
    end
  end

  # PUT /locations/1
  # PUT /locations/1.xml
  def update
    @location = Location.find(params[:id])
    
    if @location.update_attributes(params[:location])
      flash[:notice] = 'Location was successfully updated.'
      redirect_to(@location)
    else
      render :action => "edit"
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.xml
  def destroy
    @location = Location.find(params[:id])

    if @location.toggle_deleted
      flash[:notice] = 'Location was successfully modified.'
      redirect_to :back
    else
      flash[:error] = 'Some error just ocurred.'
      reditect_to :back
    end
  end
end
