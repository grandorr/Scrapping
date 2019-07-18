require 'nokogiri'
require 'open-uri'


def first_name
page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
depute = page.xpath ('//a[contains(@href,"/deputes/fiche")]')

tab_namep_depute = []

depute.each do |name|
tab_namep_depute << name.text.split[1..-1].first
end
return tab_namep_depute
end
# Return un tableau qui contient le prénom des députés #



def second_name
page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
depute = page.xpath ('//a[contains(@href,"/deputes/fiche")]')
tab_namef_depute = []

depute.each do |name|
tab_namef_depute << name.text.split.last
end
return tab_namef_depute
end
#Return un tableau qui contient le nom de famille des députés#


def url
page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
depute = page.xpath ('//a[contains(@href,"/deputes/fiche")]')
tab_url_depute = []
depute.each do |name|
tab_url_depute << name["href"]
end
return tab_url_depute
end
# Return un tableau qui contient l'url de chaque députés sur le site assemblee-nationale.fr #



# Lance les méthodes du dessus et vas chercher l'email de chaque député sur leurs url ... #
# L'opération prend quelque minute ... # 
def final
	puts " Attention, chargement long... le programme termine à 500+"
tab_namef_depute = second_name
tab_namep_depute = first_name
tab_url_depute = url
count = 0
tab_mail_depute = []

tab_url_depute.each do |url|
	page1 = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr#{url}"))
	depute_mail = page1.xpath ('//html/body/div/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a')
	tab_mail_depute << depute_mail.text
	puts count += 1 
	if count == 100
		puts "Mais? vous êtes encore la ???"
	end
	if count == 200 
		puts " Hahaha je vous avez dit que c'est long ! "
	end
	if count == 350 
		puts " Sa sert a rien de regarder les nombres défilé, sa n'avance pas plus vite..."
	end
	if count == 500 
		puts " C'est toujours pas finis bordel????"
	end
end

n = 0
tab_final = []
# n = index #
tab_url_depute.each do 
	hash_final = {"first_name" => tab_namep_depute[n],"last_name" => tab_namef_depute[n],"email" => tab_mail_depute[n]}
	n += 1 
	tab_final << hash_final
end
#permet de crée un tableau qui contient des hash avec les valeurs des tableau crée par les méthode précédentes.#

puts tab_final

end



# J'ai mis un compteur pour simuler une barre de chargement, je crois qu'il vas jusqu'a 500 ...
# Patienter quelque minute ... # 
final

