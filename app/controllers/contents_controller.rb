class ContentsController < ApplicationController
  # GET /contents
  # GET /contents.xml
  def index
    @contents = Content.all
  end

  # GET /contents/1
  # GET /contents/1.xml
  def show
    @content = Content.find(params[:id])
  end

  # GET /contents/new
  # GET /contents/new.xml
  def new
    @content = Content.new

    if params[:location].nil?
      flash[:error] = "Can't create content without a location!"
      redirect_to :back rescue redirect_to packages_url
      return
    end

    @content.location = Location.find_by_id(params[:location])
  end

  # GET /contents/1/edit
  def edit
    @content = Content.find(params[:id])
  end

  # POST /contents
  # POST /contents.xml
  def create
    @content = Content.new(params[:content])

    if @content.save
      flash[:notice] = 'Content was successfully created.'
      redirect_to(@content.location)
    else
      render :action => "new"
    end
  end

  # PUT /contents/1
  # PUT /contents/1.xml
  def update
    @content = Content.find(params[:id])

    if @content.update_attributes(params[:content])
      flash[:notice] = 'Content was successfully updated.'
      redirect_to(@content)
    else
      render :action => "edit"
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.xml
  def destroy
    @content = Content.find(params[:id])

    if @content.toggle_deleted
      flash[:notice] = 'Content was successfully modified.'
      redirect_to :back
    else
      flash[:error] = 'Some error just ocurred.'
      reditect_to :back
    end
  end
end
