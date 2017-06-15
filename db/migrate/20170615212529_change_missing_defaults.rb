class ChangeMissingDefaults < ActiveRecord::Migration[5.0]
  def change
    change_column_default :panels, :width, 800
    change_column_default :panels, :height, 420
  end
end
