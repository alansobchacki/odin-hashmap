# frozen_string_literal: true

require_relative 'hashmap'

map = HashMap.new

# Adds new keys to our hashmap
map.set('Sara', 'Smith')
map.set('Fred', 'Johnson')
map.set('raSa', 'Lilith')

# Shows us the values of the inputed keys
# Won't show anything if the key is nil
map.get('Sara')
map.get('raSa')
map.get('Oswald')

# Returns true if these keys are present
p map.has('raSa')
p map.has('Jennifer')

# Shows our hashmap
map.display

# Shows our hashmap length
map.length

# Deletes this key from our hashmap
# Won't do anything if the key is nil
map.remove('Sara')
map.remove('John')

# Shows all keys in our hashmap
map.keys

# Shows all values in our hashmap
map.values

# Shows all key and value pairs in our hashmap
map.entries

# Deletes all keys from our hashmap
map.clear

# Deletes all keys from our hashmap
map.clear
map.display
