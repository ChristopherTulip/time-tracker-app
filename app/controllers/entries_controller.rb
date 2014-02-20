class EntriesController < ApplicationController
  respond_to :json, except: ["main"]

  before_filter :restrict_access, except: [:main]

  def index
    @entries = Entry.all
  end

  def create
    @entry = current_user.entries.build(started_at: Time.now)
    @entry.save
  end

  def update
    @entry = current_user.entries.find(params[:id])
    @entry.update(ended_at: params[:ended_at])
  end

  def destroy
    @entry = current_user.entries.find(params[:id])
    @entry.delete
  end

  def main
  end

end
