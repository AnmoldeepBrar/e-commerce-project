class ContactPagesController < ApplicationController
    def show
      @contact_page = ContactPage.first # Assuming there's only one contact page
      render 'contact_pages/show'
    end
  end