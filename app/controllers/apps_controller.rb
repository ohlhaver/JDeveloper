class AppsController < ApplicationController

  before_filter :login_required
  # GET /apps
  def index
    @apps = @current_developer.apps
  end

  # GET /apps/1
  def show
    @app = @current_developer.apps.find_by_id(params[:id])
    return if app_not_found(@app)
  end

  # GET /apps/new
  def new
    @app = App.new
  end

  # GET /apps/1/edit
  def edit
    @app = @current_developer.apps.find_by_id(params[:id])
    return if app_not_found(@app)
  end

  # POST /apps
  def create
    @app = App.new(params[:app])

    if @app.save and @current_developer.apps << @app
      flash[:notice] = 'App was successfully created.'
      redirect_to(@app) 
    else
      render :action => "new" 
    end
  end

  # PUT /apps/1
  def update
    @app = @current_developer.apps.find_by_id(params[:id])
    return if app_not_found(@app)

    if @app.update_attributes(params[:app])
      flash[:notice] = 'App was successfully updated.'
      redirect_to(@app) 
    else
      render :action => "edit" 
    end
  end

  def reset_secret_key
    @app = @current_developer.apps.find_by_id(params[:id])
    return if app_not_found(@app)
    @app.reset_secret_key
    
    if @app.save
      flash[:notice] = 'Secret key  was successfully reset.'     
      redirect_to(@app) 
    else
      redirect_to :back 
    end

  end

  def activate
    @app = @current_developer.apps.find_by_id(params[:id])
    return if app_not_found(@app)
    @app.is_active = true
    if @app.save
      flash[:notice] = 'App was successfully activated.'     
      redirect_to(@app) 
    else
      redirect_to :back 
    end
  end

  def deactivate
    @app = @current_developer.apps.find_by_id(params[:id])
    return if app_not_found(@app)
    @app.is_active = false
    if @app.save
      flash[:notice] = 'App was successfully de-activated.'     
      redirect_to(@app) 
    else
      redirect_to :back 
    end

  end

  # DELETE /apps/1
  #def destroy
  #  @app = App.find_by_id(params[:id])
  #  @app.destroy

  #  redirect_to(apps_url)
  #end

  protected

  def app_not_found(app)
    if app.blank?
      flash[:notice] = "You do not own the requested app."
      redirect_back_or_default(:action => 'index')
      return true
    end
    return false
  end
end
