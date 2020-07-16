module Jekyll
  module Algolia
    module Hooks
      def self.before_indexing_each(record, node, context)
        if record[:Category]
          record[:categories] = record[:Category]
        end
        if record[:Topics]
          record[:topics] = record[:Topics]
        end

        record
      end
    end
  end
end
