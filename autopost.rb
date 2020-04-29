require 'watir' 
require 'base64'
require 'webdriver-user-agent'
require 'selenium-webdriver'
require 'java'
require 'rukuli'
require "activerecord-jdbcmssql-adapter"



ActiveRecord::Base.establish_connection(
:adapter => "mssql",
:database => "DB",
:host => "192.168.99.100",
:username => "sa",
:password => "Matt78180@mpvolt42"
)
class Customer < ActiveRecord::Base
end

	searchbar = '/Users/macuser/Downloads/searchbar.png'

 	#1 per user
 	tag = 'mattyp402'

 	#Changes for each table entry
 	
 	photo = 'IMG_2518.jpg'
 	proxy = 'changelater'

 	photocheck = photo.split('.')
 	username = Customer.take.username
    password = "buddyboy"
 	if(photocheck[1] == 'MP4')
 		puts 'posting video'
    end
 
    driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :iphone)
    browser = Watir::Browser.new driver#, proxy: proxy
    browser.driver.manage.window.resize_to(1280,688)
    #browser = Watir::Browser.new :chrome
    browser.cookies.clear

    puts 'logging in'
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
    browser.button(:text => 'Log In').click
    sleep(4)

    if browser.button(:text => 'Not Now').exists?
      browser.button(:text => 'Not Now').click
      sleep(5)
  	end

    if browser.button(:text => 'Cancel').exists?
      browser.button(:text => 'Cancel').click
      sleep(5)
    end

    puts 'starting auto post'
#Auto Post Script Starts Here

    browser.svg(:aria_label => 'New Post').click
    sleep(2)

    screen=Rukuli::Screen.new
    #Argument1: Image Path Argument2: Wait Time Argument3: similarity score
    puts 'Rukuli Working'
   
    #Sequence for (Linux) photo upload without pixel recognition
    screen.click("#{searchbar}")
    sleep(1)
    screen.type("#{photo}")
    sleep(1)
    screen.type(Key::TAB)
    sleep(1)
    screen.type(Key::TAB)
    sleep(1)
    screen.type(Key::DOWN)
    sleep(1)
    screen.type(Key::ENTER)
    sleep(3)
    browser.button(:text => 'Next').click
    sleep(3)
    browser.textarea(:aria_label => 'Write a caption…').set "@mattyp402"
    sleep(3)
    browser.button(:text => 'Share').click
    sleep(30)
    
