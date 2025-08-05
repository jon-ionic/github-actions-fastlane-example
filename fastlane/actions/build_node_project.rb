module Fastlane
  module Actions
    class BuildNodeProjectAction < Action
      def self.run(params)
        platform = lane_context[SharedValues::DEFAULT_PLATFORM]
        puts("Platform: #{platform}}")
        sh("npm", "run", "build")
        
        if [:ios, :android].include?(platform)
          sh("npx", "cap", "sync", platform.to_s)
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
