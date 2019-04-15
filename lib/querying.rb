def select_books_titles_and_years_in_first_series_order_by_year
  "select books.title, books.year from books
    inner join series on books.series_id = series.id
    where series.id = 1
    order by year"
end

def select_name_and_motto_of_char_with_longest_motto
  "select characters.name, characters.motto from characters
    order by length(motto) desc
    limit 1"
end

def select_value_and_count_of_most_prolific_species
  "select species, count(species) from characters
    group by species
    order by count(species) desc
    limit 1"
end

def select_name_and_series_subgenres_of_authors
  "select authors.name, subgenres.name from authors
    inner join series on authors.id = series.author_id
    inner join subgenres on subgenres.id = series.subgenre_id"
end

def select_series_title_with_most_human_characters
  "select series.title from series
    inner join books on books.series_id = series.id
    inner join character_books on character_books.book_id = books.id
    inner join characters on character_books.character_id = characters.id
    where characters.species = 'human'
    group by series.title
    order by count(*) desc
    limit 1"
end

def select_character_names_and_number_of_books_they_are_in
  "select characters.name, count(character_books.book_id) from characters
    inner join character_books on characters.id = character_books.character_id
    group by characters.name
    order by count(character_books.book_id) desc"
end
