module SourcePreferencesHelper

  def find_preference(source_id, source_preferences = @source_preferences)
     p = @source_preferences[source_id]
     p = p.blank? ? SourcePreference::HIGHLY_PREFERED : p.first.preference
     return p
  end

  def preference_options_for_select
    SourcePreference.all_preferences.collect{|p| [SourcePreference.display_name(p), p]}
  end
end
