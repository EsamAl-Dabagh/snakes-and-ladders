# Snakes and Ladders
Based on this kata: http://agilekatas.co.uk/katas/SnakesAndLadders-Kata

### Notes On My Approach
I decided to complete this kata using Ruby as I am familiar with the language and it provides flexibility in its scope for expansion in the future - either by creating a light-weight front-end using erb in combination with Sinatra on the back-end, or by creating a more complex back-end API with Rails. 

I approached this kata with a TDD mindset - taking tiny incremental steps and adhering to the red/green/refactor mantra. This allowed me to make sure each method was doing only what was necessary and therefore allowing extension in the future. 

In order to make sure the criteria was met I used the user stories and acceptance criteria in the agilekatas link above to guide me when writing tests. 

In the first instance I decided to keep everything in one class, in order to meet the basic criteria, with an eye to extracting into separate classes in the very near future. 

##### Next Steps
Given more time I would like to have done two things:
1. Test for edge cases: 
    * `@token["position"]` should not be able to go above 100. I need to put checks in place that will prevent this and also keep a player on their current square if a roll will take them passed square 100. 
    * `#move` should not accept a number greater than 6. 

 have extracted functionality out into separate classes/modules, namely: 
* `#roll_die` would call `#roll` from a `Die` module
* `@token` would be extracted to its own class - this will become more important when a second player is introduced. 

### How To Run

Clone this repo and navigate to project directory:

```
git clone https://github.com/EsamAl-Dabagh/snakes-and-ladders.git
cd snakes-and-ladders
```

Install dependencies:
```
bundle
```

Open app in IRB, require the file and create a new instance of class:
```
2.5.1 :001 > require_relative 'lib/snakes_and_ladders.rb'
 => true
2.5.1 :002 > game = SnakesAndLadders.new
 => #<SnakesAndLadders:0x00007fa6f7976c38 @token={"position"=>0}, @win_status=false>
```

Start the game, this will place you on square 1:
```
2.5.1 :003 > game.start
 => 1
```

Roll the die, this will return the square you move to:
```
2.5.1 :005 > game.roll_die
 => 2
2.5.1 :006 > game.roll_die
 => 7
```

When you reach square 100, you win: 
```
2.5.1 :032 > game.roll_die
 => 96
2.5.1 :033 > game.roll_die
Congratulations, you won!
 => 100
```

### Tests
This kata was TDD'd using RSpec, to run the tests simply run `rspec` from the terminal when you are in the root of the directory. 

Test coverage (supplied by SimpleCov) = 100% 

---

### Feature 1 - Moving Your Token
#### User Stories

```
As a player
I want to be able to move my token
So that I can get closer to the goal
```

```
As a player
I want to move my token based on the roll of a die
So that there is an element of chance in the game
```

```
As a player
I want to be able to win the game
So that I can gloat to everyone around
```