class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :contact_find, only: [:show, :edit, :update, :destroy]
  after_action :contact_add, only: [:create, :update]
  before_action :contact_add, only: [:destroy]

  def index
    user = current_user.id
    @contacts = Contact.where(idcreator: user).order(created_at: :desc).page(params[:page])
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

  def contact_add
    id_visitor = @contact.idvisitor
    userencrypted = Username.find_by(id: id_visitor).encrypted_password
    if $all_statistic_visitors
      if $all_statistic_visitors.get userencrypted + "contact"
        $all_statistic_visitors.del userencrypted + "contact"
      end
    end

  end

  def contact_params
    params.require(:contact).permit(:idvisitor, :idcreator, :codecreator)
  end
end
