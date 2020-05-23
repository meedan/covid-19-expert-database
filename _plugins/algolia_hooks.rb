module Jekyll
  module Algolia
    module Hooks
      def self.before_indexing_each(record, node, context)
        if record[:Category]
          record[:categories] = Jekyll::Utils::split_better(record[:Category])
        end
        if record[:Tag]
          record[:tags] = Jekyll::Utils::split_better(record[:Tag])
        end

        record
      end
    end
  end
end
