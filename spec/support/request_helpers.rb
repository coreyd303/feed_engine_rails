module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body)['json']
    end
  end
end
