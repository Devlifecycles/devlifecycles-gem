require 'logger'

module Devlifecycles
  module UsesDevlifecycles
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def uses_devlifecycles(options={})
      end
    end

    def to_dlc
      key = self.id # REQUIRED
      if key.nil?
        raise "Unsaved record"
      end

      email ||= self.email
      created_at ||= self.created_at
      updated_at ||= self.updated_at
      last_sign_in_at ||= self.last_sign_in_at
      current_sign_in_at ||= self.current_sign_in_at
      obj = {
        :key => key,
        :email => email,
        :created_at => created_at,
        :updated_at => updated_at,
        :last_sign_in_at => last_sign_in_at,
        :current_sign_in_at => current_sign_in_at
      }
      obj
    end

    def sync_with_devlifecycles
      begin
        Devlifecycles.send_payload(to_dlc)
      rescue => e
        logger.error "[DLC ERROR] #{e}"
      end
    end
  end
end

ActiveRecord::Base.send :include, Devlifecycles::UsesDevlifecycles
