# Feedshub

Feedshub is a full RoR gem that let you show your company or personal github activity in a fancy way with minimal configuration. It:

* Is a full Rails engine
* Can be added like a gem in your RoR application
* Is a complete MVC solution
* Offers you a predefined view (Github like style) that displays your organization (or personal) Github activity

## Benefits

This solution fits very well for everyone who wants to give more visibility to their company or maybe themselves. You will be able to show your development activity and in which open source project are you working on.

Although Github has some options for this purpose, none of them includes a completely integrated solution; something that needs only your organization name and shows the list of feeds. For this reason we decided to make Feedshub.

## Installation

You can add it to your Gemfile with:

```ruby
gem 'feedshub'
```

Then run the bundle command to install it

```bash
bundle install
```

After you install Feedshub, you need to run the generator

```bash
rails generate feedshub:install
```

The generator will copy:

* Necessary migrations
* Assets you can customize
* Environment configurations

Also, it will add environment variables in your application.rb file in order to load Feedshub.

The last step is run the migrations

```bash
rake db:migrate
```

## Configuration

To customize the behaviour of the gem you have to edit ```/config/feedshub/config.yml```
```yaml
  #Example of organization feeds:
  org_name: 'vairix'

  #Example of user feeds:

  #user_name: 'vairix-dfernandez'

  #Set the default number of feeds to retrieve (if no amount set by pameter)

  github_feeds_number: '10'
```
And also edit ```/config/feedshub/schedule.rb``` to customize the period of feeds updates.
Feedshub use whenever Gem to schedule the updates of feeds. For more information visit <https://github.com/javan/whenever>


To generate the schedule task, run:

```bash
RAILS_ENV=your_environment rake feeds:schedule
```

You need to do this to keep updated feeds.

## How to integrate it?

The integration is done using a helper that will render the public activity wherever you want in the view.
In order to do it you have to:

Include the helper reference in the view controller
```ruby helper Feedshub::FeedsHelper```

In your view, call the helper as shown below

```html
<%= github_feeds %>
```

By calling the helper without parameter, it will display the number of feeds specified in the configuration. You can add a parameter (ie.:```<%= github_feeds 50 %>```) to specify the number of feeds to show in the view.

## Screenshots

This is the default style of Feedshub.

![Feeds](http://vairix.com/assets/feedshub.png)


## License

Copyright 2014 VAIRIX

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
