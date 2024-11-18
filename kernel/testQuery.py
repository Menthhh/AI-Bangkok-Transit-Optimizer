########################## this is only used to test prolog query ######################
    
from PrologTrainQuery import PrologTrainQuery as PTQ
from LookUpTable import LookUpTable

ptq = PTQ()
ptq.set_consult_file("./backend/train_sys_win.pl")
path, length, price, interchange = ptq.query_best_path("pp01", "a1")
print(path, length, price, interchange)

lut = LookUpTable()
