class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :slug, :title
      t.text :content

      t.timestamps
    end
  end
end
