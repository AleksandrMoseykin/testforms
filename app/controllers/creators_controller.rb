class CreatorsController < ApplicationController
  def index
    @creators  = Creator.all
  end

  def show
      @creator = Creator.find(params[:id])
    end

  def new
      @creator = Creator.new
  end

  def edit
  @creator = Creator.find(params[:id])
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
  @creator = Creator.find(params[:id])

  if @creator.update(creator_params)
    redirect_to '/profile/'
  else
    render 'edit'
  end
end

def destroy
  @creator = Creator.find(params[:id])
  @creator.destroy

  redirect_to '/topics/'
end

  private
  def creator_params
      params.require(:creator).permit(:namecreator, :surnamecreator, :telephonecreator, :emailcreator,
        :photocreator, :companycreator, :promocodecreator, :idreg)
  end
end
