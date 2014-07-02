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
    @slug = 'contact'
    page_content @slug
  end
  
  def page_content slug
    page = Page.where(slug: slug).first
    
    @title = page.title
    @content = page.content.html_safe
  end
end