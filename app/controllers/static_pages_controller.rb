class StaticPagesController < ApplicationController
  def home
  end

  def contact
    respond_to do |format|
      format.html { redirect_to 'static_pages/home' }
      format.js
    end
  end
end
