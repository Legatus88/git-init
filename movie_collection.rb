require 'csv'
require './movie'
require 'time'
require 'date'
require './ancient_movie'
require './classic_movie'
require './modern_movie'
require './new_movie'


class MovieCollection
  attr_accessor :file, :csv_list, :genre_list, :full_list, :ancient, :classic, :modern, :new

  def initialize(file_name)
    @file = file_name
    @csv_list = CSV.read(file, :col_sep => "|", :headers => %i[link title year country starting_date genre time rate producer actors])
    @genre_list = csv_list.flat_map{|row| row[:genre].split(',')}.uniq
    @full_list = csv_list.map{|line| Movie.create(line, self)}.delete_if {|cell| cell == nil}
  end  

# Выдать список фильмов: all возвращает массив всех фильмов, которые в нём хранятся
  def all 
    @full_list
  end

# Выдать сортированный список фильмов, например movies.sort_by(:date) — возвращает массив фильмов, отсортированных по дате выхода (и так для любого поля);
  def sort_by(parameter)
  	all.sort_by(&parameter)
  end

# выдать фильтрованный список фильмов — по некоторым полям, вроде жанра и страны, например movies.filter(genre: 'Comedy') — возвращает массив фильмов с жанром «Comedy»;
  def filter(parameter)
    parameter.reduce(all){|result, (key, value)|
      result.select{|movie| movie.matches?(key, value)}}
  end

# выдать статистику по запросу: режиссёр, актёр, год, месяц, страна, жанр — например, movies.stats(:director) возвращает хеш «имя режиссёра → количество фильмов»
  def stats(parameter)
    cutted_arr = all.flat_map(&parameter).sort
    cutted_arr.each_with_object(Hash.new(0)) {|value, list| list[value] += 1 }
  end

  def better_chances(list)
    list.sort_by(&:rate).group_by{|x| x.rate}.values.map.with_index { |x, i| Array(x) * (i+1) }.flatten 
  end
end