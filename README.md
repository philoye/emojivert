# Emojivert

This is a tool to translate Emoji Unicode codepoints from one encoding to another.

## Why?

Emoji can be encoded in [several ways](http://www.unicode.org/%7Escherer/emoji4unicode/snapshot/full.html):
  * Unified
  * DoCoMo
  * KDDI
  * SoftBank
  * Google

This utility lets you convert from one to the other.

I personally ran into this issue because Facebook uses the Google encoding in their Graph API. To get them to show up properly on OSX/iOS, you need to convert them to unified Unicode.


## Usage

The methods you'll need for translation are of the form:

    Emojivert.FROMENCODING_to_TOENCODING(string)

Encodings are:
  * `unified`
  * `docomo`
  * `kddi`
  * `softbank`
  * `google`

The following shows the basic usage, starting with JSON as an example.
    json = '"All work and no play, makes \ud83d\ude0e\ a dull boy \udbba\udf59."'
    => "\"All work and no play, makes \\ud83d\\ude0e\\ a dull boy \\udbba\\udf59.\""

    str = ActiveSupport::JSON.decode(json)
    => "All work and no play, makes 😎 a dull boy 󾭙."

    Emojivert.google_to_unified(str)
    => "All work and no play, makes 😎 a dull boy 💤."

There are also methods for getting the Unicode name from a Unified code point and vice versa.

    Emojivert.name_to_unified('PILE OF POO')
    => "💩"
    Emojivert.unified_to_name("💩")
    => "PILE OF POO"


## Caveats

I used the mappings from the [rails-emoji](https://github.com/uken/rails-emoji) project and I didn't check them. The standards may change (or might have already). I personally have only used the Google to Unified translating, your mileage may vary on the rest.

There are methods to convert to an HTML representation of emoji for use with CSS and image sprites. I've included the methods, but not the CSS / images necessary to make use of them. Again, check out the [rails-emoji](https://github.com/uken/rails-emoji) project if you to pursue this. There are several other emoji library that may be useful for rendering emoji with images, see a list below.


## Installation

Add this line to your application's Gemfile:

    gem 'emojivert'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install emojivert


## Credits

The hard work was already done by [Uken](https://github.com/uken) and the [rails-emoji](https://github.com/uken/rails-emoji). I simply converted it from an engine to a gem.


## Other Emoji Projects

* [Rumoji](https://github.com/mwunsch/rumoji)
* [PHP-Emoji](https://github.com/iamcal/php-emoji)
* [Gemoji](https://github.com/github/gemoji)
* [Rails-Emoji](https://github.com/uken/rails-emoji)
* [Rails_Emoji](https://github.com/jsw0528/rails_emoji)
* [Emoji](https://github.com/steveklabnik/emoji)
* [PhantomOpenEmoji](https://github.com/Genshin/PhantomOpenEmoji)
* [Emojidex-Rails](https://github.com/Genshin/emojidex-rails)
* [Emojistatic](https://github.com/mroth/emojistatic)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
