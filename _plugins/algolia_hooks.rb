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
        record.delete(:'EN What our experts say')
        record.delete(:'EN Background and context')
        record.delete(:'EN Background & context')
        record.delete(:'EN Glossary')
        record.delete(:'EN Other resources')
        record.delete(:'EN Variation of the answer depending on country of residence')
        record.delete(:'EN Source of the question')
        record.delete(:'EN Country question was sourced from')
        record.delete(:'EN Does this answer vary depending on your race, 
        ethnicity, age, sex or other demographic factors?')
        record.delete(:'EN Does this answer vary depending on your race, ethnicity, age, sex or other demographic factors?')
        record.delete(:'EN Subcategory')
        record.delete(:'EN Category')
        record.delete(:'EN Question')
        record.delete(:'DB (French)')
        record.delete(:'DB (Hindi)')
        record.delete(:'In translated DBs?')
        record.delete(:'DB (Telugu)')
        record.delete(:'DB (Spanish)')
        record.delete(:'DB (Arabic)')
        record.delete(:'DB Bengali)')
        record.delete(:'What our experts say wordcount')
        record.delete(:'Background and context wordcount')
        record.delete(:'Other resources wordcount')
        record.delete(:'Wordcount')
        record.delete(:'EN Topics')
        record.delete(:'Background last edited (Translation)')
        record.delete(:'Experts say last edited (translation)')
        record.delete(:'Media Package')
        record.delete(:'Last modified')
        

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
        return true if filepath =~ %r{share}
        return true if filepath =~ %r{blog}
        false
      end
      
    end
  end
end
