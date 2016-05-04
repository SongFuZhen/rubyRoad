class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :nick_name
      t.string :nr
      t.string :bio
      t.date :birthday

      t.timestamps
    end
  end
end
