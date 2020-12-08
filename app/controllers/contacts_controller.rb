class ContactsController < ApplicationController

  before_action :contact_find, only: [:show, :edit, :update, :destroy]

  def index
    @contacts  = Contact.all
    @contact = Contact.new
  end

  def show
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
    redirect_to '/contacts/'
    else
      redirect_to '/contacts/'
    end
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact
    else
      render 'edit'
    end
  end

def destroy
  @contact.destroy
  redirect_to '/contacts/'
end

  private
  def contact_find
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:idvisitor, :idcreator, :codecreator)
  end
end
