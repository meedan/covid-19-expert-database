module Jekyll
  module Algolia
    module Hooks
      def self.before_indexing_each(record, node, context)
        
        # if record[:Category]
        #   record[:categories] = record[:Category]
        #   record[:content_type] = 'question'
        # end
        # if record[:Topics]
        #   record[:topics] = record[:Topics]
        # end
        # if record[:Term]
        #   record[:content_type] = 'glossary'
        # end
        # record.delete(:'Background & context')
        record.delete(:content)
        record.delete(:'Other resources')
        record.delete(:html)
        record.delete(:Media)
        record.delete(:custom_js)
        record.delete(:'Item status')
        record.delete(:'Source of the question')
        record.delete(:'Country question was sourced from')
        record.delete(:'Glossary Terms')
        record.delete(:'Variation of the answer depending on country of residence')
        record.delete(:'Does this answer vary depending on your race, ethnicity, age, sex or other demographic factors?')
        record.delete(:'Expert Database (French)')
        record.delete(:'Expert Database (Hindi)')
        record.delete(:'Answer Assigned')
        record.delete(:'Context Assigned')
        record.delete(:slug)
        record.delete(:type)
        record.delete(:Subcategory)
        record.delete(:tags)
        record.delete(:'Last edited (simplified)')
        record.delete(:'Last edited (experts say)')

        # Do not send homepage
        return nil if record[:url] == '/'

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
