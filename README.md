# Gossip_MVC
Week 4 Day 5 - "The Gossip Project" using Model-View-Controller (MVC) framework (Model = Gossip)
A little app that allows the user to save a gossip in a CSV file, view and delete existing gossips.

## Main program
Launch the main program "app.rb" to start the Router, which calls the Controller, which then calls the View and Gossip classes.

## 1) Router
In this class, we create the controller instance, and store the choice menu. 
Each choice made by the user allows to start the desired controller method.

## 2) Controller
In here we create the View instance, and define various methods :
- create_gossip => creates the Gossip instance
- index_gossip (to control the display) => calls the View/Gossip methods
- destroy_gossip => calls the View/Gossip methods

## 3) Model : Gossip
This program allows communication with the "gossip.csv" file:
- save a new gossip in the CSV file
- fetch all gossips from the CSV file
- find a gossip and delete it from the CSV file

## 4) View
In this class we generate our outputs (print, puts, gets.chomp) to ask the user to store gossips, display the list of gossips and chose a gossip to delete
