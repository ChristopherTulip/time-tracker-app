class SessionsController < ApplicationController
  respond_to :json

  def create
    @user = User.find_by_email params[:email]
    @errors = []

    if @user.present? && @user.authenticate(params[:password])
      @user.generate_access_token
    else
      @errors << "authentication failed"
    end
  end

end
