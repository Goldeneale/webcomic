class PanelsController < ApplicationController
  def home
    if Panel.exists?(Panel.all.order_home.last)
      @panel = Panel.all.order_home.last
    else
      @panel = Panel.new
    end
  end
  
  def new
    @image = Panel.new
  end
  
  def page
    if Panel.exists?(Panel.find_by page: params[:page])
        @panel = Panel.find_by page: params[:page]
    else
        @panel = Panel.new
    end
  end
  
  def view
    @panels = Panel.all
  end
  
  def edit
    if Panel.exists?(Panel.find_by page: params[:page])
      @panel = Panel.find_by page: params[:page]
    else
      @panel = Panel.new
    end
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
    if params[:destroy_panel]
      @panel.delete
      flash[:warning] = "Panel deleted."
      redirect_to gallery_path
    else 
      if @panel.update(panel_params)
        flash[:success] = "Successfully updated panel in database."
        redirect_to page_path(page: @panel.page)
      else
        flash[:danger] = @panel.errors.full_messages.join(", and")
        redirect_to admin_edit_path(page: params[:old_page])
      end
    end
    
  end
  
  def first_page
    Panel.order(:page).first.page
  end
  
  def last_page
    Panel.order(:page).last.page
  end
  
  private
    def panel_params
      params.require(:panel).permit(:title, :image, :page, :width, :height, :hovertext, :comment)
    end
    
end
