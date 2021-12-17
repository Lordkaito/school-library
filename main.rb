require './student'
require './person'
require './teacher'
require './book'
require './rental'

class Options
  def initialize
    @person_arr = []
    @books_arr = []
    @rental_arr = []
  end

  def CreatePerson
    puts 'Do you want to create a student[1] or teacher[2]?'
    option = Integer(gets.chomp)
    case option
    when 1
      print 'Age: '
      user_age = Integer(gets.chomp)
      print 'Name: '
      user_name = gets.chomp
      print 'Parent permission[Y/N]: '
      user_parent_permission = gets.chomp.to_s.upcase
      case user_parent_permission
      when 'Y'
        user_parent_permission = true
      when 'N'
        user_parent_permission = false
      end
      student = Student.new(user_age, user_name, parent_permission: user_parent_permission)

      @person_arr.push({
        output: "[Student] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}",
        object: student
      })
      puts 'Student created!'
      puts "\n"
    when 2
      print 'Age: '
      user_age = Integer(gets.chomp)
      print 'Name: '
      user_name = gets.chomp
      print 'Specialization: '
      user_specialization = gets.chomp
      teacher = Teacher.new(user_age, user_specialization, user_name)
      @person_arr.push({
        output: "[Teacher] Name: #{teacher.name}, ID: #{teacher.id}, Age: #{teacher.age}",
        object: teacher
      })
      puts 'Teacher created!'
      puts "\n"
    else
      puts 'Invalid option!'
      puts "\n"
    end

    def CreateBook
      print 'Title: '
      book_title = gets.chomp
      print 'Author: '
      book_author = gets.chomp
      puts 'Book created!'

      book = Book.new(book_title, book_author)
      @books_arr.push({
        output: "[Book] Title: #{book.title}, Author: #{book.author}",
        object: book
      })
    end

    def BookList
      @books_arr.each do |book|
        puts book[:output]
      end
    end

    def PeopleList
      @person_arr.each do |person|
        puts person[:output]
      end
    end

    def CreateRental
      puts 'Select the number of the book you want to rent:'
      @books_arr.each_with_index do |book, index|
        puts "#{index + 1} - #{book[:output]}"
      end
      book_number = Integer(gets.chomp)
      book_selected = @books_arr[book_number - 1][:object]

      puts 'Select the number of the person to rent the book:'
      @person_arr.each_with_index do |person, index|
        puts "#{index + 1} - #{person[:output]}"
      end
      person_number = Integer(gets.chomp)
      person_selected = @person_arr[person_number - 1][:object]
    print 'Date of rental: '
    rental_date = gets.chomp
    @rental_arr.push(Rental.new(rental_date, book_selected, person_selected))

    puts 'Rental created!'
    end

    def RentalList
      print 'Choose the ID of the person you want to see the rentals: '
      person_id = Integer(gets.chomp)
      puts 'Rental: '
      @rental_arr.each do |rental|
        if rental.person.id == person_id
          puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
        else
          puts 'No rentals found!'
        end
      end
    end
  end
end

class ListOfOptions
  def self.page_for_options
    puts 'Welcome to the OOP Schoo Library App!'
    puts "\n"
    puts 'Please choose an option by entering a number:'
    option1 = '1 - List all books'
    option2 = '2 - List all people'
    option3 = '3 - Create a person'
    option4 = '4 - Create a book'
    option5 = '5 - Create a rental'
    option6 = '6 - List all rentals for a given person id'
    option7 = '7 - Exit'
    questions_arr = [option1, option2, option3, option4, option5, option6, option7]
    questions_arr.each do |question|
      puts question
    end
    Integer(gets.chomp)
  end

  option = Options.new

  loop do
    case page_for_options
    when 1
      option.BookList
    when 2
      option.PeopleList
    when 3
      option.CreatePerson
    when 4
      option.CreateBook
    when 5
      option.CreateRental
    when 6
      option.RentalList
    when 7
      puts 'Goodbye!'
      exit
    end
  end
end

def main
  showOptions()
end

main()