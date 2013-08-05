class Bob
  SHOUTING = lambda {|input| input == input.upcase}

  EMPTY = lambda {|input| input.strip.empty?}

  QUESTION = lambda {|input| input.end_with? '?'}


  def hey(phrase)
    phrase ||= ''

    case phrase
    when EMPTY    then 'Fine. Be that way!'
    when SHOUTING then 'Woah, chill out!'
    when QUESTION then 'Sure.'
    else
      'Whatever.'
    end
  end

end
