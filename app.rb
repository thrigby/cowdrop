require 'rubygems'
require 'sinatra'
require 'erb'

Score = []

get '/' do
  "value = " << session[:value].inspect
  Score.clear
  erb :index
end

get '/:value' do
  session[:value] = params[:value]
end

post '/cowdrop' do
  x = params["q1"]
  y = params["q2"]
  if x == "on"
    erb :short
  else
    erb :cowdrop
  end  
end

post '/short2' do
  	if params["a"] == "on"
  	  @guitargod = "Get an EVH Wolfgang and a 5150 amp for the brown sound."
    elsif params["b"] == "on"
      @guitargod = "Get an Ibanez Satriani signature model and a tube screamer."
  	elsif params["c"] == "on" 
  	  @guitargod = "Cheesy.  But ok.  Get a dupe of Blackie if you have the ton, or any Fender strat should do."  	
  	elsif params["d"] == "on"
  	  @guitargod = "Rok on.  Get a good wah and either his signature ESP or anything with an EMG 81 and an EMG 60 as pickups. Amp should be mesa boogie, if you can swing it."
    elsif params["e"] == "on"
      @guitargod = "Daring.  Get the ESP Hetfield trucker model or anything with at least one EMG 60 as a pickup."  	  
    elsif params["f"] == "on"
      @guitargod = "Believe it or not, Harrison played a Gibson SG for a bit.  But something chimey like a semi-hollow Gretsch or a Fender Telcaster should do the trick for his leads, Super Beatle-style."
  	elsif params["g"] == "on"
  	  @guitargod = "Fender Mustang.  'Nuff said.  Or if you want the spirit and don't care much about being a starfucking clone wannabe rokstar poser, get any banger, play it loud, and write kickass songs."
    elsif params["h"] == "on"
    	@guitargod = "Try a Fender Strat or Fender Tele."
  	else
  	  @guitargod = "No guitar god!  Bad wannabe!  Try again!"
  	end
  	erb :short2
end

post '/tedious2' do
  if params["a"] == "on"
    @snark = "Kickass, rockstar.  You'll be out of prison in no time.  Jailbreak '77, baby!Just take it easy on the mascara."
    Score << 1
  else
    @snark = "Excellent Choice, Smotchiss.  You show great restraint.  Be sure to wipe down your fretboard each time, losher."
    Score << 2
  end
  erb :tedious2
end

post '/tedious3' do
  if params["a"] == "on"
    @snark = "Aren't we the tender one?  Let it be (Naked)!"
    Score << 100
  else
    @snark = "Wall of sound, baby. Yer head hums with forgotten melodies undt delirium, knowing you may never gaze upon his bald pate again. Please don't worry, you will adjust to the outside world after a bit. Maybe. Freak."
    Score << 112
  end
  erb :tedious3
end

post '/tedious4' do
  if params["a"] == "on"
    @snark = "Ookie!  Now a tally:"
    Score << 1000
  else
    @snark = "Silent but deadly.  Ok.  Now the tally:"
    Score << 2000
  end
  do_tally
  erb :tally
end

def do_tally
  @n = Score.reduce(:+)
  	case @n
  	when 1101
  	@rokstar = "You play like Neil Young.  Get a Les Paul Black Beauty."

  	when 2101
  	@rokstar = "You play like Cat Power.  Get A Fender Telecaster and play it through a clan amp, like a Vox or a Fender Silverface."	

  	when 1113
  	@rokstar = "Metallikuh!  Metallikuh!  *grunt* Anything electric with EMGs in it as pickup.  Through a Mesa Boogie!"

  	when 2113 
  	@rokstar = "You are a pretty guitar player like beautiful like Mazzy Star.  Try a clean Fender Telecaster with some fuzz distortion."

  	when 1102
  	@rokstar = "You ARE Cat Stevens!  Any good acoustic should do it, yes!"

  	when 2102
  	@rokstar = "You ARE Cat Stevens!  Get an acoustic guitar, man, man, MAN, play pretty, meaningful."

  	when 1114
  	@rokstar = "Shred like Steve Vai!  Get his Ibanez signature model!  Practice writing good songs!!!!"

  	when 2114
  	@rokstar = "You want to play like Jeff Buckley.  You are nice!  Try a Fender Telecaster or a Fender Strat through a clean amp like a Fender and add some reverb or delay.  Add a basic, dirty distortion pedal like a ProCo Rat or the Boss DS-1 for the loud parts."

  	end
end