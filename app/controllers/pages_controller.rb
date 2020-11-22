class PagesController < ApplicationController
  def home
  end

  def contact
  end

  def about
  end

  def all_time_responses
    @entries = Entry.all
    @users = User.all
  end

  def my_page
    if !current_user.nil?
      @user = current_user
    else
      redirect_to root_path, notice: "Please join or sign in."
    end
  end

  def not_found
    redirect_to root_path, notice: "The page you are looking for does not exist."
  end

end
