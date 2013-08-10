class Beer
  def verse(num)
    join_lines(BeerVerse.new(num).lines)
  end

  def sing(first, last = 0)
    lines = (last..first).to_a.reverse.map do |num|
      BeerVerse.new(num).lines + blank_line
    end
    join_lines(lines)
  end

  private

  def join_lines(lines)
    lines.join("\n") + "\n"
  end

  def blank_line
    ['']
  end
end

class BeerVerse
  def initialize(num)
    @bottles_of_beer = BottlesOfBeer.new(num)
  end

  def lines
    [
      "#{@bottles_of_beer.capitalize} on the wall, " +
        "#{@bottles_of_beer}.",

      if @bottles_of_beer.no_more?
        "Go to the store and buy some more, " +
          "99 bottles of beer on the wall."
      else
        "Take #{@bottles_of_beer.one} down and pass it around, " +
          "#{@bottles_of_beer - 1} on the wall."
      end,
    ]
  end
end

class BottlesOfBeer
  def initialize(num)
    @num = num
  end

  def to_s
    case @num
    when 0 then 'no more bottles of beer'
    when 1 then '1 bottle of beer'
    else "#{@num} bottles of beer"
    end
  end

  def one
    @num == 1 ? 'it' : 'one'
  end

  def no_more?
    @num == 0
  end

  def -(delta)
    BottlesOfBeer.new(@num - delta)
  end

  def method_missing(method, *args, &block)
    to_s.send(method, *args, &block)
  end
end
