intent "StreamSermon" do
  sermon_type = request.slot_id('sermon_type')
  sermon_calculator = Westwood.sermon_calculator
  sermon_streamer = Westwood.sermon_streamer

  case sermon_type
  when 'live'
    if sermon_calculator.live_sermon? && sermon_streamer.is_live?
      audio_player.play(
      sermon_streamer::STREAM_URL_TEST,
        'flourish-token',
        speech: 'Streaming'
      )
    else
      ask("Great! The sermon starts in #{sermon_calculator.next_live_sermon}.  Please ask again at that time.")
    end
  when 'test'
    if sermon_streamer.is_live?(:test)
      audio_player.play(
        sermon_streamer.stream_for(:test),
        'flourish-token',
        speech: 'Streaming test'
      )
    else
      ask("Unfortunately, the test sermon is not working right now.")
    end
  when 'recorded'
    ask('Which sermon date would you like to listen to?')
  else
    ask("Lets try that again, shall we (I didn't understand #{sermon_type} sermon)?  What would you like to do?")
  end
end
