require 'rails/generators'

module Feedshub
  module Generators
    class AssetsGenerator < ::Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)
      desc 'This generator installs Feedshub to Asset Pipeline'

      def add_assets
        css_manifest = 'app/assets/stylesheets/application.css'

        if File.exist?(css_manifest)
          content = File.read(css_manifest)
          unless content.match(/require_tree\s+\.\s*$/)
            style_require_block = " *= require feedshub/feeds\n"
            insert_into_file css_manifest, style_require_block, :after => "require_self\n"
          end
        else
          copy_file 'application.css', 'app/assets/stylesheets/application.css'
        end
      end

      def add_styles
        copy_file 'feeds.css', 'app/assets/stylesheets/feedshub/feeds.css'
      end

    end
  end
end