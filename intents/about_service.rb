intent "AboutService" do
  tell '<speak>' \
       'We strive to show love to the body of Christ through serving each other.  ' \
       "We serve both through organic (self-initiated) ministry and through a variety of organized ministries listed on our website at #{Westwood.website_address_for_speech}.  " \
       'If you would like to serve in any of our organized ministries, or if you would like some ideas for organic ministry you can do, please contact us.  ' \
       '</speak>',
       ssml: true
end
