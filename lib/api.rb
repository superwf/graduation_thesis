module Project
  class API < Grape::API
    version 'v1', using: :path, vendor: 'me'
    format :json
    prefix 'api'
  end
end
