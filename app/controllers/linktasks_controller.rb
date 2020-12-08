class LinktasksController < ApplicationController

  before_action :linktask_find, only: [:show, :edit, :update, :destroy]

  def index
    @linktasks  = Linktask.all
  end

  def show
  end

  def new
    @linktasks  = Linktask.all
    @linktask = Linktask.new
  end

  def edit
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
    if @linktask.update(link_params)
      redirect_to @linktask
    else
      render 'edit'
    end
  end

  def destroy
    @linktask.destroy
    redirect_to '/topics/'
  end

    private

    def linktask_find
      @linktask = Linktask.find(params[:id])
    end

    def link_params
        params.require(:linktask).permit(:link, :idcreator, :codecreator, :topicid, :userid, :viewlinks)
    end
  end
