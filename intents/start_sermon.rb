intent "StartSermon" do
  ask("<speak>Got it. Would you like a pre-recorded sermon or <phoneme alphabet='ipa' ph='laɪv'>live</phoneme> sermon?</speak>", ssml: true)
end
