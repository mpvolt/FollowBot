require 'watir' 
require 'base64'
require 'webdriver-user-agent'
require 'selenium-webdriver'
require 'java'
require 'rukuli'

#Doesn't change (NO MATTER WHAT)
	searchbar = '/Users/macuser/Downloads/searchbar.png'
	flumeicon = '/Users/macuser/Downloads/postvideoflume/flumeicon.png'
	letsgo = '/Users/macuser/Downloads/postvideoflume/letsgo.png'
	usernamefield = '/Users/macuser/Downloads/postvideoflume/usernamefield.png'
	passwordfield = '/Users/macuser/Downloads/postvideoflume/passwordfield.png'
	acceptterms = '/Users/macuser/Downloads/postvideoflume/acceptterms.png'
	loginbutton = '/Users/macuser/Downloads/postvideoflume/loginbutton.png'
	viewtab = '/Users/macuser/Downloads/postvideoflume/viewtab.png'
	postpic = '/Users/macuser/Downloads/postvideoflume/postpic.png'
	loading = '/Users/macuser/Downloads/postvideoflume/loading.png'
	postbutton = '/Users/macuser/Downloads/postvideoflume/postbutton.png'
 	#1 per user
 	tag = 'mattyp402'

 	#Changes for each table entry
 	username = 'antiseptize@v-mail.xyz'
 	password = "buddyboy"
 	photo = 'vid.MP4'
 	proxy = 'changelater'

 	photocheck = photo.split('.')
    screen=Rukuli::Screen.new
    #Argument1: Image Path Argument2: Wait Time Argument3: similarity score
    puts 'Rukuli Working'
   
    #Sequence for (Linux) photo upload without pixel recognition
    screen.click("#{flumeicon}")
    sleep(5)
    screen.click("#{letsgo}")
    sleep(5)
    screen.click("#{usernamefield}")
    screen.type("#{username}")
    screen.click("#{passwordfield}")
    screen.type("#{password}")
    screen.click("#{acceptterms}")
    screen.click("#{loginbutton}")
    sleep(5)
    screen.click("#{viewtab}")
    screen.type(Key::DOWN)
    screen.type(Key::ENTER)
    sleep(3)
    screen.click("#{postpic}")
    sleep(3)
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

    while(screen.exists("#{loading}"))
    	sleep(1)
    end

    screen.type("#{tag}")
    screen.click("#{postbutton}")
    screen.click("#{accountab}")
    screen.type(Key::DOWN)
    screen.type(Key::DOWN)
    screen.type(Key::DOWN)
    screen.type(Key::ENTER)