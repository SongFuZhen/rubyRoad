json.array!(@articles) do |article|
  json.extract! article, :id, :title, :subtitle, :content, :tag, :readcount, :original, :user_email, :remark
  json.url article_url(article, format: :json)
end
