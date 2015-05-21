require 'digest'

class BookFile
  attr_reader :book

  def initialize(book)
    @book = book
  end

  def name
    filename = book.published_on.day.to_s
    filename << "_"
    filename << book.category
    filename << "_"
    filename << book.kind.gsub("_", "")
    filename << "_"

    if book.available_in_hard_cover?
      filename << "%03d" % book.hc_code
      filename << "_"
    end

    filename << book.isbn
    filename << "_"
    
    filename << Digest::SHA1.hexdigest(rand(10000).to_s)[0,8]
    filename << "_"

    # String turncatedTitle = book.title.downcase
    turncatedTitle = book.title.downcase.gsub("/[^\\[a-z\\]]/i", "")
    length = turncatedTitle.length
    truncateTo = length > 9 ? 9 : length;
    filename << turncatedTitle[0, truncateTo]

    # TODO: Add ibooks and plain text formatting.
    if book.file_type == "PDF"
      filename << ".pdf"
    elsif book.file_type == "MOBI"
      filename << ".mobi"
    else
      filename << ".epub"
    end

    return filename
  end

end
