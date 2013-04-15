module Devlifecycles
  module UsesDevlifecycles
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def uses_devlifecycles(options={})
      end
    end

    def sync_with_devlifecycles
      key = self.id # REQUIRED
      if key.nil?
        raise "Cannot sync unsaved records."
      end
      email ||= self.email
      created_at ||= self.created_at
      updated_at ||= self.updated_at

      obj = {:key => key, :email => email, :created_at => created_at, :updated_at => updated_at}
      Devlifecycles.send_payload(obj)
    end
  end
end

ActiveRecord::Base.send :include, Devlifecycles::UsesDevlifecycles
