class StatisticscreatorsController < ApplicationController
  def index
    @statisticscreators  = Statisticscreator.all
  end

  def show
      @statisticscreator = Statisticscreator.find(params[:id])
    end

  def new
    @statisticscreator = Statisticscreator.new
  end

  def edit
  @statisticscreator = Statisticscreator.find(params[:id])
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
  @statisticscreator = Statisticscreator.find(params[:id])

  if @statisticscreator.update(statisticscreator_params)
    redirect_to @statisticscreator
  else
    render 'edit'
  end
end

def destroy
  @statisticscreator = Statisticscreator.find(params[:id])
  @statisticscreator.destroy

  redirect_to '/topics/'
end

  private
  def statisticscreator_params
      params.require(:statisticscreator).permit(:test, :survey, :idreg)
  end
end
