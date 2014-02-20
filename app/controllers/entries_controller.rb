class EntriesController < ApplicationController
  respond_to :json, except: ["main"]

  def index
    @entries = Entry.all
  end

  def main
  end

end
