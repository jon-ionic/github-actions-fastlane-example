module Fastlane
  module Actions
    class BuildNodeProjectAction < Action
      def self.run(params)
        sh("npm", "run", "build")

        platform = lane_context[SharedValues::DEFAULT_PLATFORM]
        
        if [:ios, :android].include?(platform)
          begin
            sh("npx", "cap", "sync", platform.to_s, "--deployment")
          rescue StandardError
            UI.important "Failed to run cap sync with deployment flag, attempting without"
            sh("npx", "cap", "sync", platform.to_s)
          end
        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'Builds web project with Node'
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
