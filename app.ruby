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
	puts "The sum of #{list.name} is #{sum}"

	puts "\n"	

end

