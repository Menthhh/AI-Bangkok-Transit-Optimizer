import subprocess
class PrologTrainQuery:
    def __init__(self):
        self.consult_file = "train_sys.pl"

    def set_consult_file(self, file_path: str):
        '''
        sets the target consult file for prolog.

        @param file_path: the file path to the prolog consult file
        '''
        self.consult_file = file_path

    def __query(self, query: str) -> tuple[list, int, int]: 
        '''
        function for querying from prolog, not to be used outside of class

        @param query: query string
        '''
        # Run the Prolog process
        process = subprocess.run(
            ["swipl", "-s", self.consult_file, "-g", query, "-t", "halt"],
            capture_output=True,
            text=True
        )

        # Capture and parse the output
        output = process.stdout.strip()
        if output:
        # output format is [Path] Length Fare
            path_str, length_str, fare_str, interchange_str = output.rsplit(' ', 3)
            path = path_str.strip("[]").split(',')  
            length = int(length_str)
            fare = int(fare_str)
            interchange = int(interchange_str)
            return path, length, fare, interchange
        else:
            return None, None, None, None
    
    def query_fastest_path(self, station1: str, station2: str, bts_card: str, mrt_card: str) -> tuple[list, int, int, int]:
        '''
        returns the path, length, fare of the shortest path between 2 stations

        @param station1: code name of starting station
        @param station2: code name of goal station

        @return: returns path, length, fare (in tuple)
        @raise keyError: raises an exception if wrong station name
        '''
        query_str = f"fastest_path({station1}, {station2}, Path, Length, Fare, {bts_card}, {mrt_card}), write(Path), write(' '), write(Length), write(' '), write(Fare), write(' '), write(1), nl."

        path, length, fare, interchange = self.__query(query_str)

        if path:
            return path, length, fare, interchange
        else:
            raise KeyError("wrong station names")
    
    def query_cheapest_path(self, station1: str, station2: str, bts_card: str, mrt_card: str) -> tuple[list, int, int, int]:
        '''
        returns the path, length, fare of the cheapest path between 2 stations

        @param station1: code name of starting station
        @param station2: code name of goal station

        @return: returns path, length, fare (in tuple)
        @raise keyError: raises an exception if wrong station name
        '''

        
        query_str = f"cheapest_path({station1}, {station2}, Path, Length, Fare, {bts_card}, {mrt_card}), write(Path), write(' '), write(Length), write(' '), write(Fare), write(' '), write(1), nl."
        print(query_str)
        path, length, fare, interchange = self.__query(query_str)

        if path:
            return path, length, fare, interchange
        else:
            raise KeyError("wrong station names")
        
    def query_best_path(self, station1: str, station2: str, bts_card: str, mrt_card: str):
        ### to be implemented
        '''
        returns the path, length, fare of the cheapest and shortest path between 2 stations

        @param station1: code name of starting station
        @param station2: code name of goal station

        @return: returns path, length, fare (in tuple)
        @raise keyError: raises an exception if wrong station name
        '''
        query_str = f"best_path({station1}, {station2}, Path, Length, Fare, {bts_card}, {mrt_card}), write(Path), write(' '), write(Length), write(' '), write(Fare), write(' '), write(1), nl."

        
        path, length, fare, interchange = self.__query(query_str)

        if path:
            return path, length, fare, interchange
        else:
            raise KeyError("wrong station names")

