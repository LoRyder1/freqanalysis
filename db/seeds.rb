
Document.create!(filename: "example1.docx")
Document.create!(filename: "test.docx")
Word.create!(document_id: 1, original_word: "talked" , stem: "talk")
Word.create!(document_id: 1, original_word: "talks" , stem: "talk")
Word.create!(document_id: 1, original_word: "talking" , stem: "talk")
Word.create!(document_id: 1, original_word: "cats" , stem: "cat")