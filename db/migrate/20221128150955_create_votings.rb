class CreateVotings < ActiveRecord::Migration[7.0]
  def change
    create_table :votings do |t|
      t.references :wishlistgift, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
