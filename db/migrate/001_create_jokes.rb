class CreateJokes < ActiveRecord::Migration[5.2]
    def change
        create_table :jokes do |t|
            t.string :title
            t.string :setup
            t.string :punchline
            t.belongs_to :category
        end
    end
end