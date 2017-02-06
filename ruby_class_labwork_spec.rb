require('minitest/autorun')
require('minitest/rg')
require_relative('ruby_class_labwork')

class TestClassesLabwork < MiniTest::Test

    def test_get_name
      student = Student.new("Kim", 10)
      assert_equal("Kim", student.get_name)
    end

    def test_get_cohort
      student = Student.new("Sarah", 9)
      assert_equal(9, student.get_cohort)
    end

    def test_set_name
      student = Student.new("Steve", 8)
      student.set_name("Alan")
      assert_equal("Alan", student.get_name)
    end

    def test_set_cohort
      student = Student.new("Chris", 7)
      student.set_cohort(8)
      assert_equal(8, student.get_cohort)
    end

    def test_student_talks
      student = Student.new("Kim", 10)
      assert_equal("I can talk!", student.student_talks)
    end

    def test_say_favourite_language
      student = Student.new("Kim", 10)
      assert_equal("I love Ruby!", student.say_favourite_language("Ruby"))
    end

    def test_get_team_name
      team = SportsTeam.new("The Mighty Ducks",["Dunkin Donuts", "Sneaky Pete", "Big Buck"], "John Candy", 0)
      assert_equal("The Mighty Ducks", team.team_name)
    end

    def test_get_players
      team = SportsTeam.new("The Mighty Ducks",["Dunkin Donuts", "Sneaky Pete", "Big Buck"], "John Candy", 0)
      players = ["Dunkin Donuts", "Sneaky Pete", "Big Buck"]
      assert_equal(players, team.players)
    end    

    def test_get_coach
      team = SportsTeam.new("The Mighty Ducks",["Dunkin Donuts", "Sneaky Pete", "Big Buck"], "John Candy", 0)
      assert_equal("John Candy", team.coach)
    end

    def test_set_coach_name
      team = SportsTeam.new("The Mighty Ducks",["Dunkin Donuts", "Sneaky Pete", "Big Buck"], "John Candy", 0)
      team.coach = "Bill Murray"
      assert_equal("Bill Murray", team.coach)
    end

    def test_add_player
      team = SportsTeam.new("The Mighty Ducks",["Dunkin Donuts", "Sneaky Pete", "Big Buck"], "John Candy", 0)
      team.add_player("Peter Mandelson")
      players = ["Dunkin Donuts", "Sneaky Pete", "Big Buck", "Peter Mandelson"]
      assert_equal(players, team.players)
    end

    def test_find_player__true
      team = SportsTeam.new("The Mighty Ducks",["Dunkin Donuts", "Sneaky Pete", "Big Buck"], "John Candy", 0)
      assert_equal(true, team.find_player("Sneaky Pete"))      
    end

    def test_find_player__false
      team = SportsTeam.new("The Mighty Ducks",["Dunkin Donuts", "Sneaky Pete", "Big Buck"], "John Candy", 0)
      assert_equal(false, team.find_player("Desperate Dan"))
    end

    def test_return_points
      team = SportsTeam.new("The Mighty Ducks",["Dunkin Donuts", "Sneaky Pete", "Big Buck"], "John Candy", 0)
      assert_equal(0, team.points)
    end

    def test_win_or_lose__win
      team = SportsTeam.new("The Mighty Ducks",["Dunkin Donuts", "Sneaky Pete", "Big Buck"], "John Candy", 0)
      team.assess_result("win")
      assert_equal(10, team.points)
    end

    def test_win_or_lose__lose
      team = SportsTeam.new("The Mighty Ducks",["Dunkin Donuts", "Sneaky Pete", "Big Buck"], "John Candy", 0)
      team.assess_result("lose")
      assert_equal(0, team.points)
    end

    def test_list_all_books
      new_library = Library.new()
      all_books = [
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
      assert_equal(all_books, new_library.list_all_books)
    end

    def test_return_book_info__pass
      new_library = Library.new()
      searched_book = {
        title: "Lord of the Rings",
          rental_details: {
            student_name: "Jeff",
            date: "02/12/15"
        }
      }
      assert_equal(searched_book, new_library.return_book_info("Lord of the Rings"))
    end

    def test_return_book_info__pass
      new_library = Library.new()
      searched_book = {
        title: "Jane Eyre",
        rental_details: {
          student_name: "Dan",
          date: "22/07/16"
      }
      }
      assert_equal(searched_book, new_library.return_book_info("Jane Eyre"))
    end

    def test_return_rental_details__pass
      new_library = Library.new()
      jane_eyre_rental = {
          student_name: "Dan",
          date: "22/07/16"
      }
      assert_equal(jane_eyre_rental, new_library.return_rental_details("Jane Eyre"))
    end

    def test_return_rental_details__fail
      new_library = Library.new()
      assert_equal(nil, new_library.return_rental_details("Dan Brown"))
    end

    def test_add_book
      new_library = Library.new()
      new_library.add_book("Sense & Sensibility")
      updated_library = [
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
      },

      {
      title: "Sense & Sensibility",
      rental_details: {
        student_name: "",
        date: ""
      }
    }

    ]
      assert_equal(updated_library, new_library.list_all_books)
    end

    def test_change_rental_details
      new_library = Library.new()
      new_library.change_rental_details("Jane Eyre", "Iggy", "06/02/17")
      new_details = {
        title: "Jane Eyre",
        rental_details: {
          student_name: "Iggy",
          date: "06/02/17"
        }
      }
      assert_equal(new_details, new_library.return_book_info("Jane Eyre"))
    end

end