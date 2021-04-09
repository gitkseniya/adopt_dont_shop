# frozen_string_literal: true

class ChangeStatusColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :applications, :status, 'In Progress'
  end
end
