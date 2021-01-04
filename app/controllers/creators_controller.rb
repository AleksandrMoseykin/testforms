class CreatorsController < ApplicationController
  before_action :authenticate_user!
  before_action :creator_find, only: [:show, :edit, :update, :destroy]
  after_action :creator_delete, only: [:edit]

  def index
    @creators  = Creator.all
    redirect_to '/creators/new'
  end

  def show
    redirect_to '/profile/'
  end

  def new
    @creator = Creator.new
  end

  def edit
  end

  def create
    @creator = Creator.new(creator_params)

    if @creator.save
      redirect_to @creator
    else
      render 'new'
    end
  end

  def update
    if @creator.update(creator_params)
      redirect_to '/profile/'
    else
      render 'edit'
    end
  end

def destroy
  @creator.destroy
  redirect_to '/topics/'
end

  private

  def creator_find
    @creator = Creator.find(params[:id])
  end

  def creator_delete
    val = ["surnamecreator", "namecreator", "telephonecreator", "company", "promocode"]
    val.each do |value|
      $creator.del value + current_user.id.to_s
    end
  end

  def creator_params
    params.require(:creator).permit(:namecreator, :surnamecreator, :telephonecreator, :emailcreator,
        :photocreator, :companycreator, :promocodecreator, :idreg, :codecreator)
  end
end
