![](https://travis-ci.org/philipqnguyen/portfolio.svg?branch=master)
[![Coverage Status](https://coveralls.io/repos/philipqnguyen/portfolio/badge.png?branch=master)](https://coveralls.io/r/philipqnguyen/portfolio?branch=master)

# My Personal Portfolio

## Description

This Portfolio is under heavy construction. When finished, it will be my portfolio showcasing my work as a web app developer.

Current it can be used to post blog articles with a title and a body. In addition, it can be used to post projects in the portfolio section of the app. Projects can also take an image url and display the image as well.

##Authentication via devise and OAuth Twitter.

Users can sign up, sign in, and sign out. Users must be signed in to post/edit/delete articles in the blog section.

In addition, uses can sign up via Twitter.

Articles belong to Users (also known as Authors), and Users has many Articles.

## Authorization w/ Pundit

Uses Pundit to create authorization policies.

## Polymorphic Association

Comments are polymorphic and therefore associated with both projects and articles.

- Editors have all powers to create, edit, destroy, and publish articles
- Authors have the power to create, and edit their own articles
- Visitors can only read published articles

![](http://i6.photobucket.com/albums/y242/ffmegaman/ScreenShot2014-09-22at113932PM.png "Screenshot of project show page")

![](http://i6.photobucket.com/albums/y242/ffmegaman/ScreenShot2014-09-18at125120AM.png "Screenshot of Article index page")

![](http://s6.photobucket.com/user/ffmegaman/media/ScreenShot2014-09-22at113556PM.png.html "Screenshot of homepage")


## Author

Philip Q Nguyen

## Thanks to

RailsCasts and Ivan Oats' [gist](https://github.com/UW-Advanced-Rails-2014/portfolio/commit/e5ac9ac700ad1aa3ae5d0cfe4bf6626930dd32b8#diff-ad7009a67ee4df1721dd8e449dffec56R36)
