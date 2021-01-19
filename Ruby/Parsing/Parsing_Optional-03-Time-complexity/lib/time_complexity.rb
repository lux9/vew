def find_book(books, book_to_find)
  # TODO: return index of book_to_find in the array of books
  # Use each_with_index
  books.each_with_index do |book, index|
    return index if book == book_to_find
  end
  return nil
end

# Solution with indexes
def find_book_enhanced(books, book_to_find)
  # TODO: return index of book_to_find in the array of books
  # Use binary search routine
  from = 0
  to = books.length - 1
  while from <= to
    pivot = (from + to) / 2
    if book_to_find > books[pivot]
      from = pivot + 1
    elsif book_to_find < books[pivot]
      to = pivot - 1
    else
      return pivot
    end
  end
  return nil
end

# # Solution with bsearch_index
# def find_book_enhanced(books, book_to_find)
#   # TODO: return index of `book_to_find` in the array of `books`
#   books.bsearch_index do |book|
#     book_to_find <=> book
#   end
# end

# # Solution with recursion
# def find_book_enhanced(books, book_to_find)
#   # TODO: return index of `book_to_find` in the array of `books`
#   # Use binary search
#   return nil if books.size == 1 && books[0] != book_to_find

#   index = books.size / 2
#   if books[index] == book_to_find
#     return index
#   elsif books[index] > book_to_find
#     find_book_enhanced(books[0..(index - 1)], book_to_find)
#   else
#     find_book_enhanced(books[(index + 1)..-1], book_to_find)
#   end
# end
