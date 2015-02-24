require "ostruct"

module BtOpscenter
  class Backup < OpenStruct
    def <=>(other)
      self.created_at <=> other.created_at
    end
  end
end
