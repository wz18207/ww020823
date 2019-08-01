#Lab 5: For take the line from the text and read in a line.
def read_file_as_string(d):
#To let the variable read as a string
    d = input("The file you want to read(please input *.* at the end of the name):")

    import linecache
    a = str(linecache.getline(d,1))
    b = str(linecache.getline(d,2))
    c = [a,b]
    print(c)


#Lab 6: To read the line from the txt and get them in a dictionary.
def dict_xian_info():
#To Let all lines in txt and take them into a dictionary.
    import linecache

    line = linecache.getline("xian_info.txt", 1)
    line = line.strip("\n")
    a = [(str("country"),line)]
    a = dict(a)

    l = linecache.getline("xian_info.txt", 2)
    l = l.strip("\n")
    b = [(str("population"),int(l))]
    b = dict(b)

    i = linecache.getline("xian_info.txt",3)
    i = i.strip("\n")
    i = i.split(" ")
    s = [(str("universities"),i)]
    s = dict(s)

    n = ()
    n = linecache.getline("xian_info.txt",4)
    n = n.strip("\n")

    d = [(str("location"),n)]
    d = dict(d)

    e = linecache.getline("xian_info.txt",5)
    e = e.strip("\n")
    e = e.split(" ")
    e = list(map(int, e))

    x = [(str("temperature"),e)]
    x = dict(x)

    info = {}
    info.update(a)
    info.update(b)
    info.update(s)
    info.update(d)
    info.update(x)
    print("xian_info=%s" %(info))
#Lab 7: For the range in the two sentence you have give.
#Lab 7: And check with ASCII in lens.
def check_ASCII():
    a = input("The first list you have to check:")
    b = input("THe second list you want to check:")
    a = a.encode("ASCII")
    b = b.encode("ASCII")
    a_1 = len(a)
    b_1 = len(b)
    min(a_1,b_1)
    for i in range(0,min(a_1,b_1)):
        if a_1 < b_1: print("True")
        else: print("False")
#Lab 8: Check the student's scores in this pages.
class Student:
    
    def __init__ (self,p_surname,p_given_name,p_id,p_results):
        
        self.surename = p_surname
        self.given_name = p_given_name
        self.id = p_id
        self._results = p_results
        print( 'Creating Student object' )
    
    def calc_marks(self,text_name1):
        assignment_1 = self._results[text_name1]['assignment1']
        assignment_2 = self._results[text_name1]['assignment2']
        progress_test = self._results[text_name1]['prog_test']
        final_exam = self._results[text_name1]['final_exam']
        score = 0.2*assignment_1+0.2*assignment_2+0.1*progress_test+0.5*final_exam
        print(score)
#lab9: For the factorial calculation and the incestgation calls.
def factoral(n):
    result = n;
    if n == 0:return( 1 ) 
    else:return( n * factorial( n - 1 ) ) 
def factoral_1(n):
    print('factoral called with argument',n)
    if n == 0:return( 1 ) 
    else:return( n * factorial( n - 1 ) ) 



    
