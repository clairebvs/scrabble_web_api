class SearchPresenter

  def initialize(word)
    @word = word
  end

  def words
    @conn = Faraday.new(url: "https://od-api.oxforddictionaries.com") do |faraday|
      faraday.headers["app_id"] = ENV['APP_ID']
      faraday.headers["app_key"] = ENV['APP_KEY']
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/api/v1/inflections/en/#{@word}")

    @parsing = JSON.parse(response.body, symbolize_names: true)[:results].map do |word_data|
      Word.new(word_data)
    end
  end

  def root_word
    @parsing[0].root
  end

  def message
    if words.include?('404')
      "'#{@word}' is not a valid word."
    else
      root = root_word
      "'#{@word}' is a valid word and its root form is #{root}."
    end
  end
end
