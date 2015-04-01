def response_json(response)
		JSON.parse(response.body)
end

def response_compare_keys(response, *expected_keys)
  response_json(response).keys.sort.should eq expected_keys.map(&:to_s).sort
end