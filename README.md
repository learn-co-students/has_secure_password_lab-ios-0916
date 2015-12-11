# has_secure_password

## Objectives

We're going to make a Rails app that covers a simple authentication flow: users can create accounts, log in, and log out.

## Introduction

Our app has three pages:
  1. A signup page, where the user enters their username, password, and password confirmation.
  2. A login page, where the user submits their username and password and are logged in.
  3. A user homepage, which says, "Hi, #{username}."

We're not covering validations in this lab, so don't worry about those. (Password validations are hard to get right anyway; it's surprisingly easy to produce rules which decrease password security rather than enhance it.)

Users should not be able to log in if they enter an incorrect password. Just redirect them back to the login page. If you want to present an error, you can either return an HTTP error from the controller and catch it with Javascript, or set a [`flash`][flash].

## Instructions

Create a User model and migrations. You'll find that there are already tests for the model. Use `has_secure_password` to easily get them to pass.

Run your migrations.

Create a Users controller. It should respond to new with a signup form, and respond to create by creating a new user. There are tests for this controller; ensure they pass.

Create a Sessions controller. There are already tests for the sessions controller—ensure they pass.

Finally, you'll need to create a user homepage. You can either create a controller for it (a `WelcomeController` is a reasonable thing that you'll see frequently), or you can make it a route from the User controller. Write any tests you feel you need for this new route or controller.

Happy coding.

[flash]: http://api.rubyonrails.org/classes/ActionDispatch/Flash.html