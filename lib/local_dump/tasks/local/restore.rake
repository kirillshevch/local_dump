namespace :local do
  namespace :db do
    desc 'Restore the database dump'
    task :restore, [:name] => [:environment] do |_, args|
      cmd = nil
      LocalDump::ConnectionConfig.call do |_app, host, db, user, password|
        dump_name = LocalDump::DumpName.call(args, db)
        dump_path = Rails.root.join('db', 'dump', "#{dump_name}.psql")
        user_info = user ? "--username #{user}" : ''
        cmd = "PGPASSWORD=#{password} pg_restore --verbose --host #{host} #{user_info} --clean --no-owner --no-acl --dbname #{db} #{dump_path}"
      end
      Rake::Task['db:drop'].invoke
      Rake::Task['db:create'].invoke
      p cmd
      exec cmd
    end
  end
end
