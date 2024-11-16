class LookUpTable:
    '''
    converts station actual name into station code name (or vice versa)
    '''
    def __init__(self):
        self.lookUpTable: dict = {
            "n24": "Khu Khot",
            "n23": "Yaek Kor Por Aor",

        }

        self.lookUpTableRev: dict = {v: k for k, v in self.lookUpTable.items()}
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
    
    def get_code_from_name(self, name: str) -> str:
        '''
        gets station code from station name

        @param code: the name of the station
        @return: the code of the station
        '''
        return self.getReverseLookUpTable()[name]