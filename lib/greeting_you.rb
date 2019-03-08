require 'time'
module Greeting
   class App
      def greet time: current_time = Time.now, language: lang = "en"
	 return say_good_morning(language) if time.between?(Time.parse('04:00'),Time.parse("12:00"))

	 return say_good_afternoon(language) if time.between?(Time.parse('12:01'), Time.parse('19:59'))	

	 return say_good_night(language) if time.between?(Time.parse('20:00'), Time.parse('23:59')) || time.between?(Time.parse('00:00'),Time.parse('03:59'))
      end

      private
      def say_good_morning( lang )
	 case lang
	 when "es"
	    "buenos días"
	 else
	    "good morning"
	 end

      end

      def say_good_afternoon lang
	 case lang
	 when "es"
	    "buenas tardes"
	 else
	    "good afternoon"
	 end
      end

      def say_good_night lang
	 case lang
	 when "es"
	    "buenas noches"
	 else
	    "good night"
	 end
      end
   end
end

