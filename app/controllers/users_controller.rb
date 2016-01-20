class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:check]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def check
    user = User.find_by(email: params[:email])

    if user
      content =  '<div class="text-danger">
                  There is a user with this email in the database.
                </div>'
    else
      content = ''
    end
    respond_to do |format|
      format.js { render json: { content: content }}
    end
  end
end
