class AboutPagesController < ApplicationController
  def show
    @about_page = AboutPage.first # Assuming there's only one about page
    render 'about_pages/show'
  end
end