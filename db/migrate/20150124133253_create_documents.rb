class CreateDocuments < ActiveRecord::Migration
  def change
  	create_table :documents do |t|
  		t.string :filename
  		t.timestamps
  	end
  end
end
