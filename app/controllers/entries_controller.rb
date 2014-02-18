class EntriesController < ApplicationController
  respond_to :json, except: ["main"]

  def show

  end

  def main
  end

end
