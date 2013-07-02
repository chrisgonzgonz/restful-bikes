class Parser

  def self.parse(endpoint_url)

    json_unparsed = Typhoeus.get(endpoint_url)
    json_string = json_unparsed.options[:response_body]
    data = MultiJson.load(json_string, :symbolize_keys => true)
    data[:stationBeanList].each do |station|
      Station.create(station)
    end

  end

end