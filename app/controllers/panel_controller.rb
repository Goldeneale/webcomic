class PanelController < ApplicationController
  def home
  end
  
  def new
    @panel = Panel.new
  end
end
