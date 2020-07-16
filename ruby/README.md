### Gilded_Rose Tech Test

## To run 
- In terminal:
    - bundle install
    - irb -r './lib/gilded_rose.rb'

## To run tests
- type 'rspec' in the terminal

## Approach 
    
Decided to refactor the existing classes first into useful methods and file structure.
Followed TDD process using rspec and simplecov to check coverage.
Began by refactoring to get simple methods to be used to with the update_quality function (reduce_quality_by_1, increase_quality_by_1 etc.), and then had an if statement to decide how to handle each item when iterating over the item array.
Once the Gilded Rose method was refactored, I then decided to split the different types of items into individual classes that would all have an update method.
As I did this, I wasn't sure if this was the most efficient way of refactoring as the classes were all similar.
As each UpdateItem class was changing the property of the item passed into it, I wasn't sure how to mock Item in my tests
