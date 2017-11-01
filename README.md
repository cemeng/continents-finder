# Continents Finder

This project provides an implementation of a continents finder given a world map.

An example of a valid world file can be found at ```test/input/valid-map.txt```.
The map file is in the following format (only showing first 3 rows):
```
 1                                                                                  1 
 2  ++++ ++                        ++++++++ ++++                     +++++++++ +    2 
 3  +++ + +++   +                  +++++++++++++++                 ++++++++++++++   3 
```

```+``` denotes land, empty space denotes sea.

A continent is one or more connected pieces of land +. Two pieces of land are connected if
they are directly adjacent to each other either vertically, horizontally or diagonally.

The ```ContinentsFinder``` will process the file and outputs the continents information found on the map,
for example:
```
There are 3 Continents
Continent 1 has 201 +
Continent 2 has 15 +
Continent 3 has 267 +
```

## Prerequisites

This project is written and tested using Ruby 2.3.5. It should work on Ruby 2.2+ versions.

To check your version run:
```
$ ruby -v
```

To learn how to install ruby visit [https://www.ruby-lang.org/en/installation/](https://www.ruby-lang.org/en/installation/).

## Getting Started

Below is the instruction on getting the project running in MacOS.

```
$ git clone https://github.com/cemeng/continents-finder
$ cd continents-finder
$ ruby lib/continents_finder_runner.rb test/input/valid-map.txt
```

Which should returns the following output:
```
There are 3 Continents
Continent 1 has 809 +
Continent 2 has 589 +
Continent 3 has 368 +
```

You can provide different map and supply it as an argument to ```lib/continents_finder_runner.rb```, e.g:
```
$ ruby lib/continents_finder_runner.rb my-map.txt
```

## Tests

The test files are in ```test``` directory.

You can find some example of the input map files in ```test/input``` directory.

To run all tests, on the root directory of the project, simply run:
```
rake test
```

If you need to run individual test, run the following:
```
ruby test/name-of-the-test.rb
```

## Design

TBC

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
