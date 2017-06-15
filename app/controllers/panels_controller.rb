class PanelsController < ApplicationController
  def home
    @panel = Panel.order(:page).last
  end
  
  def new
    @image = Panel.new
  end
  
  def page
    @panel = Panel.find_by page: params[:page]
  end
  
  def view
    @panels = Panel.all
  end
  
  def edit
    @panel = Panel.find_by page: params[:page]
    @page = @panel.page
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
  
  def update
    @panel = Panel.find_by page: params[:old_page]
    if @panel.update(panel_params)
      flash[:success] = "Successfully updated panel in database."
      redirect_to page_path(page: @panel.page)
    else
      flash[:failure] = @panel.errors.full_messages.join(", and")
      redirect_to admin_edit_path(page: params[:old_page])
    end
    
  end
  
  private
    def panel_params
      params.require(:panel).permit(:title, :image, :page, :width, :height, :hovertext, :comment)
    end
    
end
