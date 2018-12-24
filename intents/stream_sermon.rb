intent "StreamSermon" do
  sermon_type = request.slot_id('sermon_type')
  sermon_calculator = Westwood.sermon_calculator
  sermon_streamer = Westwood.sermon_streamer

  case sermon_type
  when 'live'
    if sermon_calculator.live_sermon? && sermon_streamer.is_live?
      
    else
      ask("Great! The sermon starts in #{sermon_calculator.next_live_sermon}.  Please ask again at that time.")
    end
    ask("Great! The sermon starts in #{sermon_calculator.next_live_sermon}.")
  when 'recorded'
    ask('Which sermon date would you like to listen to?')
  else
    ask("Lets try that again, shall we (I didn't understand #{sermon_type})?  What would you like to do?")
  end
end
