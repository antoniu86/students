class ContactsController < ApplicationController
  before_action :authenticate_user!, except: [:create]
  
  def index
    @contacts = Contact.all
  end
  
  def create
    @contact = Contact.new(send_contact)
    
    if @contact.save
      success = true
    else
      success = false
    end
    
    redirect_to controller: 'pages', action: 'contact', alert: (true unless success), notice: (true if success)
  end
  
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to action: nil
  end
  
  private
  
  def send_contact
    params.require(:contact).permit(:name, :email, :phone, :message)
  end
end
