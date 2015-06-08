class Examiner::TypeQuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :examiner_permission

  def show
    @type_question = TypeQuestion.find params[:id]
  end

  def index
    @type_questions = TypeQuestion.all
  end

  def new
    @type_question = TypeQuestion.new
  end

  def create
    @type_question = TypeQuestion.new type_question_params
    if @type_question.save
      flash[:notice] = "A type question has been created"
      redirect_to examiner_type_questions_path
    else
      render "new"
    end
  end

  def edit
    @type_question = TypeQuestion.find params[:id]
  end

  def update
    @type_question = TypeQuestion.find params[:id]
    if @type_question.update_attributes type_question_params
      flash[:notice] = "Type question has been updated"
      redirect_to examiner_type_questions_path
    else
      render "edit"
    end
  end

  def destroy
    @type_question = TypeQuestion.find params[:id]
    @type_question.destroy
    redirect_to examiner_type_questions_path
  end

  private
  def type_question_params
    params.require(:type_question).permit :name, :description
  end
end
