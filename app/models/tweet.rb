class Tweet < ApplicationRecord
    belongs_to :user

    validates :message, presence: true
    validates :message, length: {maximum: 140, too_long: "A tweet is only 140 max."}

    has_many :tweet_tags
    has_many :tags, through: :tweet_tags

    ##Tweet.find(1) == @tweet
    ## @tweet.tags -> [Tag1, Tag2, Tag3, Tag4]
    #this is same as writing line 8
    # def tags
    #     tts = TweetTag.where(tweet_id: @tweet.:id)
    #     tags = []
    #     tts.each do |tweetTag|
    #         tags.push(Tag.find_by(id: tweetTag.tag_id))
    #     end
    #     return tags
    # end
end
