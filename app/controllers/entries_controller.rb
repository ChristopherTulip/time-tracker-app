class EntriesController < ApplicationController
  respond_to :json, except: ["main"]

  before_filter :find_user, except: [:main]

  def index
    @entries = Entry.all
  end

  def create
    @entry = @user.entries.build(started_at: Time.now)
    @entry.save
  end

  def update
    @entry = @user.entries.find(params[:id])
    @entry.update(ended_at: params[:ended_at])
  end

  def destroy
    @entry = @user.entries.find(params[:id])
    @entry.delete
  end

  def main
  end

private

  def find_user
    @user = User.find(params[:user_id])
  end
end
