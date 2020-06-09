class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params.require(:page).permit(:title, :content))

    if @page.save
      redirect_to @page
    else
      render "new"
    end
  end
end
