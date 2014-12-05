class CreateEmployees < ActiveRecord::Migration
   def change
    create_table :employees do |t|
      t.string :name
      t.string :sex
      t.string :phone
      t.string :hdate
      t.string :salary
      t.references 'department'
      t.timestamps
    end
  end
  
end
