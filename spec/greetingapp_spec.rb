require 'minitest/autorun'
require 'minitest/spec'
require 'greeting_you'

describe Greeting::App do
   before do
      @app = Greeting::App.new
   end

   {
      "10:00" => "good morning",
      "14:00" => "good afternoon",
      "20:00" => "good night",
      "04:00" => "good morning",
      "12:00" => "good morning",
      "12:01" => "good afternoon",
      "19:59" => "good afternoon",
      "20:00" => "good night",
      "00:00" => "good night",
      "03:59" => "good night"
   }.each do |input, output|
      it "respond with '#{output}', when recieve '#{input}'" do
	 @app.greet( time: Time.parse(input) ).must_equal output
      end
   end

   [
      ["10:00", "es", "buenos días"],
      ["14:30", "es", "buenas tardes"],
      ["21:30", "es", "buenas noches"]
   ].each do |time, lang, respond|
      it "respond #{respond} when language is: #{lang}" do
	 @app.greet( time: Time.parse(time), language: lang ).must_equal respond
      end
   end
end
