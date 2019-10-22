namespace :local do
  namespace :db do
    desc 'Dump the database'
    task :dump, [:name] => [:environment] do |_, args|
      cmd = nil

      LocalDump::ConnectionConfig.call do |_app, host, db, user, password|
        dump_name = LocalDump::DumpName.call(args, db)
        dump_path = Rails.root.join('db', 'dump', "#{dump_name}.psql")
        Dir.mkdir('db/dump') unless Dir.exist?('db/dump')
        user_info = user ? "--username #{user}" : ''
        cmd = "PGPASSWORD=#{password} pg_dump --host #{host} #{user_info} --verbose --clean --no-owner --no-acl --format=c #{db} > #{dump_path}"
      end

      p cmd
      exec cmd
    end
  end
end
