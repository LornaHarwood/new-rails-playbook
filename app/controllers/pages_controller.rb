class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to @page
    else
      render "new"
    end
  end

  def update
    @page = Page.find(params[:id])

    if @page.update(page_params)
      redirect_to @page
    else
      render "edit"
    end
  end

  def page_params
    params.require(:page).permit(:title, :content)
  end
end
