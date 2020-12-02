We would like you to build a simple web or command line application, which should allow users to enter an arbitrary GitHub username, and be presented with a best guess of the GitHub user's favourite programming language.

This can be computed by using the GitHub API to fetch all of the user's public GitHub repos, each of which includes the name of the dominant language for the repository.

Documentation for the GitHub API can be found at http://developer.github.com

`rake run[username]` to start program, e.g. rake run[goodviber]

`bundle exec rspec spec` to run tests

open twitter.html and horse_js.html in web browser