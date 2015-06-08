class Examiner::QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :examiner_permission

  def show
    @question = Question.find params[:id]
    @sample_answers = @question.sample_answers
  end

  def index
  end

  def new
    @question = Question.new
    @type_questions = TypeQuestion.all
    @category = Category.find params[:category_id]
    4.times {@question.sample_answers.build}
  end

  def create
    @question = Question.new question_params
    if @question.save
      redirect_to examiner_category_path @question.category
    else
      render "new"
    end
  end

  def edit
    @question = Question.find params[:id]
    @category = @question.category
    @type_questions = TypeQuestion.all
  end

  def update
    @question = Question.find params[:id]
    if @question.update_attributes question_params
      redirect_to examiner_category_path @question.category
    else
      render "edit"
    end
  end

  def destroy
    @question = Question.find params[:id]
    @question.destroy
    flash[:notice] = "Question has been deleted"
    redirect_to examiner_category_path @question.category
  end

  private
  def question_params
    params.require(:question).permit(:category_id, :type_question_id, :content, :answer_key,
      sample_answers_attributes: [:id, :content, :is_correct])
  end
end
