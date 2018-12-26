intent "StreamSermon" do
  sermon_type = request.slot_id('sermon_type')
  sermon_calculator = Westwood.sermon_calculator
  sermon_streamer = Westwood.sermon_streamer

  case sermon_type
  when 'live'
    case true
    when sermon_calculator.live_sermon? && sermon_streamer.is_live?
      audio_player.play(
        sermon_streamer.stream_for(:live),
        'flourish-token',
        speech: 'Streaming'
      )
    when sermon_calculator.live_sermon_soon?
      audio_player.play(
        sermon_streamer.stream_for(:live),
        'flourish-token',
        speech: "The sermon will start streaming in #{sermon_calculator.next_live_sermon}.",
        offset_in_milliseconds: (sermon_calculator.seconds_until_sermon + 30) * 1000
      )
    else
      ask("Ok! The sermon starts in #{sermon_calculator.next_live_sermon}.  Please ask again closer to the time.")
    end
  when 'test'
    if sermon_streamer.is_live?(:test)
      audio_player.play(
        sermon_streamer.stream_for(:test),
        'flourish-token',
        speech: 'The test sermon will start in just a few seconds.',
        offset_in_milliseconds: 3000
      )
    else
      ask("Unfortunately, the test sermon is not working right now.")
    end
  when 'recorded'
    ask('Pre-recorded sermons are coming soon.  Check back in a few days.')
  else
    ask("Lets try that again, shall we (I didn't understand #{sermon_type} sermon)?  What would you like to do?")
  end
end
