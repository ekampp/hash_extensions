require 'active_support/all'

class Hash
  # Search for key path in hash
  #
  # Examples
  #
  #   { a: { b: :c } }.dig(:a, :b) # => :c
  #   { a: { 'b' => :c } }.dig(:a, :b) # => :c
  #   { a: { b: :c } }.dig(:a, :c) # => nil
  def dig(*path)
    path.reduce(self) do |location, key|
      location.respond_to?(:keys) ? location.stringify_keys[key.to_s] : nil
    end
  end

  # Search the Hash deeply for all values matching the +key+.
  #
  # Examples
  #
  #   { a: :b, c: { a: '1', d: :e } }.values_for('a') # => [:b, '1']
  def values_for(key)
    found_values = []
    self.each do |k, v|
      found_values << v if k.to_s == key.to_s
      if v.is_a? Hash
        found_values << v.values_for(key)
      end
    end

    found_values.flatten.compact
  end
end
