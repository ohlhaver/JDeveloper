class SourcePreferencesController < ApplicationController
  before_filter :login_required
  before_filter :find_app

  def index
    @source_preferences = @app.source_preferences.group_by{|sp| sp.source_id}
    @sources = Source.find(:all).sort_by{|s| s.name}
  end

  def update_or_create
    @source_preference = @app.source_preferences.find_by_source_id(params[:id])
    unless @source_preference
      @source_preference = SourcePreference.new(:source_id => params[:id], :preference => params[:preference])
    end

    if (@source_preference.new_record? and @app.source_preferences << @source_preference) or 
       (not @source_preference.new_record? and @source_preference.update_attributes({:preference => params[:preference]}))
      flash[:notice] = 'Source preference was successfully updated.'
    else
      flash[:notice] = 'Problem while updating source preference'
    end

    redirect_to source_preferences_path(:app_id => @app.id)
  end

  protected
  def find_app
    @app_id = params[:app_id]
    unless @app_id
      redirect_to apps_url 
      return
    end
    @app = @current_developer.apps.find_by_id(@app_id)
    unless @app
      flash[:notice] = "You do not own the requested app."
      redirect_to apps_url 
    end
  end
end
