class CreateFavorites < ActiveRecord::Migration[5.2]
    def change
        create_table :favorites do |t|
            t.belongs_to :user #doing t.belongs_to instead of t.integer :user_id - hopefully it doesn't screw things up!
            t.belongs_to :joke
        end
    end
end