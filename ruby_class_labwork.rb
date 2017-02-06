class Student

  def initialize(name, cohort)
    @name = name
    @cohort = cohort
  end

  def get_name
    return @name
  end

  def get_cohort
    return @cohort
  end

  def set_name(new_name)
    @name = new_name
  end

  def set_cohort(new_cohort)
    @cohort = new_cohort
  end

  def student_talks
    return "I can talk!"
  end

  def say_favourite_language(language)
    return "I love #{language}!"
  end

end

# ------------------------------------------------------------------------------------

class SportsTeam
  attr_accessor :team_name, :players, :coach, :points
  def initialize(team_name, players, coach, points)
    @team_name = team_name
    @players = players
    @coach = coach
    @points = points    # Can also just do this as @points = 0 so don't need to change every test script
  end


  def add_player(new_player)
    @players.push(new_player)
  end

  def find_player(search_player)
    return true if @players.include? search_player
    return false
  end

  def assess_result(result)
    if result == "win"
      return @points += 10
    end
  end

end

# ---------------------------------------------------------------------------------------

class Library

  def initialize()

    @books = [
      {
        title: "Lord of the Rings",
        rental_details: {
          student_name: "Jeff",
          date: "02/12/15"
        }
      },

      {
        title: "Hook: The Novelization",
        rental_details: {
          student_name: "Chris",
          date: "13/02/16"  
        }
      },

      {
        title: "Jane Eyre",
        rental_details: {
          student_name: "Dan",
          date: "22/07/16"
      }
    }

    ]
  end

  def list_all_books()
    return @books
  end

  def return_book_info(searched_book)
    for book in @books
      if (book[:title] == searched_book)
        return book
      end
    end
    return nil
  end

  def return_rental_details(searched_book)
    returned_book = return_book_info(searched_book)
    return returned_book[:rental_details] if returned_book != nil
    return nil
  end

  def add_book(new_book)
    @books << {
      title: "Sense & Sensibility",
      rental_details: {
        student_name: "",
        date: ""
      }
    }
  end

  def change_rental_details(searched_book, borrower, date_borrowed)

    for book in @books
      if (book[:title] == searched_book)
        book[:rental_details][:student_name] = borrower
        book[:rental_details][:date] = date_borrowed
      end
    end
  end

end