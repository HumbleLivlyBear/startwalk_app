class ReturnMethodsController < ApplicationController

  before_filter :find_all_return_methods
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @return_method in the line below:
    present(@page)
  end

  def show
    @return_method = ReturnMethod.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @return_method in the line below:
    present(@page)
  end

protected

  def find_all_return_methods
    @return_methods = ReturnMethod.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/return_methods").first
  end

end
