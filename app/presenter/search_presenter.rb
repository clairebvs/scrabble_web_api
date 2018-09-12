class SearchPresenter

  def initialize(word)
  end

  def words
    conn = Faraday.new(url: "https://od-api.oxforddictionaries.com") do |faraday|
      faraday.headers["app_id"] = ENV['APP_ID']
      faraday.headers["app_key"] = ENV['APP_KEY']
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/api/v1/inflections/en/foxes")

    JSON.parse(response.body, symbolize_names: true)[:results].map do |word_data|
      Word.new(word_data)
    end
  end
end
