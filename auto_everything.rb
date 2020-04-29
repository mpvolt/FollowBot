 require 'watir'
 require 'twilio-ruby'
 require 'headless'
 require 'base64'
 require 'webdriver-user-agent'
#proxy = '104.247.215.105:21257'
 
comments = ['Awesome Pic!', 'Amazing Pic!', 'Great Pic!', 'Haha Wonderful!', 'Haha',
  'Haha awesome!', 'Love your profile', 'I love your profile', 
  'I really like your profile', 'Awesome!', 'your profile is nice', 
  'Nice!', 'Cool!', 'Awesome', 'Really cool!', 'Nice', 'Wow', 'Wow!', 
  'Love your profile', 'Really awesome!', 'Very cool!', 
  'Youre profile is much nicer', 'Great post!', 'Great',
  'Nice post!', 'I love this!', 
  'Nice picture!', 'I really love your profile', 
  'Great post!']   

emails = ['antiseptize@v-mail.xyz', 'antiseptize@rajasoal.online', 'nomis@young-app-lexacc.com', 
  'nomis@v-mail.xyz', 'smalann@v-mail.xyz', 'susuka@yarnpedia.ml', 
  'suzuka@iapermisul.ro', 'retrople@danirafsanjani.com', 'omgebo@v-mail.xyz', 
  'vulpecul@v-mail.xyz', 'Oxycepha@emeraldcluster.com', 'sansculottism@v-mail.xyz', 
  'Rattls@rifkian.ga', 'Shahe@resepku.site', 'suzuka@rex-app-lexc.com', 
  'rojekte@myccscollection.com', 'perceron@v-mail.xyz', 'Lonesomeness@suhuempek.ga', 
  'sangria@v-mail.xyz', 'subidero@v-mail.xyz', 'brillasse@v-mail.xyz', 
  'goucher@v-mail.xyz', 'jahrm@v-mail.xyz', 'currentwise@v-mail.xyz', 
  'unbolted@v-mail.xyz', 'pincodes@v-mail.xyz', 'matt@v-mail.xyz', 
  'irlandesca@v-mail.xyz', 'xylomas@v-mail.xyz','brillasse@v-mail.xyz',
  'goucher@v-mail.xyz', 'jahrm@v-mail.xyz', 'currentwise@v-mail.xyz',
  'unbolted@v-mail.xyz', 'oracletradingbot@gmail.com', 'mattypfanpage@gmail.com',
  'dylan@v-mail.xyz', 'davis@v-mail.xyz', 'dybbuks@v-mail.xyz',
  'subidero@v-mail.xyz'
]


proxies = ['']

instagramers = ['jayalvarrez', 'lilhuddy', 'lopez_tony', 'taylerholder', 
  'brycehall', 'nick__bateman', 'matthew_noszka', 
  'andrehamann', 'davidgandy_official', 'johanneshuebl', 'kortajarenajon',
  'seanopry55', 'marlontx', 'landocommando0', 
  'riverviiperi', 'broderickhunter', 'scotteastwood', 'luckybsmith', 'pietroboselli', 
  'chico_lachowski', 'jmeeksofficial', 'rafaelmiller', 'iblamejordan', 'themacrobarista', 
  'iamgalla', 'eugeneleeyang', 'nickwooster','dad_beets', 'avantgardevegan',
  'thepacman82', 'fitmencook', 'justinliv', 'briankelly', 
  'ryanstylesnyc', 'everchanginghorizon','jamesduigan', 
  'bradleysimmonds', 'thedomesticman', 'bretthoebel', 'davidchang', 'bennyor', 'calvinroyaliii', 
  'doyoutravel', 'artdrunk', 'lukehannon', 'marianodivaio', 'brightbazaar', 'fabioattanasio', 'mario8855']

hashtags = ['#fitness','#instadaily','#lol','#portrait','#hair','#landscape','#pink','#l4l','#sweet','#pretty','#Japan','#fashionblogger','#happiness','#f4f',
  '#picoftheday','#sunset','#girl','#photographer','#friends','#sexy','#entrepreneur','#vscocam','#fashionista','#Home','#foodporn','#followme','#food','#fun',
  '#boy','#night','#paris','#happy','#Beautiful','#Selfie','#nice','#instagood','#sun','#follow4follow','#photography','#bodybuilding','#instagram','#me','#foodie',
  '#handmade','#wanderlust','#TBT','#fall','#photo','#luxury','#color','#vsco','#fashion','#photoshoot''#swag','#funny','#TagsForLikes','#green','#business','#City',
  '#goodmorning','#model','#bestoftheday','#tattoo','#flowers','#healthy','#nyc','#travel','#style','#design','#live','#blogger','#adventure','#follow',
  '#ootd','#outfit','#beach','#red','#weekend','#smile','#like4like','#success','#mood','#Family','#look','#drawing','#italy','#wedding','#instamood',
  '#black','#cool','#igers','#awesome','#new','#love','#fitfam','#picture','#blackandwhite','#trip'
]
rand = rand(10)
puts rand

#Timer
start = Time.now

 # put your own credentials here
account_sid = 'AC02a1bb5dd1e442b9877ba9b51a9fb3a9'
auth_token = 'c50059b221797f0d8e8f43ea1b0ca588'
# set up a client to talk to the Twilio REST API
tclient = Twilio::REST::Client.new(account_sid, auth_token)
from = '+14156920287'
to = '+14437458242'

def follow(browser, account, user, skipfollow, skiplike, skipcomment, skipunfollow, rand, tclient)
  puts "performing follow"
  browser.goto "instagram.com" 
  exitAnnoyingPopups(browser)
  puts "line 75"
   #Go to instagramer's page
   browser.goto "instagram.com/#{user}/"
   sleep(2)
   #Open his followers list
   
  if browser.a(:href => "/#{user}/followers/").exists?
    browser.a(:href => "/#{user}/followers/").scroll.to :center
    browser.a(:href => "/#{user}/followers/").click
    sleep(3)
    #Press follow Button
    if browser.button(:class => ["sqdOP", "L3NKy", "y3zKF"]).exists?
      followButton = browser.button(:class => ["sqdOP", "L3NKy", "y3zKF"])
      followButton.scroll.to :center
      followButton.click
      account.followhourCounter+=1
      sleep(10)
      puts "line 92"
      #Action Blocked
      actionBlocked(browser, skipfollow, account, account.followhourCounter, account.followLimit)
      #verify Account
      verifyAccount(browser)
      #Phone Verification
      phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
      puts "line 99"
    end  
  else
    browser.refresh
  end
  #Action Blocked
  actionBlocked(browser, skipfollow, account, account.followhourCounter, account.followLimit)
  #verify Account
  verifyAccount(browser)
  #Phone Verification
  phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account) 
  puts "line 111"
end

def followHashTag(browser, account, user, skipfollow, skiplike, skipcomment, skipunfollow, rand, tclient, hashtags, username)
  puts "performing followHashTag"
  exitAnnoyingPopups(browser)
  random = rand(hashtags.length)
  randomhashTag = hashtags[random]
  puts "line 118"
  browser.goto "https://www.instagram.com/explore/tags/#{randomhashTag.split("#")[1]}"
  sleep(5)
  check = 0
  while browser.div(:class => ["v1Nh3", "kIKUG", "_bz0w"], :index => check).exists? 
    browser.div(:class => ["v1Nh3", "kIKUG", "_bz0w"], :index => check).click
    sleep(2)
    if browser.button(:text => "Follow", :index => 1).exists? && !(browser.a(:text => "#{username}").exists?) && !(browser.svg(:aria_label => 'Unlike').exists?)
      browser.button(:text => "Follow", :index => 1).click
      account.followhourCounter += 1
      sleep(10)
      puts "line 129"
       #Action Blocked
      actionBlocked(browser, skipfollow, account, account.followhourCounter, account.followLimit)
       #verify Account
      verifyAccount(browser)
       #Phone Verification
      phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
      break
    else
      browser.svg(:aria_label => 'Close').click
      check += 1
      sleep(1)
      puts "line 141"
    end
  end
  actionBlocked(browser, skipfollow, account, account.followhourCounter, account.followLimit)
   #verify Account
  verifyAccount(browser)
   #Phone Verification
  phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
  puts "line 149"
end

def like(browser, account, user, skipfollow, skiplike, skipcomment, skipunfollow, rand, tclient, username)
  puts "performing like"
  browser.goto "instagram.com"
  exitAnnoyingPopups(browser)
   
  puts "line 156"
  #Go to instagramer's page
  browser.goto "instagram.com/#{user}/"
  sleep(3)

  if !(browser.a(:href => "/#{user}/followers/").exists?)
    sleep(1)
    browser.refresh
  end

  if browser.a(:href => "/#{user}/followers/").exists?
    followers = browser.a(:href => "/#{user}/followers/")
  
    followers.scroll.to :center

    #Open followers page
    browser.a(:href => "/#{user}/followers/").click
    sleep(2)
    #Link to follower page
    check = 0
    while browser.a(:class => ["_2dbep", "qNELH", "kIKUG"], :index => check).exists?
      browser.a(:class =>["_2dbep", "qNELH", "kIKUG"],:index => check).click
      sleep(3)
      
      if browser.h2(:text => 'This Account is Private').exists? || !(browser.div(:class => ["v1Nh3", "kIKUG", "_bz0w"]).exists?) || browser.div(:text => 'No Posts Yet').exists?
        browser.back
        scrollable = browser.div(:class => 'isgrP') # div with overflow-y=scroll
        browser.execute_script('arguments[0].scrollTop = arguments[0].scrollHeight', scrollable)
        check+=1 
        puts "line 185"
      else
        #First picture on page
        if browser.div(:class => ["v1Nh3", "kIKUG", "_bz0w"]).exists?
          sleep(5)
          if(browser.div(:class => ["RnEpo", "Yx5HN"]).exists?)
            browser.back
            scrollable = browser.div(:class => 'isgrP') # div with overflow-y=scroll
            browser.execute_script('arguments[0].scrollTop = arguments[0].scrollHeight', scrollable)
            check+=1
            puts "line 195"
          else
            firstPic = browser.div(:class => ["v1Nh3", "kIKUG", "_bz0w"])
            firstPic.scroll.to :center 
            firstPic.click
          
            sleep(5)

          #Like Button
            if browser.svg(:aria_label => "Like").exists? && !(browser.a(:text => "#{username}").exists?) && !(browser.svg(:aria_label => 'Unlike').exists?)
              browser.svg(:aria_label => "Like").click
              account.likehourCounter += 1
              sleep(10)
              puts "line 208"
              #Action Blocked
              actionBlocked(browser, skipfollow, account, account.likehourCounter, account.likeLimit)
              verifyAccount(browser)
              #Phone Verification
              phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
              break
            else
              browser.back
              browser.back
              scrollable = browser.div(:class => 'isgrP') # div with overflow-y=scroll
              browser.execute_script('arguments[0].scrollTop = arguments[0].scrollHeight', scrollable)
              check+=1   
              puts "line 220"
            end
          end
        else
          browser.back
          scrollable = browser.div(:class => 'isgrP') # div with overflow-y=scroll
          browser.execute_script('arguments[0].scrollTop = arguments[0].scrollHeight', scrollable)
          check+=1
          puts "line 229"
        end 
      end
    end
  end
  #Action Blocked
  actionBlocked(browser, skipfollow, account, account.likehourCounter, account.likeLimit)
  verifyAccount(browser)
  #Phone Verification
  phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
end

def likeHashTag(browser, account, user, skipfollow, skiplike, skipcomment, skipunfollow, rand, tclient, hashtags, username)
  puts "performing likeHashTag"
  browser.goto "instagram.com"
  exitAnnoyingPopups(browser)
  random = rand(hashtags.length)
  randomhashTag = hashtags[random]
  randomhashTag.split("#")
  browser.goto "https://www.instagram.com/explore/tags/#{randomhashTag[1]}"
  puts "line 248"
  sleep(5)
  check = 0
  while browser.div(:class => ["v1Nh3", "kIKUG", "_bz0w"], :index => check).exists?
    browser.div(:class => ["v1Nh3", "kIKUG", "_bz0w"], :index => check).click
    sleep(2)
    if browser.svg(:aria_label => "Like").exists? && !(browser.a(:text => "#{username}").exists?) && !(browser.svg(:aria_label => 'Unlike').exists?)
      browser.svg(:aria_label => "Like").click
      account.likehourCounter += 1
      sleep(10)
      browser.svg(:aria_label => 'Close').click
      puts "line 259"
      #Action Blocked
      actionBlocked(browser, skipfollow, account, account.likehourCounter, account.likeLimit)
      verifyAccount(browser)
      #Phone Verification
      phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
      break
    else
      browser.svg(:aria_label => 'Close').click
      check += 1
      puts "line 269"
    end
  end
  actionBlocked(browser, skipfollow, account, account.followhourCounter, account.followLimit)
   #verify Account
  verifyAccount(browser)
   #Phone Verification
  phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
  puts "line 277"
end

def likeFeed(browser, account, user, skipfollow, skiplike, skipcomment, skipunfollow, rand, tclient, username)
  puts "performing likeFeed"
  browser.goto "instagram.com"
  exitAnnoyingPopups(browser)
  puts "line 283"
  i = 0
  while i < rand(10)
    int = rand(-40..40)
    browser.driver.execute_script("window.scrollBy(0, document.body.scrollHeight*#{int.to_i})")
    i += 1
    sleep(1)
  end

  if browser.svg(:aria_label => 'Like', :class => '_8-yf5').exists?
    browser.svg(:aria_label => 'Like', :class => '_8-yf5').scroll.to :center
    browser.svg(:aria_label => 'Like', :class => '_8-yf5').click
    account.likehourCounter += 1
    sleep(10)
    puts "line 296"
    #Action Blocked
    actionBlocked(browser, skipfollow, account, account.likehourCounter, account.likeLimit)
    verifyAccount(browser)
    #Phone Verification
    phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
  end
  puts "line 303"
end

def activityFeed(browser, tclient, account, skiplike, skipfollow, skipcomment, skipunfollow, count)
  puts "performing activityFeed"
  browser.goto "instagram.com"
  exitAnnoyingPopups(browser)

  activity = browser.svg(:aria_label => "Activity")
  puts "line 311"
  while !(activity.exists?)
    sleep(1)
  end
  
  if activity.exists?
    activity.click
    sleep(5)
    if account.followhourCounter < (account.followLimit*0.10).ceil
      if browser.button(:text => "Follow", :index => count).exists?
        follow = browser.button(:text => "Follow", :index => count)
        follow.scroll.to :center
        follow.click
        account.followhourCounter+=1
        count += 1
        puts "line 326"
        #Action Blocked
        actionBlocked(browser, account.skipfollow, account, account.followhourCounter, account.followLimit)
        verifyAccount(browser)
        #Phone Verification
        phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
      
      end
    end
  end
  actionBlocked(browser, account.skipfollow, account, account.followhourCounter, account.followLimit)
  verifyAccount(browser)
  #Phone Verification
  phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
 puts "line 340"
end

def comment(browser, account, user, skipfollow, skiplike, skipcomment, skipunfollow, rand, tclient, username, comments, accounts)
  puts "performing comment"
  browser.goto "instagram.com"
  exitAnnoyingPopups(browser)
  puts "line 347"
  browser.goto "instagram.com/#{user}/"
  sleep(3)
  
  if !(browser.a(:href => "/#{user}/followers/").exists?)
    sleep(1)
  end

  if browser.a(:href => "/#{user}/followers/").exists?
    following = browser.a(:href => "/#{user}/followers/")
    following.scroll.to :center
    #browser.driver.execute_script("window.scrollBy(0,200)")
    browser.a(:href => "/#{user}/followers/").click
    sleep(3)
    browser.driver.switch_to.default_content
    #Link to follower page
    check = 0
    while browser.a(:class => ["_2dbep", "qNELH", "kIKUG"], :index => check).exists? 
      browser.a(:class =>["_2dbep", "qNELH", "kIKUG"],:index => check).click
      sleep(1)
      
      if browser.h2(:text => 'This Account is Private').exists? 
        browser.back
        scrollable = browser.div(:class => 'isgrP') # div with overflow-y=scroll
        browser.execute_script('arguments[0].scrollTop = arguments[0].scrollHeight', scrollable)
        check+=1
        sleep(2)
        puts "line 374"
      else
        #First Pic  
        if browser.div(:class => ["v1Nh3", "kIKUG", "_bz0w"]).exists? && !(browser.div(:text => 'No Posts Yet').exists?)
          firstPic = browser.div(:class => ["v1Nh3", "kIKUG", "_bz0w"])
          firstPic.scroll.to :center
          #Pick A Random Comment
          random = rand(comments.length)
          randomComment = comments[random]
          puts "line 382"
          sleep(2)
          if(browser.div(:class => ["RnEpo", "Yx5HN"]).exists?)
            browser.back
            scrollable = browser.div(:class => 'isgrP') # div with overflow-y=scroll
            browser.execute_script('arguments[0].scrollTop = arguments[0].scrollHeight', scrollable)
            check+=1
          else   
          firstPic.click
          sleep(3)
          end
          #Comment Button
          if browser.svg(:aria_label => "Comment").exists? && !(browser.svg(:aria_label => 'Unlike').exists?)
            browser.svg(:aria_label => "Comment").click
          
            puts "line 398"
            sleep(5)
            #Check for a previous comment from any account
            accountusernamepresent = false
            accounts.each do |n|
              if(browser.a(:text => "#{n.username}").exists?)
                accountusernamepresent = true
              end 
            end

           #Write Comment
            if browser.textarea(:aria_label => "Add a comment…").exists? && !(accountusernamepresent) 
              browser.textarea(:aria_label => "Add a comment…").set "#{randomComment}"
            
              #Press Submit Button
              if browser.button(:text => 'Post').exists? && browser.button(:text => 'Post').enabled?
                browser.button(:text => 'Post').click
                account.commenthourCounter += 1
                sleep(2)
                #Action Blocked
                actionBlocked(browser, skipfollow, account, account.commenthourCounter, account.commentLimit)
                verifyAccount(browser)
                #Phone Verification
                phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
                puts "line 422"
                sleep(10)
                break
              end
            else
              browser.back
              browser.back
              browser.back
              scrollable = browser.div(:class => 'isgrP') # div with overflow-y=scroll
              browser.execute_script('arguments[0].scrollTop = arguments[0].scrollHeight', scrollable)
              check+=1
              puts "line 433"
            end
          else
            browser.back
            browser.back
            scrollable = browser.div(:class => 'isgrP') # div with overflow-y=scroll
            browser.execute_script('arguments[0].scrollTop = arguments[0].scrollHeight', scrollable)
            check+=1
            puts "line 441"
          end
          sleep(3)
        else
          browser.back
          scrollable = browser.div(:class => 'isgrP') # div with overflow-y=scroll
          browser.execute_script('arguments[0].scrollTop = arguments[0].scrollHeight', scrollable)
          check+=1
          puts "line 448"
        end
      end 
    end 
  end 
  actionBlocked(browser, skipfollow, account, account.commenthourCounter, account.commentLimit)
  verifyAccount(browser)
  #Phone Verification
  phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
  puts "line 459"
end

def commentHashTag(browser, account, user, skipfollow, skiplike, skipcomment, skipunfollow, rand, tclient, hashtags, comments, accounts, username)
  puts "performing commentHashTag"
  exitAnnoyingPopups(browser)
  random = rand(hashtags.length)
  randomhashTag = hashtags[random]
  randomhashTag.split("#")
  browser.goto "https://www.instagram.com/explore/tags/#{randomhashTag[1]}"
  sleep(5)
  check = 0
  random = rand(comments.length)
  randomComment = comments[random]
puts "line 472"
  while browser.div(:class => ["v1Nh3", "kIKUG", "_bz0w"], :index => check).exists?
    browser.div(:class => ["v1Nh3", "kIKUG", "_bz0w"], :index => check).click
    sleep(2)
    if browser.svg(:aria_label => "Comment").exists? && !(browser.a(:text => "#{username}").exists?) && !(browser.svg(:aria_label => 'Unlike').exists?)
      browser.svg(:aria_label => "Comment").click
      accountusernamepresent = false
      
      accounts.each do |n|
        if(browser.a(:text => "#{n.username}").exists?)
          accountusernamepresent = true
        end 
      end

     #Write Comment
      if browser.textarea(:aria_label => "Add a comment…").exists? && !(accountusernamepresent) 
        browser.textarea(:aria_label => "Add a comment…").set "#{randomComment}"
      
        #Press Submit Button
        if browser.button(:text => 'Post').exists? && browser.button(:text => 'Post').enabled?
          browser.button(:text => 'Post').click
          account.commenthourCounter += 1
          sleep(2)
          #Action Blocked
          actionBlocked(browser, skipfollow, account, account.commenthourCounter, account.commentLimit)
          verifyAccount(browser)
          #Phone Verification
          phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
          puts "line 500"
          sleep(10)
          break
        end
      else
        browser.back
        browser.back
        check+=1
        puts "line 508"
      end
    else
      browser.svg(:aria_label => 'Close').click
      check += 1
      puts "line 513"
    end
  end
  actionBlocked(browser, skipfollow, account, account.followhourCounter, account.followLimit)
   #verify Account
  verifyAccount(browser)
   #Phone Verification
  phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
  puts "line 521"
end

def commentFeed(browser, account, user, skipfollow, skiplike, skipcomment, skipunfollow, rand, tclient, username, comments, accounts)
  puts "performing commentFeed"
  browser.goto "instagram.com"
  exitAnnoyingPopups(browser)
  i = 0
  while i < rand(10)
    int = rand(-100..100)
    browser.driver.execute_script("window.scrollBy(0, document.body.scrollHeight*#{int.to_i})")
    i += 1
    sleep(1)
  end
  puts "line 534"
  count = 0
  while browser.svg(:aria_label => 'Comment', :class => '_8-yf5', :index => count).exists?
    browser.svg(:aria_label => 'Comment', :class => '_8-yf5', :index => count).scroll.to :center
    browser.svg(:aria_label => 'Comment', :class => '_8-yf5', :index => count).click
    sleep(2)
    accountusernamepresent = false
    accounts.each do |n|
      if(browser.a(:text => "#{n.username}").exists?)
        accountusernamepresent = true
      end 
    end
            
    if browser.textarea(:aria_label => "Add a comment…").exists? && !(accountusernamepresent) 
      random = rand(comments.length)
      randomComment = comments[random]
      browser.textarea(:aria_label => "Add a comment…").set "#{randomComment}"
      puts "line 543"
      #Press Submit Button
      if browser.button(:text => 'Post').exists? && browser.button(:text => 'Post').enabled?
        browser.button(:text => 'Post').click
        account.commenthourCounter += 1
        sleep(2)
        #Action Blocked
        actionBlocked(browser, skipfollow, account, account.commenthourCounter, account.commentLimit)
        verifyAccount(browser)
        #Phone Verification
        phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
        break
        puts "line 555"
      end
    else
      browser.back
      count+=1
      puts "line 560"
    end
    puts "line 562"
  end

  #Action Blocked
  actionBlocked(browser, skipfollow, account, account.likehourCounter, account.likeLimit)
  verifyAccount(browser)
  #Phone Verification
  phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
  puts "line 571"
end

def unfollow(browser, account, user, skipfollow, skiplike, skipcomment, skipunfollow, rand, tclient, username)
  puts "performing unfollow"
  browser.goto "instagram.com"
  exitAnnoyingPopups(browser)
  puts "line 577"
  if browser.a(:href => "/#{username}/").exists?
     browser.a(:href => "/#{username}/").scroll.to :center
     browser.a(:href => "/#{username}/").click
   
     sleep(3)
     following = browser.a(:href => "/#{username}/following/")
     following.scroll.to :center

     browser.a(:href => "/#{username}/following/").click
     sleep(5)
     browser.driver.switch_to.default_content
   #unfollow Button
    if browser.button(:text => 'Following').exists?
      browser.button(:text => 'Following').click
      sleep(2)

     #unfollow
      browser.button(:text => 'Unfollow').click
      sleep(5)
      puts "line 597"
      #Action Blocked
      actionBlocked(browser, skipfollow, account, account.unfollowhourCounter, account.unfollowLimit)
      verifyAccount(browser)
      #Phone Verification
      phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
      puts "line 603"
    end
  end
  account.unfollowhourCounter += 1 
  actionBlocked(browser, skipfollow, account, account.commenthourCounter, account.commentLimit)
  verifyAccount(browser)
  #Phone Verification
  phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
  puts "line 611"
end


def dm()
end

def simulateHumanBehavior()
end

def changePassword(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, account)
  puts "performing changePassword"
  if browser.button(:text => 'Change Password').exists?
    browser.button(:text => 'Change Password').click
    browser.text_field(:name => 'old_password').set "#{password}"
    browser.text_field(:name => 'new_password1').set "Mpvolt@matt78180"
    browser.text_field(:name => 'new_password2').set 'Mpvolt@matt78180'
    browser.button(:text => 'Change Password').click
    account.password = 'Mpvolt@matt78180'
    skiplike = true
    skipfollow = true
    skipcomment = true
    skipunfollow = true
    browser.quit
  end
  puts "line 635"
end

def exitAnnoyingPopups(browser)
puts "performing exitAnnoyingPopups"
  if browser.button(:class => 'GAMXX').exists?
    browser.button(:class => 'GAMXX').click
    sleep(5)
  end
  if browser.button(:text => 'Not Now').exists?
    browser.button(:text => 'Not Now').click
    sleep(5)
  end
  if browser.button(:text => 'Cancel').exists?
    browser.button(:text => 'Cancel').click
    sleep(5)
  end
  while browser.button(:id => 'reload-button').exists?
    browser.button(:id => 'reload-button').click
    sleep(5)
  end
  if browser.button(:class => ["aOOlW", "HoLwm"]).exists?
    browser.button(:class => ["aOOlW", "HoLwm"]).click
  end
  if browser.button(:text => 'Not Now').exists?
    browser.button(:text => 'Not Now').click
    sleep(5)
  end
  if browser.button(:text => 'Cancel').exists?
    browser.button(:text => 'Cancel').click
    sleep(5)
  end
  if browser.button(:class => ["aOOlW", "HoLwm"]).exists?
    browser.button(:class => ["aOOlW", "HoLwm"]).click
  end
  puts "line 669"
end

def actionBlocked(browser, flag, account, counter, limit)
  puts "performing actionBlocked"
  if browser.h3(:text => "Action Blocked").exists?
    puts "Username #{username} action was blocked"
    flag = true
    account.counter=(account.limit*0.10).ceil
  end
end


##Program burner phone verification
def verifyAccount(browser)
  puts "performing verifyAccount"
  if browser.h2(:text => "Help Us Confirm It's You").exists?
    browser.quit
  end
  puts "line 687"
end


##Program burner phone verification
def phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, flag, counter, limit, account)
  puts "performing phoneVerify"
  if browser.input(:class=> ["PAhYv", "zyHYP"]).exists? || browser.div(:id => "checkpoint").exists? || browser.h3(:text => 'Your Account Was Compromised').exists?
    if browser.button(:text => 'Change Password').exists?
      changePassword(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, account)
    end
    skipfollow = true
    skiplike = true
    skipcomment = true
    skipunfollow = true
    account.counter=(account.limit*0.10).ceil
    browser.quit
  end
  puts "line 704"
end

def emailVerify(browser, tclient, skiplike, skipcomment, skipfollow, skipunfollow, account, emails)
  puts "performing emailVerify"
  if browser.button(:class => ["_5f5mN", "jIbKX", "KUBKM", "yZn4P"]).exists?
    sleep(5)
    if browser.div(:class => 'x8k0n ').exists?
      browser.div(:class => 'x8k0n ').click
      sleep(2)
    end 
    browser.button(:class => ["_5f5mN", "jIbKX", "KUBKM", "yZn4P"]).click
    sleep(10)
    browser.execute_script( "window.open()" )
    browser.driver.switch_to.window(browser.driver.window_handles[1])
    browser.goto("emailfake.com/#{username}")
    sleep(30)
    
    while browser.button(:id => 'reload-button').exists?
      browser.button(:id => 'reload-button').click
      sleep(10)
    end
    

    browser.driver.execute_script("window.scrollBy(0, 400)")
    
    if browser.div(:text => 'Verify Your Account').exists?
      browser.div(:text => 'Verify Your Account', :index => 0).scroll.to :center
      browser.div(:text => 'Verify Your Account', :index => 0).click
      sleep(4)
      
      while browser.button(:id => 'reload-button').exists?
      browser.button(:id => 'reload-button').click
      sleep(10)
      end
      
      code = browser.font(:size => '6').text
      puts code
      browser.windows.last.close
      sleep(2)
      browser.text_field(:aria_label => 'Security code').set "#{code}"
      browser.button(:class => ["_5f5mN", "jIbKX", "KUBKM", "yZn4P"]).click
      sleep(3)
      if browser.button(:text => 'Change Password').exists?
        changePassword(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, account)
      elsif browser.button(:text => 'submit').exists?
        browser.quit
      end
    else
      emails -= ["#{account.email}"]
      browser.quit
    end
    sleep(2)
  end
  puts "line 757"
end

  
#Account Constraints
#New Accounts can only do 50-80 actions first day
#Increase 10-20 each day until maximum of 500/day is reached


class Account
  
  @@array = Array.new
  

  attr_accessor :email, :user, :proxy, :dayCounter, 
  :followdayCounter, :followhourCounter, :followLimit, 
  :likedayCounter, :likehourCounter, :likeLimit, 
  :commentdayCounter, :commenthourCounter, :commentLimit, 
  :unfollowdayCounter, :unfollowhourCounter, :unfollowLimit,
  :username, :begtime, :endtime, 
  :skiplike, :skipfollow, :skipunfollow, 
  :skipunfollow, :password

   
  def initialize(email, user, proxy, followLimit, likeLimit, commentLimit, unfollowLimit)
      @email = email
      @user = user
      @proxy = proxy  
      @followLimit = followLimit
      @likeLimit = likeLimit
      @commentLimit = commentLimit
      @unfollowLimit = unfollowLimit
      @username = email
      #Follow Constraints
      #Max 200 per day
      @followdayCounter = 0
      @followhourCounter = 0
      #Like Constraints
      #Max 1000 per day  
      @likedayCounter = 0
      @likehourCounter = 0

      @begtime = 0
      @endtime = 0
      #Comment Constraints
      #Max is 180-200 per day
      @commentdayCounter = 0
      @commenthourCounter = 0

      #Unfollow Constraints
      #Max same as follow constraints
      @unfollowdayCounter = 0
      @unfollowhourCounter = 0

      @skiplike = false
      @skipfollow = false
      @skipunfollow = false
      @skipcomment = false
      @password = "Mpvolt42@matt78180"
      @dayCounter = 0    
  end

  def self.all
    @@array
  end
end

accounts = []
z = 0

emails.each_with_index do |email, index|
  if index.even?
    accounts << Account.new(email, instagramers[rand(instagramers.length)], proxies[z], 20, 20, 20, 20)
  else
    accounts << Account.new(email, instagramers[rand(instagramers.length)], proxies[z], 20, 20, 20, 20)
    z+=1
  end
end

while true

  accounts.each do |account|

    begin

      #Username/Password
      username = 'antiseptize@v-mail.xyz'
      password = 'buddyboy'
      
      count = 0
      user = account.user
      proxy = account.proxy

      skipfollow = false
      skipunfollow = false
      skipcomment = false
      skiplike = false

      random = rand(hashtags.length)
      randomhashTag = hashtags[random]
      

      puts "Instagramer: " + user
      puts "Like Limit = " + (account.likeLimit*0.10).ceil.to_s
      puts "Follow Limit = " + (account.followLimit*0.10).ceil.to_s
      puts "Comment Limit = " + (account.commentLimit*0.10).ceil.to_s
      puts "Unfollow Limit = " + (account.unfollowLimit*0.10).ceil.to_s

      switches = ["--proxy-server=#{proxy}"]
      #open browser, navigate to login page
      driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :iphone, :switches => switches)
      browser = Watir::Browser.new driver
      browser.driver.manage.window.resize_to(1280,688)
      #browser = Watir::Browser.new :chrome
      browser.cookies.clear

      browser.goto "https://www.instagram.com/accounts/login/"

      while browser.button(:id => 'reload-button').exists?
        browser.button(:id => 'reload-button').click
        sleep(10)
      end

      #log into instagram
      puts "Logging into #{username}"
      browser.text_field(:name => "username").set "#{username}"
      browser.text_field(:name => "password").set "#{password}"
      #Click login button
      browser.button(:class => ["sqdOP", "L3NKy", "y3zKF"], :type => 'submit').click
      sleep(4)

      changePassword(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, account)
    
      if browser.button(:class => ["sqdOP", "L3NKy", "y3zKF"], :text => 'Log In').exists?
        emails -= ["#{account.email}"]
        browser.quit
        next
      end

      #Email Verification
      emailVerify(browser, tclient, skiplike, skipcomment, skipfollow, skipunfollow, account, emails)

      exitAnnoyingPopups(browser)

      exitAnnoyingPopups(browser)
        
      if browser.a(:class => 'gKAyB', :index => 3).exists?
        browser.a(:class => 'gKAyB', :index => 3).scroll.to :center
        browser.a(:class => 'gKAyB', :index => 3).click
        sleep(3)
        username = browser.h2(:class => ['_7UhW9', 'fKFbl', 'yUEEX', 'KV-D4', 'fDxYl']).text
        account.username = username
      end         


        while browser.exists?

          rand = rand(10)

          #Follow
          while account.followdayCounter < account.followLimit && (rand == 0 || rand == 1) && skipfollow == false
            while account.followhourCounter < (account.followLimit*0.10).ceil && skipfollow == false && (rand == 0 || rand == 1)
              puts "Performing Follow Algorithm"
              verifyAccount(browser)
              phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
              changePassword(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, account)
              puts "line 932"
              if(rand == 0)
                follow(browser, account, user, skipfollow, skiplike, skipcomment, skipunfollow, rand, tclient)
              elsif(rand == 1)
                followHashTag(browser, account, user, skipfollow, skiplike, skipcomment, skipunfollow, rand, tclient, hashtags, username)
              end
              puts "line 929"
              rand = rand(10)
              sleep(10)
            end
            rand = rand(10)
            puts "line 934"
          end

          rand = rand(10)

          #Like
          while account.likedayCounter < account.likeLimit && (rand == 2 || rand == 3 || rand == 4) && skiplike == false
            while account.likehourCounter < (account.likeLimit*0.10).ceil && skiplike == false && (rand ==2 || rand == 3 || rand == 4)
                puts "Performing Like Algorithm"
                
                verifyAccount(browser)
                phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
                changePassword(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, account)
                puts "line 947"
                if(rand == 2)
                  like(browser, account, user, skipfollow, skiplike, skipcomment, skipunfollow, rand, tclient, username)
                elsif(rand == 3)
                  likeFeed(browser, account, user, skipfollow, skiplike, skipcomment, skipunfollow, rand, tclient, username)
                elsif(rand == 4)
                  likeHashTag(browser, account, user, skipfollow, skiplike, skipcomment, skipunfollow, rand, tclient, hashtags, username)
                end
                puts "line 955"
                rand = rand(10)
                sleep(10)
            end
            puts "line 958"
            rand = rand(10)
          end 

          rand = rand(10)

          #Scroll Activity Feed/Follow a few back
          while rand == 5 && account.followhourCounter < (account.followLimit*0.10).ceil && skipfollow == false && account.followdayCounter < account.followLimit
        	  puts "Performing Activity Feed Algorithm"

            verifyAccount(browser)
            phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
            changePassword(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, account)

            puts "line 973"
            activityFeed(browser, tclient, account, skiplike, skipfollow, skipcomment, skipunfollow, count)
            rand = rand(10)
            sleep(10)
            puts "line 977"
          end 
          
          rand = rand(10)
          #Comment
          while account.commentdayCounter < account.commentLimit && (rand == 6 || rand == 7 || rand == 8) && skipcomment == false
            while account.commenthourCounter < (account.commentLimit*0.10).ceil && skipcomment == false && (rand == 6 || rand == 7 || rand == 8)
              puts "Performing Comment Algorithm"

              
              verifyAccount(browser)
              phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
              changePassword(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, account)
              puts "line 990"

              if(rand == 6)
                comment(browser, account, user, skipfollow, skiplike, skipcomment, skipunfollow, rand, tclient, username, comments, accounts)
              elsif(rand == 7)
                commentFeed(browser, account, user, skipfollow, skiplike, skipcomment, skipunfollow, rand, tclient, username, comments, accounts)
              elsif(rand == 8)
                commentHashTag(browser, account, user, skipfollow, skiplike, skipcomment, skipunfollow, rand, tclient, hashtags, comments, accounts, username)
              end
              puts "line 999"
              rand = rand(10)
              sleep(8)
            end
            puts "line 1002"
            rand = rand(10)
        	end

          rand = rand(10)

          #Unfollow
          while account.unfollowdayCounter < account.unfollowLimit && rand == 9 && skipunfollow == false
            while account.unfollowhourCounter < (account.unfollowLimit*0.10).ceil && skipunfollow == false && rand == 9
              puts "Performing Unfollow Algorithm"
              
              verifyAccount(browser)
              phoneVerify(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, skipfollow, account.followhourCounter, account.followLimit, account)
              changePassword(browser, tclient, skiplike, skipfollow, skipcomment, skipunfollow, account)
              puts "line 1017"
              unfollow(browser, account, user, skipfollow, skiplike, skipcomment, skipunfollow, rand, tclient, username)
              rand = rand(10)
              puts "line 1020"
              sleep(10)
            end
            rand = rand(10)
            puts "line 1023"
          end

          random = rand(instagramers.length)
          user = instagramers[random]
          puts "New user = " + user
          puts "Current like counter " + account.likehourCounter.to_s
          puts "Current follow counter " + account.followhourCounter.to_s
          puts "Current comment counter " + account.commenthourCounter.to_s
          puts "Current unfollow counter " + account.unfollowhourCounter.to_s
          rand = rand(10)

          if skipfollow == true || skipunfollow == true || skipcomment == true || skiplike == true
            skipfollow = false
            skipunfollow = false
            skiplike = false
            skipcomment = false
            break
          end

          #IMPORTANT!! -> !Floor = 0 
          if account.followhourCounter >= (account.followLimit*0.10).floor && account.unfollowhourCounter >= (account.unfollowLimit*0.10).floor && account.commenthourCounter >= (account.commentLimit*0.10).floor && account.likehourCounter >= (account.likeLimit*0.10).floor
        	
        	  account.followdayCounter += account.followhourCounter	#Followers per day counter
            account.followhourCounter = 0 	#Reset Hourly Counter
        	
        	  account.unfollowdayCounter += account.unfollowhourCounter	#Followers per day counter
            account.unfollowhourCounter = 0 	#Reset Hourly Counter
        	
        	  account.commentdayCounter += account.commenthourCounter	#Followers per day counter
            account.commenthourCounter = 0 	#Reset Hourly Counter
        	
        	  account.likedayCounter += account.likehourCounter	#Followers per day counter
            account.likehourCounter = 0 	#Reset Hourly Counter

            puts "#{username} Ending 1 hour run"
            puts "Total Likes  = " + (account.likedayCounter).to_s
            puts "Total Follows = " + (account.followdayCounter).to_s
            puts "Total Comments = " + (account.commentdayCounter).to_s
            puts "Total Unfollows  = " + (account.unfollowdayCounter).to_s	
            current = Time.now
            puts "Running for #{current-start} seconds"
            sleep(3600)
              #No checkpoint encountered #1 checkpoint encountered #2 checkpoints encountered #3 checkpoints encountered #4 checkpoints encountered
            if account.likedayCounter >= account.likeLimit && account.followdayCounter >= account.followLimit && account.commentdayCounter >= account.commentLimit && account.unfollowdayCounter >= account.unfollowLimit 
              account.likedayCounter = 0
              account.likehourCounter = 0
              account.followdayCounter = 0
              account.followhourCounter = 0
              account.commentdayCounter = 0
              account.commenthourCounter = 0
              account.unfollowhourCounter = 0
              account.unfollowdayCounter = 0

              if account.followLimit < 125
                account.followLimit = account.followLimit+10
              end

              if account.likeLimit < 200
                account.likeLimit = account.likeLimit+14
              end

              if account.commentLimit < 25
                account.commentLimit = account.commentLimit+3
              end

              if account.unfollowLimit < 150
                account.unfollowLimit = account.unfollowLimit+10
              end 

              puts "#{username} limits have been reached"
              puts "New Like Limit = " + account.likeLimit.to_s
              puts "New Follow Limit = " + account.followLimit.to_s
              puts "New Comment Limit = " + account.commentLimit.to_s
              puts "New Unfollow Limit = " + account.unfollowLimit.to_s

              time = Time.now
              
              #Alert for new post
=begin              account.dayCounter += 1
              if time.wednesday? || time.saturday?
                tclient.messages.create(
                  from: from,
                  to: to,
                  body: "Hey Matt, please post a new picture to account #{account.email} when you can"
                  )
              end
=end
              #Change this based on # of accounts
              #hoursLeft = 3600(24-time.hour)
              #sleep(3600*(accounts.length*2))
              browser.quit
            end
          end
          puts "line 1117"
        end
      
      #close the browser window to release resources
      current = Time.now
      puts "Program has been running for #{current-start} seconds"
      time = Time.new
      puts "Current Time : " + (time.inspect).to_s
      browser.quit
      sleep(10)


    rescue Watir::Exception::UnknownObjectException, Selenium::WebDriver::Error::TimeoutError, Selenium::WebDriver::Error::ElementClickInterceptedError, Net::ReadTimeout, Errno::ECONNRESET => e
      puts "An error of type #{e.class} happened, message is #{e.message}"
      retry
    end
  end
end



#  if browser.button(:class => '_0mzm- sqdOP  L3NKy       ').exists?
#	browser.button(:class => '_0mzm- sqdOP  L3NKy       ').click
  
#  while true
#  	if browser.button(:class => '_0mzm- sqdOP  L3NKy       ').exists?
#  	 ap "Following #{val}"
#  	 browser.button(:class => '_0mzm- sqdOP  L3NKy       ').click
#  	 sleep(5)
#  	else
#  	 browser.driver.execute_script("window.scrollBy(0, document.body.scrollHeight*0.20)")

  
  
	
 # pry.start(binding)


# users = ['instagram', 'selenagomez', 'arianagrande', 'taylorswift', 'beyonce', 'kimkardashian', 'cristiano', 'kyliejenner', 'justinbieber', 'kendalljenner', 'nickiminaj', 'natgeo', 'neymarjr', 'nike', 'leomessi','khloekardashian', 'mileycyrus', 'katyperry', 'jlo', 'ddlovato', 'kourtneykardash', 'victoriasecret', 'badgalriri', 'fcbarcelona', 'realmadrid', 'theellenshow', 'justintimberlake', 'zendaya' 'caradelevingne', '9gag', 'chrisbrownofficial', 'vindiesel', 'champagnepapi', 'davidbeckham', 'shakira', 'gigihadid', 'emmawatson', 'jamesrodiguez10', 'kingjames', 'garethbale11', 'nikefootball', 'adele', 'zacefron', 'vanessahudgens', 'ladygaga', 'maluma', 'nba', 'nasa', 'rondaldinho', 'luissuarez9', 'zayn', 'shawnmendes', 'adidasfootball', 'brumarquezine', 'hm', 'harrystyles','chanelofficial', 'ayutingting92', 'letthelordbewithyou', 'niallhoran', 'anitta', 'hudabeauty', 'camerondallas', 'adidasoriginals', 'marinaruybarbosa', 'lucyhale', 'karimbenzema', 'princessyahrini', 'zara', 'nickyjampr', 'onedirection', 'andresiniesta8', 'raffinagita1717', 'krisjenner', 'manchesterunited', 'natgeotravel', 'marcelottwelve', 'deepikapadukone', 'snoopdogg', 'davidluiz_4', 'kalbiminrozeti', 'priyankachopra', 'ashleybenson', 'shaym', 'lelepons', 'prillylatuconsina96','louisvuitton','britneyspears', 'sr4official', 'jbalvin', 'laudyacynthiabella', 'ciara', 'stephencurry30', 'instagrambrasil']
