# encoding: UTF-8

require 'active_record'

class ActiveRecord::Base
  module IdNameCache
    extend ActiveSupport::Concern

    # TODO support memcache, if key is big
    included do
      cattr_accessor :idname_id, :idname_name
      cattr_accessor :_hash_cache
      cattr_accessor :could_create
      self._hash_cache = Hash.new # Trie和Hash察看单个字符串性能比较 http://code.eoe.cn/code/32/
      self.idname_id = :id
      self.idname_name = :name
      self.could_create = true
    end

    module ClassMethods
      def [] key = nil
        return nil if key.nil?

        _k, _v = case key
        when Fixnum, Integer
          [:idname_id, :idname_name]
        when String
          key = key.strip
          [:idname_name, :idname_id]
        end
        raise "#{key.inspect} [#{key.class}] Please use Integer or String" if _k.nil?

        k = "#{self.send(_v)}/#{key}"[0..249]
        v = self._hash_cache[k]
        if v.nil?
          m = self.could_create ? "find_or_create_by_" : "find_by_"
          record = self.send("#{m}#{self.send(_k)}", key)
          v = record.send(self.send(_v)) if record
          self._hash_cache[k] = v
        end
        v
      end

      def set_key_value key, value
        self.could_create = true
        _set_key_value key, value
      end
      def set_key_value_without_create key, value
        self.could_create = false
        _set_key_value key, value
      end

      private
      def _set_key_value key, value
        raise "key and value should not be the same column" if key === value
        self.idname_id = key
        self.idname_name = value
      end
    end

  end
end
