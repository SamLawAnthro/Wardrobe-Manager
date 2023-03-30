require 'dotenv/load'
require 'openai'

class ChatGPT
  def initialize
    openai_api_key = ENV['OPENAI_API_KEY']
    @client = OpenAI::Client.new(access_token: openai_api_key)
  end

  def generate_text(prompt)
    response = @client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: prompt }],
        temperature: 0.7
      }
    )
  
    response.dig("choices", 0, "message", "content")
  end
  
end

