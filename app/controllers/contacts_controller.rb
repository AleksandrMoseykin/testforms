class ContactsController < ApplicationController
  def index
    @contacts  = Contact.all
    @contact = Contact.new
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
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
    @contact = Contact.find(params[:id])

  if @contact.update(contact_params)
    redirect_to @contact
  else
    render 'edit'
  end
end

def destroy
  @contact = Contact.find(params[:id])
  @contact.destroy

  redirect_to '/contacts/'
end

  private
  def contact_params
      params.require(:contact).permit(:idvisitor, :idcreator, :codecreator)
  end
end
