ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def lowercase?(char)
  char.downcase == char
end

def decipher(char)
  alpha = ("a".."z").to_a
  return char unless alpha.include?(char.downcase)
  result = alpha[alpha.index(char.downcase)-13]

  lowercase?(char) ? result : result.upcase
end

def decrypt(code) 
  code.chars.map { |char| decipher(char) }.join
end

ENCRYPTED_PIONEERS.each { |pioneer| puts decrypt(pioneer) }

# solution
=begin
  def decipher_character(encrypted_char)
    case encrypted_char
    when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
    when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
    else                         encrypted_char
    end
  end
=end