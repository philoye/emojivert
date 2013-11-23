require 'active_support/core_ext/object/blank'
require 'emojivert/version'
require 'emojivert/mappings'

module Emojivert
  class << self

    def docomo_to_unified(text)
      emoji_convert(text, 'docomo_to_unified')
    end
    def kddi_to_unified(text)
      emoji_convert(text, 'kddi_to_unified')
    end
    def softbank_to_unified(text)
      emoji_convert(text, 'softbank_to_unified')
    end
    def google_to_unified(text)
      emoji_convert(text, 'google_to_unified')
    end

    # functions to convert unified data into an outgoing format

    def unified_to_docomo(text)
      emoji_convert(text, 'unified_to_docomo')
    end
    def unified_to_kddi(text)
      emoji_convert(text, 'unified_to_kddi')
    end
    def unified_to_softbank(text)
      emoji_convert(text, 'unified_to_softbank')
    end
    def unified_to_google(text)
      emoji_convert(text, 'unified_to_google')
    end
    def unified_to_html(text)
      emoji_convert(text, 'unified_to_html')
    end
    def html_to_unified(text)
      emoji_convert(text, 'html_to_unified')
    end

    def unified_to_name(unified_cp)
      EMOJI_MAPS['unified_to_name'][unified_cp] ? EMOJI_MAPS['unified_to_name'][unified_cp] : '?'
    end
    def name_to_unified(name)
      EMOJI_MAPS['name_to_unified'][name] ? EMOJI_MAPS['name_to_unified'][name] : '?'
    end

    private

    def emoji_convert(text, char_map)
      ret_str = text
      if text.present? and char_map.present?
        EMOJI_MAPS[char_map].each do |k, v|
          k = k.unpack('U*').pack('U*')
          v = v.unpack('U*').pack('U*')
          ret_str.gsub!(k, v)
        end
      end
      ret_str
    end

  end

end

