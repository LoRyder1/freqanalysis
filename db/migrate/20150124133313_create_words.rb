class CreateWords < ActiveRecord::Migration
  def change
  	create_table :words do |t|
  		t.integer :document_id
  		t.json :word_array
  		t.string :original_word
  		t.string :stem
  		t.timestamps
  	end
  end
end
