class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :show

  def show
    @user = User.find params[:id]
    @user_session_exams = @user.user_session_exams
    @answer_sheets = Kaminari.paginate_array(@user.get_answer_sheets)
      .page(params[:page]).per(5)
  end

  private
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end