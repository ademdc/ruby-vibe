# Pull Request for Version 2 by Alx3Dev

Required Ruby Version is now 3.0.1.

Code is completely rewritten while keeping the same logic, and same method to execute request to viber api.

Source code is documented 100%, including private methods

RubyVibe is now module, not a class.

RubyVibe::Client -> Send request to viber api (used by ::Bot)

RubyVibe::Bot -> Extend client, and add predefined viber api methods (used by developer)

shortcut.rb -> Allow to use class as shortcut for method request
 -> RubyVibe::SendMessage[message: 'text']

