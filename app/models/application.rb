class Application < ApplicationRecord
    has_secure_token :token
end
