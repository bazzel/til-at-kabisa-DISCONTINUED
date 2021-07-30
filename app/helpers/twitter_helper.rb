# frozen_string_literal: true

module TwitterHelper
  def tweet_button(post)
    text = "Today I Learned '#{post.title}'"
    url = post_url(post)
    hashtags = %w(til kabisa)

    link_to "Tweet",
            "https://twitter.com/intent/tweet",
            class: "twitter-share-button invisible",
            data: { text: text, url: url, hashtags: hashtags.join(",") }
  end
end
