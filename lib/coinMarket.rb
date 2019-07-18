require 'nokogiri'
require 'open-uri'
require 'pry'


url = "https://coinmarketcap.com/all/views/all/"

def get_cryptocurrency_rate(url)
	currency_rate = []
	change_rate = "td.no-wrap.percent-change"

	page = Nokogiri::HTML(open(url))
	i = 0
	page.css('a.currency-name-container').each do |node|
		currency_rate.push({ :name => node.text,:price => page.css('a.price')[i].text, :change_rate => page.css(change_rate)[i].text })
		puts "#{node.text} #{page.css('a.price')[i].text} #{page.css(change_rate)[i].text}"
		i += 1
	end

	return currency_rate
end

=begin
scheduler.every '1h' do
  # do this every 1 hours a save it to a file
  	crypto_details = get_cryptocurrency_rate(url)
	crypto_details.each do  |each_crypto|
		File.open("crypto.txt", "a+") do |each_crypto|
			file.write("#{each_crypto}")
		end
	end

end
=end
get_cryptocurrency_rate(url)
