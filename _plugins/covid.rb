module Jekyll
  module Covid
    # Given a text, highlight glossary terms
    def glossarify(text, term_ids)
      return text if !term_ids

      # Collect the terms
      terms = term_ids
        .collect{ |id|
          [
            Jekyll.sites[0].data['covid19']['glossary-en'].select{ |t| t['id'] == id },
            Jekyll.sites[0].data['covid19']['glossary-fr'].select{ |t| t['id'] == id },
            Jekyll.sites[0].data['covid19']['glossary-hi'].select{ |t| t['id'] == id }
          ]
        }
        .flatten

      # Enclose the terms within some special HTML.
      terms.each{ |t| text.gsub!(t['Term'], "<a data-tippy-content=\"<h6>#{t['Term']}</h6>#{t['Definition']}\" href=\"/glossary/##{t['id']}\" class=\"glossary-term\">#{t['Term']}</a>") }

      text
    end
  end
end

Liquid::Template.register_filter(Jekyll::Covid)
