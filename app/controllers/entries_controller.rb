class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    if !current_user.admin?
      redirect_to root_path, notice: "You don't have the permission to view this page."
    else
      @entries = Entry.all
      @entries_today = Entry.where("created_at >= ?", Time.zone.now.beginning_of_day)
      @users = User.all  
    end

  end

  def show
    if !current_user.member
      redirect_to root_path, notice: "This is a member only page."
    else 
      if current_user != @entry.user
        redirect_to root_path, notice: "You don't have the permission to view this page."      
      end
    end      
  end

  def new
    if !current_user.member
      redirect_to root_path, notice: "This is a member only page."
    end

    @entry = Entry.new
  end

  def edit
    if !current_user.member
      redirect_to root_path, notice: "This is a member only page."
    end

  end

  def create
    if !current_user.member
      redirect_to root_path, notice: "This is a member only page."
    end

    @entry = Entry.new(entry_params)
    @entry.user = current_user

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Your daily health check response was successfully recorded.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    if !current_user.member
      redirect_to root_path, notice: "This is a member only page."
    end

    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    if !current_user.member
      redirect_to root_path, notice: "This is a member only page."
    end

    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
    end
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, notice: "The page you are looking does not exist."

    end

    def entry_params
      params.require(:entry).permit(:question_one, :question_two, :question_three, :question_four, :user_id)
    end
end
