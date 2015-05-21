require 'digest'

class BookFileRefactored
  attr_reader :book

  FILE_TYPES = {
    'PDF'  => '.pdf',
    'MOBI' => '.mobi',
    'EPUB' => '.epub'
  }

  SEPARATOR = '_'

  def initialize(book)
    @book = book
  end

  def name
    join(prefix, hardcover_code, isbn, noise, truncated_title) + file_extension
  end

  private

  def prefix
    join(book.published_on.day.to_s, book.category, book.kind.gsub('_', ''))
  end

  def hardcover_code
    book.available_in_hard_cover? ? sprintf('%03d', book.hc_code) : ''
  end

  def isbn
    book.isbn
  end

  def noise
    Digest::SHA1.hexdigest(rand(10_000).to_s)[0, 8]
  end

  def truncated_title
    book.title.downcase.gsub('/[^\\[a-z\\]]/i', '')[0, 9]
  end

  def file_extension
    FILE_TYPES[book.file_type]
  end

  def join(*words)
    words.reject(&:empty?).join(SEPARATOR)
  end
end