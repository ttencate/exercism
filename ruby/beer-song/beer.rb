class Beer
  def verse(num)
    verse_lines(num).join("\n") + "\n"
  end

  def sing(first, last = 0)
    lines = []
    first.downto(last) do |num|
      lines << verse_lines(num)
      lines << ''
    end
    lines.join("\n") + "\n"
  end

  private

  def verse_lines(num)
    lines = []
    lines << "#{bottles(num).capitalize} of beer on the wall, #{bottles(num)} of beer."
    if num > 0
      lines << "Take #{refer_to_bottle(num)} down and pass it around, #{bottles(num - 1)} of beer on the wall."
    else
      lines << "Go to the store and buy some more, 99 bottles of beer on the wall."
    end
    lines
  end

  def bottles(num)
    case num
    when 0 then 'no more bottles'
    when 1 then '1 bottle'
    else "#{num} bottles"
    end
  end

  def refer_to_bottle(num)
    num == 1 ? 'it' : 'one'
  end
end
