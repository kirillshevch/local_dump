module LocalDump
  class ConnectionConfig
    def self.call
      yield Rails.application.class.parent_name.underscore,
        ActiveRecord::Base.connection_config[:host] || '127.0.0.1',
        ActiveRecord::Base.connection_config[:database],
        ActiveRecord::Base.connection_config[:username],
        ActiveRecord::Base.connection_config[:password]
    end
  end
end
