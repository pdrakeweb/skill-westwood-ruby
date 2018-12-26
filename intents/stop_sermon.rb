intent "StopSermon" do
  audio_player.stop
  tell("<speak>Thank you for listening.  To hear more, visit us on the web at #{Westwood.website_address_for_speech}", ssml: true)
end
