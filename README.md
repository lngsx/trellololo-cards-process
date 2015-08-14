# trellololo-cards-process
A Trello client app for process my cards.

###Dependencies
- [ruby-trello](https://github.com/jeremytregunna/ruby-trello)
- [terminal-table](https://github.com/tj/terminal-table)

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
