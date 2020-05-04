class ChangeColumnInTable < ActiveRecord::Migration[5.2]
  def change
    change_column(:locals, :aceptado, :boolean, default: false)
  end
end
