class PanelsController < ApplicationController
  def home
  end
  
  def new
    @panel = Panel.new
  end
  
  def create
    @panel = Panel.new(panel_params)
    if @panel.save
      flash[:success] = "Successfully saved panel to database."
      redirect_to new_panel_path
    else
      flash[:danger] = @panel.errors.full_messages.join(", and")
      redirect_to new_panel_path
    end
  end
  
  private
    def panel_params
      params.require(:panel).permit(:title, :panel, :page, :width, :height, :hovertext, :comment)
    end
    
end
