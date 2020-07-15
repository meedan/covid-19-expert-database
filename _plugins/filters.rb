module Jekyll
  module Utils
    # make clean website addresses
    def sanitize_url(url)
      # remove http https www.
      url = url.sub(/https?\:(\\\\|\/\/)(www.)?/,'')
      # remove trailing slash
      url = url.chop! if url.end_with? '/'
      return url
    end

    def pluck(object, attribute)
      object && object.has_key?(attribute) ? object[attribute] : ''
    end

    def uniq(objects, attribute)
      objects
        .select{ |o| o.has_key?(attribute) && o[attribute] }
        .map{ |o| o[attribute].split(/[,;]/).map{ |v| v.strip } }
        .flatten
        .uniq
        .sort
    end

    def split_better(text, separator = ',')
      require 'csv'
      text.nil? ? [] : (CSV.parse_line(text, { :col_sep => separator })&.map(&:strip) || [])
    end

    def convert_to_date(str)
      str ? Date.strptime(str, "%Y-%m-%d") : ''
    end

    def convert_to_date_mdy(str)
      str ? Date.strptime(str, "%m/%d/%Y") : ''
    end

  end
end

Liquid::Template.register_filter(Jekyll::Utils)
