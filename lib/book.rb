class Book
  attr_reader :isbn, :title, :published_on, :hc_code, :category,
              :kind, :file_type, :available_in_hard_cover

  alias_method :available_in_hard_cover?, :available_in_hard_cover

  def initialize(isbn, title, published_on, hc_code, category,
                 kind, file_type, available_in_hard_cover = true)

    @isbn = isbn
    @title = title
    @published_on = published_on
    @hc_code = hc_code
    @category= category
    @kind = kind
    @available_in_hard_cover = available_in_hard_cover
    @file_type = file_type
  end
end
