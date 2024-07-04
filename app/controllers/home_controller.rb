class HomeController < ApplicationController
  def top
    flash[:notice] = "successfully"
  end

  def about
  end
end