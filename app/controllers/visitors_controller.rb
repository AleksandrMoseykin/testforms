class VisitorsController < ApplicationController
  before_action :authenticate_username!
  before_action :visitor_find, only: [:show, :edit, :update, :destroy]
  after_action :visitor_delete, only: [:edit]

  def index
    @visitors  = Visitor.all
    redirect_to '/visitors/new'
  end

  def show
    redirect_to '/profilevisitor/'
  end

  def new
      @visitor = Visitor.new
  end

  def edit
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
    if @visitor.update(visitor_params)
      redirect_to '/profilevisitor/'
    else
      render 'edit'
    end
  end

  def destroy
    @visitor.destroy
    redirect_to '/topics/'
  end

  private

  def visitor_delete
    val1 = ["visitor_surname", "visitor_name", "visitor_telephone", "visitor_sex"]
    val2 = ["visitor_age", "visitor_country", "visitor_city"]
    val = val1 + val2
    val.each do |value|
      $visitor_name.del value + current_username.id.to_s
    end
  end

  def visitor_find
    @visitor = Visitor.find(params[:id])
  end

  def visitor_params
    params.require(:visitor).permit(:name, :surname, :telephone, :birthdate,
        :photo, :promocode, :country, :city, :idregvis, :sex, :codevisitor)
  end
end
