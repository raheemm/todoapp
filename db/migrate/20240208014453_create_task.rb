class CreateTask < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string  :title
      t.boolean :status
      t.datetime  :created_at
      t.datetime  :updated_at 
    end
  end
end
