class VisitorsController < ApplicationController
  def index
    @visitors  = Visitor.all
  end

  def show
      @visitor = Visitor.find(params[:id])
    end

  def new
      @visitor = Visitor.new
  end

  def edit
  @visitor = Visitor.find(params[:id])
end

  def create
      @visitor = Visitor.new(visitor_params)

      if @visitor.save
      redirect_to @visitor
    else
      render 'new'
    end
  end

  def update
  @visitor = Visitor.find(params[:id])

  if @visitor.update(visitor_params)
    redirect_to '/profilevisitor/'
  else
    render 'edit'
  end
end

def destroy
  @visitor = Visitor.find(params[:id])
  @visitor.destroy

  redirect_to '/topics/'
end

  private
  def visitor_params
      params.require(:visitor).permit(:name, :surname, :telephone, :birthdate,
        :photo, :promocode, :country, :city, :idregvis, :sex)
  end
end
