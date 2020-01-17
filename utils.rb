module Utils
  def self.ask_yes_no_question(question)
    puts question
    gets.chomp.chr == 'y'
  end
end
