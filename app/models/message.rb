class Message < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  

  settings do
    mappings dynamic: false do
      indexes :body, type: :text, analyzer: :snowball
    end
  end
  def self.search_in_chat(query,chat_id)
    self.search({
        query: {
        bool: {
            must: [
            {
            multi_match: {
                query: query,
                fields: [:body]
            }
            },
            {
            match: {
                chats_id: chat_id
            }
            }]
        }
        }
    })
  end
end

