require 'spec_helper'

describe "Book File" do

  it 'creates the filename for a hardcover book' do
    hardcover_book = build_book
    expected_filename = '8_CS_NonFiction_005_0201485672_[a-zA-Z0-9]{8}_\\[refactor.pdf'

    expect(BookFile.new(hardcover_book).name).to match expected_filename
    expect(BookFileRefactored.new(hardcover_book).name).to match expected_filename
  end

  it 'creates the file name for softcover book' do
    softcover_book = build_book(available_in_hard_cover: false)
    expected_filename = '8_CS_NonFiction_0201485672_[a-zA-Z0-9]{8}_\\[refactor.pdf'

    expect(BookFile.new(softcover_book).name).to match expected_filename
    expect(BookFileRefactored.new(softcover_book).name).to match expected_filename
  end

  def build_book(available_in_hard_cover: true)
    Book.new('0201485672', '[Refactoring]: Improving the Design of Existing Code',
             Date.new(1999, 7, 8), 5, 'CS', 'Non_Fiction', 'PDF', available_in_hard_cover)
  end

end
