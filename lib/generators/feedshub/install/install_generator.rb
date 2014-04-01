require 'rails/generators'

module Feedshub
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)
      desc 'This generator prepare feedshub to be used'

      def add_assets
        css_manifest = 'app/assets/stylesheets/application.css'

        if File.exist?(css_manifest)
          content = File.read(css_manifest)
          unless content.match(/require_tree\s+\.\s*$/)
            style_require_block = ' *= require feedshub/feeds\n'
            insert_into_file css_manifest, style_require_block, :after => 'require_self\n'
          end
        else
          copy_file 'application.css', 'app/assets/stylesheets/application.css'
        end

        js_manifest = 'app/assets/javascripts/application.js'
        if File.exist?(js_manifest)
          content = File.read(js_manifest)
          unless content.match(/require_tree\s+\.\s*$/)
            js_require_block = ' //= require feedshub/feeds\n'
            append_to_file js_manifest, js_require_block
          end
        else
          copy_file 'application.js', 'app/assets/javascripts/application.js'
        end
      end

      def add_styles
        copy_file 'feeds.css', 'app/assets/stylesheets/feedshub/feeds.css'
      end

      def add_scripts
        copy_file 'feeds.js', 'app/assets/javascripts/feedshub/feeds.js'
      end

      def add_config
        conf_manifest = 'config/feedshub/config.yml'
        env_update = "ENV.update YAML.load(File.read(File.expand_path('../feedshub/config.yml', __FILE__)))\n"
        copy_file 'config.yml', conf_manifest
        append_to_file 'config/application.rb', env_update
      end

      def copy_schedule
        copy_file 'schedule.rb', 'config/feedshub/schedule.rb'
      end

      def run_tasks
        exec('rake feedshub:install:migrations && rake feeds:schedule')
      end

    end
  end
end