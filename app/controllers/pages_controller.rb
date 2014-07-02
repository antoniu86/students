class PagesController < ApplicationController
  def index
    @slug = 'index'
    page_content @slug
  end
  
  def about
    @slug = 'about'
    page_content @slug
  end
  
  def ruby
    @slug = 'ruby'
    page_content @slug
  end
  
  def rails
    @slug = 'rails'
    page_content @slug
  end
  
  def contact
    @contact = Contact.new
    
    info
    
    @slug = 'contact'
    page_content @slug
  end
  
  def page_content slug
    page = Page.where(slug: slug).first
    
    @title = page.title
    @content = page.content.html_safe
  end
  
  def info
    if params[:alert]
      flash.now[:alert] = 'Contactarea nu a putut fi transmisa!'
    elsif params[:notice]
      flash.now[:notice] = 'Contactare transmisa cu success!'
    end
  end
end