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
      obj = {:key => self.id, :email => self.email, :created_at => self.created_at, :updated_at => self.updated_at}
      "not implemented (but built object: #{obj})"
    end
  end
end

ActiveRecord::Base.send :include, Devlifecycles::UsesDevlifecycles
