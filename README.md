# Description

An online book store saves the file names of the books it has in its inventory with a special naming scheme.  For example, a book with the following attributes:

- Title: [Refactoring]: Improving the Design of Existing Code
- Published Date: 7/8/1999
- Category: CS
- Kind: Non_Fiction
- Available in Hardcover: true
- Hardcover code: 5
- ISBN: 0201485672
- File Type: PDF

Would be stored on disk as:

8_CS_NonFiction_005_0201485672_OfJFOWcn_[refactor.pdf

Where:
 - 8 is the day the book was published for the given published on date
 - CS is the category
 - Underscores ('_') are removed from the book kind (i.e. Non_Fiction -> NonFiction)
 - A 3-digit, 0-padded hardcover code is added only if the book is available in hard cover
 - The ISBN number is added
 - 8 random alphanumeric noise characters are added
 - The title becomes lowercase and only the first 9 alpha characters and square brackets ('[' and ']') are kept
 - The entire title is joined together by underscores ('_')
 - The file extension is appended to the end of the file name

_Note: The combination of the Published Date, Category, and Kind is known as the file's "prefix"_

The code has been running in production for years and is functionally sound, but it's a mess.  It is hard to read, reason about, and maintain.  The task here is to clean up the code while ensuring that it still functions properly.

# Installation / Running

Clone this repository to your local machine.

```sh
> cd book_file_refactoring_example
> ./bin/setup
> bundle exec rake
```