Rack::HerokuNoSuchApp
=====================

Rack middleware to prevent loading from `*.heroku.com` / `*.herokuapp.com` addresses by serving default Heroku 404 page for "App not found". Use in combination with custom domains.

## Usage

```ruby
require "rack/heroku/no-such-app"

use Rack::Heroku::NoSuchApp
```

Including this in the `config.ru` file of your Rack application will respond to requests for `*.herokuapp.com` (or redirected from `*.heroku.com`) with the following 404 page:

> ## Heroku | No such app
> There is no app configured at that hostname.
> Perhaps the app owner has renamed it, or you mistyped the URL.

## License

rack-heroku-no-such-app is available under the MIT license. See the LICENSE file for more info.
