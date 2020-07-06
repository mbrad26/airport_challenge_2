Airport Challenge
=================

```
        ______
        _\____\___
=  = ==(____MA____)
          \_____\___________________,-~~~~~~~`-.._
          /     o o o o o o o o o o o o o o o o  |\_
          `~-.__       __..----..__                  )
                `---~~\___________/------------`````
                =  ===(_________)

```

# Task

We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

Your code should defend against edge cases such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

# Getting started

Clone this repository to your local machine.

```
# install dependencies
$ bundle install

# to run tests
$ rspec
```

# Approach

I started by identifying what classes and methods I need to implement.

### Airport class

  * ```CAPACITY``` - airport default capacity
  * ```#land(plane)``` - keeps track of the landed planes and raises errors for when airpot is full or if the weather is ```stormy?```
  * ```#take_off(plane)``` - keeps track of the planes taking off and raises errors when the weather is ```stormy?``` or if the plane is not at the current airport

### Plane class

  * ```#take_off``` - raises error if plane is already flying
  * ```#land(airport)``` - keeps a record of the landing airport and raises error when trying to land a plane that already landed
  * ```#airport``` - returns the airport where the plane is at

### Weather class

  * ```stormy?``` - weather reporter
