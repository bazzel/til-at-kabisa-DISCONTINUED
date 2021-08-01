# frozen_string_literal: true

module TwitterHelper
  def tweet_button(post)
    text = "Today I Learned '#{post.title}'"
    url = post_url(post)

    link_to "Tweet",
            "https://twitter.com/intent/tweet",
            class: "twitter-share-button invisible",
            data: {
              text: text,
              url: url,
              hashtags: "til",
              via: "kabisa",
              controller: "tweet-button"
            }
  end
end
