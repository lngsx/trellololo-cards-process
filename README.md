# trellololo-cards-process
A Trello client app for process my cards. Just listing cards, extract their number and sum all of them. Nothing to do here...

###Install
1. Clone.
2. Set key and token in ```_config.yml```. Read instruction below
3. Add the following alias to the ~/.bashrc or something ```alias olotrello="~/path/to/repo/app.rb"```.
4. Use it!.

###To get key and token
1. Get your API keys from [trello.com/app-key](https://trello.com/app-key).
2. Visit the URL [trello.com/1/authorize], with the following GET parameters:
    - `key`: the API key you got in step 1.
    - `response_type`: "token"
    - `expiration`: "never" if you don't want your token to ever expire. If you leave this blank,
       your generated token will expire after 30 days.
    - The URL will look like this:
      `https://trello.com/1/authorize?key=YOURAPIKEY&response_type=token&expiration=never`
3. You should see a page asking you to authorize your Trello application. Click "allow" and you should see a second page with a long alphanumeric string. This is your member token.

###Dependencies
- [ruby-trello](https://github.com/jeremytregunna/ruby-trello)
- [terminal-table](https://github.com/tj/terminal-table)
