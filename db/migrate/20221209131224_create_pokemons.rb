class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :type1
      t.string :type2
      t.integer :number
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
