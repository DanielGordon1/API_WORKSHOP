require "rubeetup"
# MeetupClient.configure do |config|
#   config.api_key = "424761a5d797077520521a736e244b"
# end

# params = {
#   url_name: 'Le-Wagon-Bali-Coding-Bootcamp',
#   id: '250869454',
#   format: 'json',
# }

# p MeetupClient.methods
# meetup_api = MeetupApi.new

# p meetup_api
# p meetup_api.events(params)


auth = { key: '424761a5d797077520521a736e244b' }

Rubeetup.default_auth(auth)
requester = Rubeetup.setup

# Each request will take a Hash of options.
# Check in rubeetup/requests_lib/meetup_catalog.rb, or in the
# MeetupCatalog documentation, or at: http://www.meetup.com/meetup_api
# for a list of required and available parameters for your specific request.
#
# Rubeetup will raise an Error if any request is attempted without
# providing all the required parameters.
#
events = requester.get_events(group_urlname: 'Le-Wagon-Bali-Coding-Bootcamp', event_id: '250869454')
# event = requester.get_event(event_id: '250869454')
# p event
# Every request returns an array of results, and you can safely iterate over them.
# Furthermore, each result stored in the array is a symbol-keyed Hash.
#
#
events.each do |event|
  # p event.name
  # p event.venue.city
end

rsvps = requester.get_rsvps(event_id: '250869454')
puts "Getting all the people who are attending"
rsvps.each do |guest|
  p guest.member.name
  profile = requester.get_member(id: guest.member.member_id)

  puts "Is interested in the following things:"
  profile[0].topics.first(5).each do |topic|
    p "- #{topic[:name]}"
  end
  puts "---------------------"
end
