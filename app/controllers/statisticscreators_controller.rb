class StatisticscreatorsController < ApplicationController

  before_action :statisticscreator_find, only: [:show, :edit, :update, :destroy]

  def index
    @statisticscreators  = Statisticscreator.all
    $all_task_creat = Redis.new
  end

  def show
  end

  def new
    @statisticscreator = Statisticscreator.new
  end

  def edit
  end

  def create
    @statisticscreator = Statisticscreator.new(statisticscreator_params)

    if @topic.save
      redirect_to @statisticscreator
    else
      render 'new'
    end
  end

  def update
    if @statisticscreator.update(statisticscreator_params)
      redirect_to @statisticscreator
    else
      render 'edit'
    end
  end

  def destroy
    @statisticscreator.destroy
    redirect_to '/topics/'
  end

  private

  def topic_find
    @statisticscreator = Statisticscreator.find(params[:id])
  end

  def statisticscreator_params
    params.require(:statisticscreator).permit(:test, :survey, :idreg)
  end
end
