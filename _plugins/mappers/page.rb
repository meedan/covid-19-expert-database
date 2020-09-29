class PageMapper < ::Jekyll::Contentful::Mappers::Base

    def map

      require 'date'

      result = super

      entry.sys.each do |k, v|
        name, value = map_field k, v
        result['sys'][name] = value
      end

      if result['slug']
        result['slug'] = result['slug']['en-US']
      end


      if result['title']['fr']
        result['title-fr'] = result['title']['fr']
      end

      if result['title']['hi']
        result['title-hi'] = result['title']['hi']
      end

      if result['title']['te']
        result['title-te'] = result['title']['te']
      end

      if result['title']['es']
        result['title-es'] = result['title']['es']
      end

      if result['title']['en-US']
        result['title-en'] = result['title']['en-US']
        result['title'] = result['title']['en-US']
      end

      if result['description']
        if result['description']['en-US']
            result['description-en'] = result['description']['en-US']
        end
        if result['description']['fr']
            result['description-fr'] = result['description']['fr']
        end
        if result['description']['hi']
            result['description-hi'] = result['description']['hi']
        end
        if result['description']['te']
          result['description-te'] = result['description']['te']
        end
        if result['description']['es']
          result['description-es'] = result['description']['es']
        end
        result['description'] = result['description']['en-US']
      end

      result
    end
  end