module LocalDump
  class DumpName
    def self.call(args, db)
      args[:name] ? "#{db}_#{args[:name]}" : db
    end
  end
end
