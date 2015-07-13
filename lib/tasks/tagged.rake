require 'doorkeeper'

namespace :tagged do

  namespace :auth do
    desc 'Create an OUTH application for the ember app'
    task :create_app => :environment do |t, args|

      args.with_defaults(
        redirect_uri: ENV['TAGGED_EMBER_OUTH_REDIRECT_URI'] || 'http://localhost:4200/'
      )
      puts "Creating oauth2 app with callback #{args[:redirect_uri]}"
      app = Doorkeeper::Application.find_by(name: 'tagged_ember')
      if app
        puts "Doorkeeper Application 'tagged_ember' allready exists!"
        puts "visit: /oauth/applications/#{app.id} to get the token and secret" and next
      else
        app = Doorkeeper::Application.create!(
          name: 'tagged_ember',
          redirect_uri: args[:redirect_uri]
        )
        if app.valid?
          puts "Doorkeeper Application created successfully."
          puts "visit: /oauth/applications/#{app.id}  to get the token and secret"
        else
          puts "Doorkeeper Application could not be created!"
          puts app.errors.full_messages.to_yaml
        end
      end
    end
  end

  desc 'Bootstrap the application'
  task :bootstrap => :environment do |t, args|
    Rake::Task["tagged:auth:create_app"].invoke
  end
end
