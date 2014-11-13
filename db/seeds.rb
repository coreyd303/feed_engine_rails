class Seed
  attr_reader :users_count, :trips_count, :users_per_trip

  def initialize(users_count = 100, trips_count = 50, users_per_trip = 5)
    @users_count    = users_count
    @trips_count    = trips_count
    @users_per_trip = users_per_trip
    generate_users
    generate_trips
    add_users_to_trips
    generate_resorts
  end

  def generate_users
    users_count.times do |i|
      user = User.create(name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
                         email: Faker::Internet.email,
                         twitter_username: twitter_handles.sample
                        )
    end
    puts "#{users_count} users created"
  end

  def generate_trips
    trips_count.times do |i|
      trip = Trip.create(name: Faker::Company.name,
                         description: Faker::Lorem.sentences.join,
                         date: Faker::Time.backward(rand(10), :morning),
                         trip_location: "Breckenridge",
                         resort_id: rand(18)
                        )
    end
    puts "#{trips_count} Trips created"
  end

  def add_users_to_trips
    users = User.all.length
    Trip.all.each do |trip|
      users_per_trip.times do
        user = User.find(rand(1..users))
        trip.users << user
      end
    end
    puts "#{users_per_trip} users added to each trip"
  end
end

  def generate_resorts
    resorts = Resort.create([
                             {name: "Arapahoe Basin", lat: 39.642676, lng: -105.871658 },
                             {name: "Aspen Mountain", lat: 39.187287, lng: -106.818593 },
                             {name: "Beaver Creek",   lat: 39.631847, lng: -106.523542 },
                             {name: "Breckenridge",   lat: 39.481768, lng: -106.036945 },
                             {name: "Buttermilk",     lat: 39.206246, lng: -106.860377 },
                             {name: "Copper",         lat: 39.500251, lng: -106.144332 },
                             {name: "Crested Butte",  lat: 38.885449, lng: -106.942348 },
                             {name: "Eldora",         lat: 39.936739, lng: -105.576462 },
                             {name: "Keystone",       lat: 39.603583, lng: -105.949677 },
                             {name: "Loveland",       lat: 39.680537, lng: -105.895963 },
                             {name: "Monarch",        lat: 38.512546, lng: -106.332155 },
                             {name: "Silverton",      lat: 37.885543, lng: -107.665690 },
                             {name: "Ski Cooper",     lat: 39.360583, lng: -106.300903 },
                             {name: "Snowmass",       lat: 39.214074, lng: -106.935502 },
                             {name: "Steamboat",      lat: 40.457358, lng: -106.804500 },
                             {name: "Telluride",      lat: 37.937477, lng: -107.812502 },
                             {name: "Vail",           lat: 39.606334, lng: -106.354945 },
                             {name: "Wolf Creek",     lat: 37.472120, lng: -106.793244 }
                           ])
    puts "18 resorts added"
  end

def twitter_handles
  %w(Kc_evilball
bsidemobi
StridingEdgeSB 
jksportskit
Snowboardly
youngteddi
joeflatt
SNSC
JukeSnow 
GinnyKoppenhol
SebToots
Snowpatriots
JohnniDweets
wilhelmashley 
MistAdventures 
rasjosh10
MistAdventures 
ITWPassport
OutdoorGearDOTD 
TimBesecker
Sportmondo
JohnniDweets 
angrysnowboard 
Meredith1Gareth 
IllrushClothing
OddportEmporium
arocwebdesigns
BibimLab 
FSTVSNOW
levisandmaier
ImpatientsSport
TheLoT1080
VernaeveK
JebigaDesign
ManoloNajera
transformgloves
Taz_Wilde
OutdoorGearDOTD
JohnniDweets
PerdueRyan
TheRocinante
Kontra_Apparel
Alexithymic_L
BanffDeals
Capita686
BlackbarryO_o
Fozz26
ShannonReports
EChristensen11
chelcnicole11
StPaulSnowboard
yes_snowboards
actionrideshop
MikkTol
ShannonReports
boardparadise
JohnniDweets
MattCrysler
KatieTsuyuki
pandagreens
Patrycia1986
ScottMartin_org
my5pillars
schel74
angrysnowboard
AdamGrisedale
Matt_Belair
pinkthor17
The_Blue_Life
GranbyRanch
maggiesueee
365Boarding
afsoutdoors
Dovgoteles
ajwegrz
OutdoorGearDOTD
FirstTracksMag
Worldwideinsure
ScottMartin_org
AnalogSnow
OWEsnowboarding
finishgangster
AdamRacine37
ButtaLtd
Severan
2cuteink
trnkaste
OZSnowboards
jkbodi
Adaptiveathlete
solsticesupply
MatejMaruka
cassie_rae7
TurntUpTommy34
WIBUCKETLIST
MatejMaruka
liftstudios
supdvni
BoardsportsCan
Snowboardly
sportisolkysten
ILoveGoGlove
tallman1880
hallerm22
11_Jordan_11
kimmath2
Foxhendo
buratravel
Viaggiando_nM
AlpineEthos
AdrenalineCo
FreethePowder
solsticesupply
Phil_Honeyman
AnthonyRiso
FindTransfers
theonerealdeezy
flippy_x
jmfoust
tweetlypics
InfernoMorzine
xtremevitoria
CeltekUK
redbullSUI
MrMeribel
solsticesupply
onboardmag
my5pillars
VladisDJi
ellharris
thegstreet_com
KristiansGizmo
Starma__
CheshHens_Stags
welovecheshire
IzzyCheshire)
end
Seed.new
