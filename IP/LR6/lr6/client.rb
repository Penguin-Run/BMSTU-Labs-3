# frozen_string_literal: true

require "./calc_sin.rb"
require "./calc_sin_enum.rb"
require "./differ.rb"

puts "Enter function you want to execute: calc_sin, calc_sin_enum or differ?"
arg = gets.chomp

case arg
when "calc_sin"
  puts "choose precision: 10^-3 or 10^-4"
  case gets.chomp
  when "-3"
    Calc.new.calc_sin(Calc::EPS_3)
  when "-4"
    Calc.new.calc_sin(Calc::EPS_4)
  else
    p "invalid input"
  end

when "calc_sin_enum"
  puts "choose precision: 10^-3 or 10^-4"
  case gets.chomp
  when "-3"
    CalcEnum.new.print(CalcEnum::EPS_3)
  when "-4"
    CalcEnum.new.print(CalcEnum::EPS_4)
  else
    p "invalid input"
  end

when "differ"
  puts "block or lambda"
  case gets.chomp
  when "block"
    puts "sin or tg"
    case gets.chomp
    when "sin"
      Differ.new.differ_with_block do |x|
        Math.sin(x)
      end
    when "tg"
      Differ.new.differ_with_block do |x|
        Math.tan(x)
      end
    else
      p "invalid input"
    end
  when "lambda"
    puts "sin or tg"
    case gets.chomp
    when "sin"
      Differ.new.differ_with_lambda(->(x) { Math.sin(x) })
    when "tg"
      Differ.new.differ_with_lambda(->(x) { Math.tan(x) })
    else
      p "invalid input"
    end

  else
    p "invalid input"
  end
else
  p "invalid input"
end
