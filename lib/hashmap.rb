# frozen_string_literal: true

require_relative 'linked_list'

# Builds a simple hashmap.
# Each commented method is an assignment from The Odin Project HashMap project.
class HashMap
  attr_reader :buckets, :key

  def initialize
    @buckets = Array.new(16) { [] }
  end

  # Takes a key and build a hash code for it
  # We use prime numbers to help us diminish collisions (it won't prevent them entirely)
  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  # Sets a key and give it a value.
  # If a key already exists, then the old value is overwritten or we can say that we update the key’s value
  # We build linked lists to handle collisions
  def set(key, value)
    index = hash(key) % 16

    @buckets[index] = LinkedList.new if @buckets[index].nil?

    @buckets[index].append(key, value)
  end

  # Returns the value that is assigned to this key. If key is not found, return nil.
  def get(key)
    index = hash(key) % 16

    return nil if @buckets[index].nil?

    @buckets[index].length.times do |i|
      puts @buckets[index][i + 1] if @buckets[index][i] == key
    end
  end

  # Returns true or false based on whether or not the key is in the hash map.
  def has(key)
    index = hash(key) % 16

    @buckets[index].empty? ? false : true
  end

  # If the given key is in the hash map,
  # it should remove the entry with that key and return the deleted entry’s value.
  # If the key isn’t in the hash map, it should return nil.
  def remove(key)
    index = hash(key) % 16

    return nil unless has(key)

    @buckets[index].length.times do |i|
      next unless @buckets[index][i] == key

      deleted_value = @buckets[index][i + 1]
      puts "Deleted key #{key} with value of #{deleted_value}."
      @buckets[index].delete_at(i)
      @buckets[index].delete_at(i)
    end
  end

  # Returns the number of stored keys in the hash map.
  def length
    stored_keys = 0

    16.times do |i|
      next if @buckets[i].empty?

      # Our linked list length will always be an even number.
      # And it will always hold a 'key' and a 'value'.
      # Therefore, we divide these linked lists by two to find out how many keys are stored.
      stored_keys += @buckets[i].length / 2
    end

    puts "Our hashmap currently holds #{stored_keys} stored keys."
  end

  # Removes all entries in the hash map.
  def clear
    @buckets = Array.new(16) { [] }
  end

  # Returns an array containing all the keys inside the hash map.
  def keys
    keys = []

    16.times do |i|
      next if @buckets[i].empty?

      @buckets[i].each_with_index do |_, index|
        keys << @buckets[i][index] if index.even?
      end
    end

    puts "Our hashmap holds the following keys: #{keys}"
  end

  # Returns an array containing all the values.
  def values
    values = []

    16.times do |i|
      next if @buckets[i].empty?

      @buckets[i].each_with_index do |_, index|
        values << @buckets[i][index] if index.odd?
      end
    end

    puts "Our hashmap holds the following values: #{values}"
  end

  # Returns an array that contains each [key, value] pair.
  def entries
    entries = []

    16.times do |i|
      next if @buckets[i].empty?

      @buckets[i].each_with_index do |_, index|
        next if index.odd?

        pair = [@buckets[i][index], @buckets[i][index + 1]]
        entries << pair
      end
    end

    puts "Our hashmap holds the following entries: #{entries}"
  end

  # Shows our hashmap.
  def display
    p @buckets
  end
end
