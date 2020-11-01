class LinktasksController < ApplicationController
  def index
    @linktasks  = Linktask.all
  end

  def show
    @linktask = Linktask.find(params[:id])
  end

  def new
      @linktasks  = Linktask.all
      @linktask = Linktask.new
  end

  def edit
    @linktask = Linktask.find(params[:id])
  end

  def create
    @linktask = Linktask.new(link_params)

    if @linktask.save
      redirect_to '/topics/'
    else
      render 'new'
    end
  end

  def update
    @linktask = Linktask.find(params[:id])
    if @linktask.update(link_params)
      redirect_to @linktask
    else
      render 'edit'
    end
  end

  def destroy
    @linktask = Linktask.find(params[:id])
    @linktask.destroy

    redirect_to '/topics/'
  end

    private
    def link_params
        params.require(:linktask).permit(:link, :idcreator, :codecreator, :topicid, :userid, :viewlinks)
    end
      end
