intent "MoreAboutWestwood" do
  tell '<speak>' \
       "Westwood's core values are: Worship, Proclamation, The Body, The World and Dependence.  " \
       "Westwood can be contacted by phone at 419-747-5242 or reached on the web at #{Westwood.website_address_for_speech}.  " \
       'Ask to learn more about worship services, fellowship, service or the leadership at Westwood.  ' \
       '</speak>',
       ssml: true
end
