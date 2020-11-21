class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @entries = Entry.all
    @users = User.all
  end

  def show
  end

  def new
    @entry = Entry.new
  end

  def edit
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
    end
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:question_one, :question_two, :question_three, :question_four, :user_id)
    end
end
