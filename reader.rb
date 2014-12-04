require 'rss'
require 'open-uri'

feed_url = "http://rss.lemonde.fr/c/205/f/3050/index.rss"
output = ""

open(feed_url) do |http|
  response = http.read
  result = RSS::Parser.parse(response, false)
  output += "Titre du flux : #{result.channel.title}<br />"
  result.items.each_with_index do |item, i|
    output += "#{i+1}. #{item.title}<br />" if i < 10
  end
end

puts output