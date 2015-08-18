require 'trello'
require 'terminal-table'
require 'yaml'

# load configuration file
app_config = YAML.load_file(File.join(__dir__, '_config.yml'))

# connect to Trello
Trello.configure do |config|
	config.developer_public_key = app_config['developer_public_key']
	config.member_token = app_config['member_token']
end


# helper for add delimiter
# ref http://stackoverflow.com/questions/1078347/is-there-a-rails-trick-to-adding-commas-to-large-numbers
def add_delimiter(number)
	number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
end



lists = app_config["lists"]

lists.each do |list_id|

	# find the list
	list = Trello::List.find list_id

	sum = 0
	rows = []
	list.cards.each do |card|

			# remove number fome card name
			card_name = card.name.sub(/\d+/, '')

			# extract number from string
			number = card.name.scan(/\d+/).first 
			sum += number.to_f

			# construct a table row
			rows << [number, card_name]
			
	end

	# table printing
	table = Terminal::Table.new rows: rows
	puts table

	# summary printing
	clean_sum = add_delimiter sum
	puts "The sum of #{list.name} is #{clean_sum}"

	puts "\n"	

end




