class ChangePanelDefaults < ActiveRecord::Migration[5.0]
  def change
    change_column_default :panels, :title, "Missing"
    change_column_default :panels, :width, 600
    change_column_default :panels, :height, 800
    change_column_default :panels, :page, 9999
    change_column_default :panels, :hovertext, "I just don't know what went wrong!"
    change_column_default :panels, :comment, "Looks like there's nothing here. Wierd."
  end
end
