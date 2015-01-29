class CreateDocuments < ActiveRecord::Migration
  def change
  	create_table :documents do |t|
  		t.string :name
  		t.string :file
  		t.text :text
  		t.timestamps
  	end
  end
end
