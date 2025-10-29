# Include methods to make HTTP request specs easieer to work with
module RequestHelper
  def response_json
    JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include RequestHelper, type: :request
end
