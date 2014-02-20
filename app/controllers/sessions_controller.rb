class SessionsController < ApplicationController
  respond_to :json

  before_filter :restrict_access, only: [:destroy]

  def create
    @user = User.find_by_email params[:email]
    @errors = []

    if @user.present? && @user.authenticate(params[:password])
      @user.generate_access_token
    else
      @errors << "authentication failed"
      respond_with @errors, status: 401
    end
  end

  def destroy
    current_user.access_token = nil
    current_user.save
  end

end
