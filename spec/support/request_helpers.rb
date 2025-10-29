# Include methods to make HTTP request specs easieer to work with
module RequestHelpers
  def response_json
    JSON.parse(response.body)
  end
end

