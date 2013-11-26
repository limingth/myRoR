class CreateArticalCategories < ActiveRecord::Migration
  def change
    create_table :artical_categories do |t|
    	t.belongs_to :article
    	t.belongs_to :category
      t.timestamps
    end
  end
end
