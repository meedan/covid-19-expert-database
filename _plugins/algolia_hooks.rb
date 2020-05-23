module Jekyll
  module Algolia
    module Hooks
      def self.before_indexing_each(record, node, context)
        if record[:Category]
          record[:categories] = record[:Category].split(",").map(&:strip)
        end
        if record[:Tag]
          record[:tags] = record[:Tag].split(",").map(&:strip)
        end

        record
      end
    end
  end
end
