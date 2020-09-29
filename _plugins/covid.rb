module Jekyll
  module Covid
    # Given a text, highlight glossary terms
    def glossarify(text, term_ids)
      return text if !term_ids

      # Collect the terms.
      terms = term_ids
        .collect{ |id|
          [
            Jekyll.sites[0].data['covid19']['glossary-en'].select{ |t| t['id'] == id }.collect{ |t| t.merge({ 'path' => '' }) },
            Jekyll.sites[0].data['covid19']['glossary-fr'].select{ |t| t['id'] == id }.collect{ |t| t.merge({ 'path' => '/fr' }) },
            Jekyll.sites[0].data['covid19']['glossary-hi'].select{ |t| t['id'] == id }.collect{ |t| t.merge({ 'path' => '/hi' }) },
            Jekyll.sites[0].data['covid19']['glossary-te'].select{ |t| t['id'] == id }.collect{ |t| t.merge({ 'path' => '/te' }) },
            Jekyll.sites[0].data['covid19']['glossary-es'].select{ |t| t['id'] == id }.collect{ |t| t.merge({ 'path' => '/es' }) },
            Jekyll.sites[0].data['covid19']['glossary-pt'].select{ |t| t['id'] == id }.collect{ |t| t.merge({ 'path' => '/pt' }) },
            Jekyll.sites[0].data['covid19']['glossary-ar'].select{ |t| t['id'] == id }.collect{ |t| t.merge({ 'path' => '/ar' }) },
            Jekyll.sites[0].data['covid19']['glossary-bn'].select{ |t| t['id'] == id }.collect{ |t| t.merge({ 'path' => '/bn' }) },
          ]
        }
        .flatten
        .uniq

      # Enclose the terms within some special HTML.
      # Do it in 2 passes to avoid replacing terms inside other term definitions.
      terms.each{ |t|
        text.gsub!(t['Term'], t['id'])
      }

      terms.each{ |t|
        definition = t['Definition']&.chomp&.strip&.gsub('"', '&quot;')
        replacement = <<~GLOSSARY
          <a
            data-tippy-content="<h6>#{t['Term']}</h6>#{definition}"
            href="#{t['path']}/glossary/##{t['id']}"
            class="glossary-term"
          >#{t['Term']}</a>
        GLOSSARY
        text.gsub!(t['id'], replacement.chomp)
      }

      text
    end
  end
end

Liquid::Template.register_filter(Jekyll::Covid)
