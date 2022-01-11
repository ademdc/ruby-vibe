# Update January 11, 2021 - 11:40
==================================

**Developer(s): Alx3Dev**

Info:

 - Refactored source code with breaking changes
 - User commands are still same (or almost same)
 - Now we have `client.rb` class that run connection to viber api
 - And `ruby-vibe.rb` that send commands to viber over `client.rb`
 - NOT-TESTED !
 - TO-DO: Tests and Documentation



# Update January 10, 2021 - 16:51
==================================

**Developer(s): Alx3Dev**

Info: 

 - Simplified few things about `self`
 - get_online(*ids) for online users accept multiple arguments too, not only `Array`.

Changes:

 1 - configuration.rb
   - def self.configure moved to already self extended class

 2 - info.rb
   - def get_online(ids=[]) changed to -> get_online(*ids) with ids = Array(ids) to not break anything
   - now arguments can be added in both ways
   - get_online([user_id_1, user_id_2]) or get_online(user_id_1, user_id_2)

 3 - response.rb
   - changed to def self.parse instead of extending self, and simplified new(response).parse
