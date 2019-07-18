require 'nokogiri'
require 'open-uri'
page = Nokogiri::HTML(open("https://coinmarketcap.com/"))
# Prend en compte la page coinmarketcap #

def tab_pricee
page = Nokogiri::HTML(open("https://coinmarketcap.com/"))
# Prend en compte la page coinmarketcap #
all_emails_links = page.xpath('//a[contains(@class,"price")]')

tab_price = []
all_emails_links.each do |email_link|
tab_price << email_link.text.upcase
end 
return tab_price
end
# Return un array contenant le prix des crypto #

def namee
page = Nokogiri::HTML(open("https://coinmarketcap.com/"))
# Prend en compte la page coinmarketcap # 
all_name_links = page.xpath('//a[contains(@class,"currency-name-container link-secondary")]')
tab_crypto = []
tab = []
all_name_links.each do |name_link|
tab_crypto << name_link.text
end
return tab_crypto
end
# Return un array contenant le nom des crypto #



#Creation du hash pour contenir les deux tableau, tab_crypto en value et tab_price en key #
def hash_make
tab_price = tab_pricee
tab_crypto = namee
puts tab_price
hash = {}
hash = tab_crypto.zip(tab_price).to_h
hash_tab = []
hash.each do |mini_hash|
hash1 = {}
hash1 = {mini_hash[0] => mini_hash[1]}
hash_tab << hash1
end
return hash_tab
end
# Return le array contenant plusieur hash ... # 


def program

final_array = hash_make
puts final_array
end

program




