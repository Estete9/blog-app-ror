class DropBeesTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :bees, if_exists: true
    execute 'DROP SEQUENCE IF EXISTS bees_id_seq'
  end
end
