import webbrowser

class LookUpTable:
    '''
    converts station actual name into station code name (or vice versa)
    '''
    def __init__(self):
        self.lookUpTable: dict = {
            # light green: BTS
            "n24": "Khu Khot",
            "n23": "Yaek Kor Por Aor",
            "n22": "Royal Thai Air Force Museum",
            "n21": "Bhumibol Adulyadej Hospital",
            "n20": "Saphan Mai",
            "n19": "Sai Yud",
            "n18": "Phahon Yothin 59",
            "n17": "Wat Phra Sri Mahathat",
            "n16": "11th Infantry Regiment",
            "n15": "Bang Bua",
            "n14": "Royal Forest Department",
            "n13": "Kasetsart University",
            "n12": "Sena Nikhom",
            "n11": "Ratchayothin",
            "n10": "Phahon Yothin 24",
            "n9": "Ha Yaek Lat Phrao",
            "n8": "Mo Chit",
            "n7": "Saphan Khwai",
            "n6": "Sena Ruam",
            "n5": "Ari",
            "n4": "Sanam Pao",
            "n3": "Victory Monument",
            "n2": "Phaya Thai",
            "n1": "Ratchathewi",
            "cen_lg": "Siam",
            "e1": "Chit Lom",
            "e2": "Phloen Chit",
            "e3": "Nana",
            "e4": "Asok",
            "e5": "Phrom Phong",
            "e6": "Thong Lo",
            "e7": "Ekkamai",
            "e8": "Phra Khanong",
            "e9": "On Nut",
            "e10": "Bang Chak",
            "e11": "Punnawithi",
            "e12": "Udom Suk",
            "e13": "Bang Na",
            "e14": "Bearing",
            "e15": "Samrong",
            "e16": "Pu Chao",
            "e17": "Chang Erawan",
            "e18": "Royal Thai Naval Academy",
            "e19": "Pak Nam",
            "e20": "Srinagarindra",
            "e21": "Phraek Sa",
            "e22": "Sai Luat",
            "e23": "Kheha",
            # dark green: BTS
            "w1": "National Stadium",
            "cen_dg": "Siam",
            "s1": "Ratchadamri",
            "s2": "Sala Daeng",
            "s3": "Chong Nonsi",
            "s4": "Saint Louis",
            "s5": "Surasak",
            "s6": "Saphan Taksin",
            "s7": "Krung Thon Buri",
            "s8": "Wongwian Yai",
            "s9": "Pho Nimit",
            "s10": "Talat Phlu",
            "s11": "Wutthakat",
            "s12": "Bang Wa",
            # gold: BTS
            "g1": "Krung Thon Buri",
            "g2": "Charoen Nakhon",
            "g3": "Khlong San",
            # blue: MRT
            "bl01": "Tha Phra",
            "bl02": "Charan 13",
            "bl03": "Fai Chai",
            "bl04": "Bang Khun Non",
            "bl05": "Bang Yi Khan",
            "bl06": "Sirindhorn",
            "bl07": "Bang Phlat",
            "bl08": "Bang O",
            "bl09": "Bang Pho",
            "bl10": "Tao Poon",
            "bl11": "Bang Sue",
            "bl12": "Kamphaeng Phet",
            "bl13": "Chatuchak Park",
            "bl14": "Phahon Yothin",
            "bl15": "Lat Phrao",
            "bl16": "Ratchadaphisek",
            "bl17": "Sutthisan",
            "bl18": "Huai Khwang",
            "bl19": "Thailand Cultural Centre",
            "bl20": "Phra Ram 9",
            "bl21": "Phetchaburi",
            "bl22": "Sukhumvit",
            "bl23": "Queen Sirikit National Convention Centre",
            "bl24": "Khlong Toei",
            "bl25": "Lumpini",
            "bl26": "Si Lom",
            "bl27": "Sam Yan",
            "bl28": "Hua Lamphong",
            "bl29": "Wat Mangkon",
            "bl30": "Sam Yot",
            "bl31": "Sanam Chai",
            "bl32": "Itsaraphap",
            "bl33": "Bang Phai",
            "bl34": "Bang Wa",
            "bl35": "Phetkasem 48",
            "bl36": "Phasi Charoen",
            "bl37": "Bang Khae",
            "bl38": "Lak Song",
            # purple: MRT
            "pp01": "Khlong Bang Phai",
            "pp02": "Talad Bang Yai",
            "pp03": "Sam Yaek Bang Yai",
            "pp04": "Bang Phlu",
            "pp05": "Bang Rak Yai",
            "pp06": "Bang Rak Noi Tha It",
            "pp07": "Sai Ma",
            "pp08": "Phra Nang Klao Bridge",
            "pp09": "Yaek Nonthaburi 1",
            "pp10": "Bang Krasor",
            "pp11": "Nonthaburi Civic Center",
            "pp12": "Ministry of Public Health",
            "pp13": "Yaek Tiwanon",
            "pp14": "Wong Sawang",
            "pp15": "Bang Son",
            "pp16": "Tao Poon",
            # yellow: MRT
            "yl01": "Lat Phrao",
            "yl02": "Phawana",
            "yl03": "Chok Chai 4",
            "yl04": "Lat Phrao 71",
            "yl05": "Lat Phrao 83",
            "yl06": "Mahat Thai",
            "yl07": "Lat Phrao 101",
            "yl08": "Bang Kapi",
            "yl09": "Yaek Lam Sali",
            "yl10": "Sri Kritha",
            "yl11": "Hua Mak",
            "yl12": "Kalantan",
            "yl13": "Si Nut",
            "yl14": "Srinagarindra 38",
            "yl15": "Suan Luang Rami IX",
            "yl16": "Si Udom",
            "yl17": "Si Lam",
            "yl18": "Si La Salle",
            "yl19": "Si Dan",
            "yl20": "Si Thepha",
            "yl21": "Thipphawan",
            "yl22": "Samrong",
            # pink: MRT
            "pk01": "Nonthaburi Civic Center",
            "pk02": "Khae Rai",
            "pk03": "Sanambin Nam",
            "pk04": "Samakkhi",
            "pk05": "Royal Irrigation Department",
            "pk06": "Yaek Pak Kret",
            "pk07": "Pak Kret Bypass",
            "pk08": "Chaeng Watthana Pak Kret 28",
            "pk09": "Si Rat",
            "pk10": "Muang Thong Thani",
            "pk11": "Chaeng Watthana 14",
            "pk12": "Government Complex",
            "pk13": "National Telecom",
            "pk14": "Lak Si",
            "pk15": "Rajabhat Phranakhon",
            "pk16": "Wat Phra Sri Mahathat",
            "pk17": "Ram Inthra 3",
            "pk18": "Lat Pla Khao",
            "pk19": "Ram Inthra Kor Mor 4",
            "pk20": "Maiyalap",
            "pk21": "Vacharaphol",
            "pk22": "Ram Inthra Kor Mor 6",
            "pk23": "Khu Bon",
            "pk24": "Ram Inthra Kor Mor 9",
            "pk25": "Outer Ring Road Ram Inthra",
            "pk26": "Nopparat",
            "pk27": "Bang Chan",
            "pk28": "Setthabutbamphen",
            "pk29": "Min Buri Market",
            "pk30": "Min Buri",
            "mt01": "Impact Muang Thong Thani",
            "mt02": "Lake Muang Thong Thani",
            # airport rail link
            "a1": "Suvarnabhumi",
            "a2": "Lat Krabang",
            "a3": "Ban Thap Chang",
            "a4": "Hua Mak",
            "a5": "Ramkhamhaeng",
            "a6": "Makkasan",
            "a7": "Ratchaparop",
            "a8": "Phaya Thai",
            # dark red
            "rn01": "Bang Sue",
            "rn02": "Chatuchak",
            "rn03": "Wat Samian Nari",
            "rn04": "Bang Khen",
            "rn05": "Thung Song Hong",
            "rn06": "Lak Si",
            "rn07": "Kan Kheha",
            "rn08": "Don Mueang",
            "rn09": "Lak Hok",
            "rn10": "Rangsit",
            # light red
            "rw02": "Bang Son",
            "rw05": "Bang Bamru",
            "rw06": "Taling Chan",
        }
        

        #look up table but reversed
        self.lookUpTableRev: dict = {v: k for k, v in self.lookUpTable.items()}

        # station coords to be used in canvas
        self.station_coords = {
            # light green: BTS
            "n24": (1310, 465),
            "n23": (1210 ,565),
            "n22": (1210, 635),
            "n21": (1210, 705),
            "n20": (1210, 775),
            "n19": (1210, 845),
            "n18": (1210, 910),
            "n17": (1210, 980),
            "n16": (1210, 1060),
            "n15": (1210, 1120),
            "n14": (1210, 1175),
            "n13": (1210, 1245),
            "n12": (1210, 1305),
            "n11": (1210, 1360),
            "n10": (1210, 1430),
            "n9": (1210, 1505),
            "n8": (1210, 1595),
            "n7": (1210, 1640),
            "n6": (1210, 1667),
            "n5": (1210, 1695),
            "n4": (1210, 1735),
            "n3": (1210, 1785),
            "n2": (1208, 1830),
            "n1": (1210, 1940),
            "cen_lg": (1220, 2000),
            "e1": (1290, 2010),
            "e2": (1350, 2010),
            "e3": (1410, 2010),
            "e4": (1470, 2020),     
            "e5": (1530, 2010),
            "e6": (1585, 2025),
            "e7": (1630, 2070),
            "e8": (1670, 2115),
            "e9": (1710, 2150),
            "e10": (1750, 2190),
            "e11": (1760, 2240),
            "e12": (1760, 2295),
            "e13": (1760, 2345),
            "e14": (1760, 2395),
            "e15": (1758, 2463),
            "e16": (1760, 2535),
            "e17": (1760, 2600),
            "e18": (1760, 2655),
            "e19": (1760, 2710),
            "e20": (1760, 2765),
            "e21": (1760, 2820),
            "e22": (1760, 2875),    
            "e23": (1795, 2945),
            # dark green: BTS
            "w1": (1150, 2025),
            "cen_dg": (1230, 2030),
            "s1": (0, 0),
            "s2": (0, 0),
            "s3": (0, 0),
            "s4": (0, 0),
            "s5": (0, 0),
            "s6": (0, 0),
            "s7": (0, 0),
            "s8": (0, 0),
            "s9": (0, 0),
            "s10": (0, 0),
            "s11": (0, 0),
            "s12": (0, 0),
            # gold: BTS
            "g1": (975, 2250),
            "g2": (1030, 2290),
            "g3": (1035, 2350),
            # blue: MRT
            "bl01": (700, 2215),
            "bl02": (700, 2130),
            "bl03": (700, 2065),
            "bl04": (700, 1985),
            "bl05": (700, 1915),
            "bl06": (700, 1855),
            "bl07": (705, 1795),
            "bl08": (750, 1750),
            "bl09": (812, 1685),
            "bl10": (905, 1645),
            "bl11": (1040, 1655),
            "bl12": (1135, 1645),
            "bl13": (1185, 1595),
            "bl14": (1230, 1525),
            "bl15": (1313, 1525),
            "bl16": (1360, 1555),
            "bl17": (1400, 1600),
            "bl18": (1440, 1640),
            "bl19": (1483, 1710),
            "bl20": (1485, 1780),
            "bl21": (1485, 1865),
            "bl22": (1487, 1995),
            "bl23": (1485, 2090),
            "bl24": (1430, 2135),
            "bl25": (1330, 2135),
            "bl26": (1230, 2135),
            "bl27": (1150, 2135),
            "bl28": (1060, 2135),
            "bl29": (980, 2135),
            "bl30": (882, 2135),
            "bl31": (830, 2185),
            "bl32": (754, 2215),
            "bl33": (620, 2215),
            "bl34": (535, 2215),
            "bl35": (455, 2215),
            "bl36": (370, 2215),
            "bl37": (280, 2215),
            "bl38": (195, 2215),
            # purple: MRT
            "pp01": (145, 1180),
            "pp02": (145, 1245),
            "pp03": (165, 1315),
            "pp04": (230, 1315),
            "pp05": (290, 1315),
            "pp06": (350, 1315),
            "pp07": (420, 1315),
            "pp08": (522, 1315),
            "pp09": (615, 1315),
            "pp10": (680, 1315),
            "pp11": (740, 1315),
            "pp12": (830, 1365),
            "pp13": (885, 1420),
            "pp14": (895, 1490),
            "pp15": (893, 1595),
            "pp16": (893, 1660),
            # yellow: MRT
            "yl01": (1310, 1500),
            "yl02": (0, 0),
            "yl03": (0, 0),
            "yl04": (0, 0),
            "yl05": (0, 0),
            "yl06": (0, 0),
            "yl07": (0, 0),
            "yl08": (0, 0),
            "yl09": (0, 0),
            "yl10": (0, 0),
            "yl11": (0, 0),
            "yl12": (0, 0),
            "yl13": (0, 0),
            "yl14": (0, 0),
            "yl15": (0, 0),
            "yl16": (0, 0),
            "yl17": (0, 0),
            "yl18": (0, 0),
            "yl19": (0, 0),
            "yl20": (0, 0),
            "yl21": (0, 0),
            "yl22": (0, 0),
            # pink: MRT
            "pk01": (760, 1300),
            "pk02": (0, 0),
            "pk03": (0, 0),
            "pk04": (0, 0),
            "pk05": (0, 0),
            "pk06": (0, 0),
            "pk07": (0, 0),
            "pk08": (0, 0),
            "pk09": (0, 0),
            "pk10": (0, 0),
            "pk11": (0, 0),
            "pk12": (0, 0),
            "pk13": (0, 0),
            "pk14": (0, 0),
            "pk15": (0, 0),
            "pk16": (0, 0),
            "pk17": (0, 0),
            "pk18": (0, 0),
            "pk19": (0, 0),
            "pk20": (0, 0),
            "pk21": (0, 0),
            "pk22": (0, 0),
            "pk23": (0, 0),
            "pk24": (0, 0),
            "pk25": (0, 0),
            "pk26": (0, 0),
            "pk27": (0, 0),
            "pk28": (0, 0),
            "pk29": (0, 0),
            "pk30": (0, 0),
            "mt01": (0, 0),
            "mt02": (0, 0),
            # airport rail link
            "a1": (2305, 1950),
            "a2": (2270, 1850),
            "a3": (2120, 1850),
            "a4": (1985, 1850),
            "a5": (1730, 1850),
            "a6": (1470, 1850),
            "a7": (1345, 1850),
            "a8": (1225, 1850),
            # dark red
            "rn01": (1065, 1655),
            "rn02": (1052, 1500),
            "rn03": (1052, 1380),
            "rn04": (1052, 1235),
            "rn05": (1052, 1105),
            "rn06": (1055, 975),
            "rn07": (1052, 840),
            "rn08": (1052, 700),
            "rn09": (1052, 525),
            "rn10": (1052, 370),
            # light red
            "rw02": (910, 1575),
            "rw05": (615, 1740),
            "rw06": (405, 1820),
        }

    def getLookUpTable(self) -> dict[str: str]:
        return self.lookUpTable
    
    def getReverseLookUpTable(self) -> dict[str: str]:
        return self.lookUpTableRev

    def get_name_from_code(self, code: str) -> str:
        '''
        gets station name from station code

        @param code: the code of the station
        @return: the name of the station
        '''
        return self.getLookUpTable()[code]
    
    def get_name_from_codes_list(self, codes: list[str]) -> list[str]:
        names = []
        for code in codes:
            names.append(self.get_name_from_code(code))
        return names
    
    def get_code_from_name(self, name: str) -> str:
        '''
        gets station code from station name

        @param code: the code of the station
        @return: the name of the station
        '''
        return self.getReverseLookUpTable()[name]
    
    def get_lightgreen_stations(self) -> dict[str: str]:
        return {k : v for k, v in self.lookUpTable.items() if k.startswith("n") or k.startswith("cen_lg") or k.startswith("e")}
    
    def get_darkgreen_stations(self) -> dict[str: str]:
        return {k : v for k, v in self.lookUpTable.items() if k.startswith("w") or k.startswith("cen_dg") or k.startswith("s")}
    
    def get_gold_stations(self) -> dict[str: str]:
        return {k : v for k, v in self.lookUpTable.items() if k.startswith("g")}
    
    def get_blue_stations(self) -> dict[str: str]:
        return {k : v for k, v in self.lookUpTable.items() if k.startswith("bl")}
    
    def get_purple_stations(self) -> dict[str: str]:
        return {k : v for k, v in self.lookUpTable.items() if k.startswith("pp")}
    
    def get_yellow_stations(self) -> dict[str: str]:
        return {k : v for k, v in self.lookUpTable.items() if k.startswith("yl")}
    
    def get_pink_stations(self) -> dict[str: str]:
        return {k : v for k, v in self.lookUpTable.items() if k.startswith("pk") or k.startswith("mt")}
    
    def get_airport_stations(self) -> dict[str: str]:
        return {k : v for k, v in self.lookUpTable.items() if k.startswith("a")}
    
    def get_darkred_stations(self) -> dict[str: str]:
        return {k : v for k, v in self.lookUpTable.items() if k.startswith("rn")}
    
    def get_lightred_stations(self) -> dict[str: str]:
        return {k : v for k, v in self.lookUpTable.items() if k.startswith("rw")}
    
    def get_line_from_code(self, code: str) -> str:
        if code.startswith("n") or code.startswith("cen_lg") or code.startswith("e"):
            return "BTS Light Green"
        elif code.startswith("w") or code.startswith("cen_dg") or code.startswith("s"):
            return "BTS Dark Green"
        elif code.startswith("g"):
            return "BTS Gold"
        elif code.startswith("bl"):
            return "MRT Blue"
        elif code.startswith("pp"):
            return "MRT Purple"
        elif code.startswith("yl"):
            return "MRT Yellow"
        elif code.startswith("pk") or code.startswith("mt"):
            return "MRT Pink"
        elif code.startswith("a"):
            return "Airport Rail Link"
        elif code.startswith("rn"):
            return "SRT Dark Red"
        elif code.startswith("rw"):
            return "SRT Light Red"
    
    def check_interchange(self, path, index):
        if index == 0:
            return False
        current = self.get_line_from_code(path[index])
        previous = self.get_line_from_code(path[index - 1])

        if current != previous:
            return True
        else:
            return False
    
    def open_google_maps_with_stops(self, path):
        base_url = "https://www.google.com/maps/dir/?api=1"
        travel_mode = "transit"
        transit_mode = "rail"
        action = "navigate"  # Forces navigation recalculation
        
        path_names = self.get_name_from_codes_list(path)
        start = path_names[0] + " station"
        destination = path_names[-1] + " station"
        url = f"{base_url}&origin={start}&destination={destination}&travelmode={travel_mode}&transit_mode={transit_mode}&dir_action={action}"
        if len(path_names) > 2:
            stops = []
            for path_name in path_names:
                stops.append(path_name + " station")
            waypoints = "|".join(stops[1:-1])
            url += f"&waypoints={waypoints}"
        
        print(url)
        webbrowser.open(url)

    def get_canvas_info(self):
        # {"Station A": {"coords": (100, 200), "line": "Light Green"},
        #     "Station B": {"coords": (200, 250), "line": "Light Green"},
        #     "Station C": {"coords": (300, 150), "line": "Dark Green"},
        #     "Station D": {"coords": (400, 300), "line": "Blue"},}

        station_data = {}
        for code, name in self.lookUpTable.items():
            line = self.get_line_from_code(code)
            coords = self.station_coords.get(code, (0, 0))  # Default to (0, 0) if not found
            station_data[code] = {"name": name, "coords": coords, "line": line}
        return station_data