class App < ActiveRecord::Base

  def reset_secret_key
    make_secret_key
  end
end

