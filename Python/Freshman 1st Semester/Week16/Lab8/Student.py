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