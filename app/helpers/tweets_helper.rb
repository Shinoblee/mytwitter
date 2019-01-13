module TweetsHelper
    def get_tagged(tweet)
        
    message_array = @tweet.message.split()

    message_array.each_with_index do |word, index|
      if word[0] == "#"
        #create a new Tag
        if Tag.pluck(:phrase).include?(word)
          tag = Tag.find_by(phrase: word)
        else
          tag = Tag.create({phrase: word})
        end
        tweet_tag = TweetTag.create(tweet_id: tweet.id, tag_id: tag.id)
        message_array[index] = "<a href='/tag_tweets?id=#{tag.id}'>#{word}</a>"
        # TweetTag.create(tag_id: tag.id , tweet_id: @tweet.id)
      end
      #potentially can replace if statement above
      # tag = Tag.find_or_createby(phrase: word)
    end

    tweet.update(message: message_array.join(" "))
    return tweet

    end
end
