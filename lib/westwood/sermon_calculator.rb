module Westwood
  class SermonCalculator
    def live_sermon?
      Date.today.sunday? && 
        Time.now >= sermon_start_time(Date.today) && 
        Time.now <= sermin_end_time(Date.today)
    end

    def next_live_sermon
      ChronicDuration.output(
        next_sunday_sermon_time.to_i - Time.now.to_i,
        :format => :long,
        :units => 2
      )
    end
    
    def next_sunday_sermon_time
      date = sermon_start_time(next_sunday)
    end
  
    def sermon_start_time(date)
      date.to_time + hours(10) + minutes(40)
    end

    def sermon_end_time(date)
      date.to_time + hours(12)
    end

    def next_sunday
      date = Date.parse('Sunday') 
      date = date + (date > Date.today ? 0 : 7)
    end
  
    def hours(i)
      minutes(i) * 60
    end
    
    def minutes(i)
      i * 60
    end
  end
end