class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  @insert_pics = true
  def self.initial_update(i)
    if i
        j = 1
        while j < 38
          url = "/assets/p#{j}.JPG"
          Picture.find_or_create_by( :title=> "p#{j}", :url => url)
          j += 1
        end
        @insert_pics = false
    end
  end

  self.initial_update(@insert_pics)
end
