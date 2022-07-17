class Message < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  Message.import(force:true)
  settings do
    mappings dynamic: false do
      indexes :body, type: :text, analyzer: :snowball
      indexes :chats_id, type: :integer
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

