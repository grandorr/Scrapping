require 'nokogiri'
require 'open-uri'


def name
html_ciotat = "/13/la-ciotat.html"
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{html_ciotat}"))
name_mairie = page.xpath('//h1')
tab_name = []
name_mairie.each do |name|
tab_name << name.text
end
return tab_name[1]
end
# Trouve le nom de la mairie de la ciotat .. #


def mail 
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/13/la-ciotat.html"))
mail_mairie = page.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
tab_mail = []
mail_mairie.each do |mail|
tab_mail << mail.text
end
return tab_mail
end
# Trouve le mail de la mairie de la ciotat #




def html 
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/bouches-du-rhone.html"))
html_13 = page.xpath ('//a[contains(@href,"13")]')
tab_html = []
html_13.each do |html|
tab_html << html["href"][1..-1]
end
return tab_html
end
#return un tableau qui contient les url de chaque mairie #



def mail_all_13
count = 0
tab_13_all_mail = []
tab_html_13 = html
tab_html_13.each do |html_13|
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{html_13}"))
	mail_mairie_13 = page.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
	tab_13_all_mail << mail_mairie_13.text
	count += 1
	puts count
end
puts " Mail is ok .... do name now "
return tab_13_all_mail
end
#return un tableau qui contient le mail des mairie du 13 #


def name_all_13
count = 0
tab_13_all_name = []
tab_html_13 = html
tab_html_13.each do |html_13|
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{html_13}"))
	name_mairie_13 = page.xpath('//html/body/div/main/section[1]/div/div/div/h1')
	tab_13_all_name << name_mairie_13.text
	count += 1 
	puts count
end
puts " Name is ok ... now go hash "
return tab_13_all_name
end
# Return un tableau qui contient les noms des mairies du 13 #



# Permet de faire un tableau qui contient plusieur hash avec les méthode mail_all_13 et name_all_13 #
def make_hash
mail_all = mail_all_13
name_all = name_all_13
hash = {}
hash = name_all.zip(mail_all).to_h
hash_tab = []
hash.each do |mini_hash|
hash1 = {}
hash1 = {mini_hash[0] => mini_hash[1]}
hash_tab << hash1
end
puts hash_tab
end

# lance le programme qui affiche ville & mail  #
# Cela peut prendre un peu de temps... #
make_hash


#name 
#mail


