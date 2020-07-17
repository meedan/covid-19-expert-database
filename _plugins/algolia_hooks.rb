module Jekyll
  module Algolia
    module Hooks
      def self.before_indexing_each(record, node, context)
        if record[:Category]
          record[:categories] = record[:Category]
          record[:content_type] = 'question'
        end
        if record[:Topics]
          record[:topics] = record[:Topics]
        end
        if record[:Term]
          record[:content_type] = 'glossary'
        end

        record
      end

      def self.should_be_excluded?(filepath)
        # Do not index 
        return true if filepath =~ %r{/about/}
        return true if filepath =~ %r{ask-a-question}
        return true if filepath =~ %r{thanks}
        return true if filepath =~ %r{meet-our-experts}
        false
      end
      
    end
  end
end
