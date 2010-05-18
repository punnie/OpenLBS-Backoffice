class PackagesController < ApplicationController
  # GET /packages
  # GET /packages.xml
  def index
    @packages = Package.all

    @packages_json = Package.find(:all, :conditions => ["version > 0"])

    respond_to do |format|
      format.html # index.html.erb
      format.json # index.json.erb
      #format.xml  # index.xml.builder
    end
  end

  # GET /packages/1
  # GET /packages/1.xml
  def show
    @package = Package.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json # show.json.erb
      #format.xml  { render :xml => @package }
    end
  end

  # GET /packages/new
  # GET /packages/new.xml
  def new
    @package = Package.new
  end

  # POST /packages
  # POST /packages.xml
  def create
    @package = Package.new(params[:package])

    if @package.save
      flash[:notice] = 'Package was successfully created.'
      redirect_to(@package)
    else
      render :action => "new"
    end
  end

  # PUT /packages/1
  # PUT /packages/1.xml
  def update
    @package = Package.find(params[:id])

    if @package.needs_update?
      if @package.update_version
        flash[:notice] = 'Package was successfully updated.'
        redirect_to(@package)
      else
        render :action => "show"
      end
    else
      flash[:error] = 'Package don\'t need no updating, fool!'
      redirect_to(@package)
    end
  end

  # DELETE /packages/1
  # DELETE /packages/1.xml
  def destroy
    @package = Package.find(params[:id])
    @package.destroy

    redirect_to(packages_url)
  end
end
