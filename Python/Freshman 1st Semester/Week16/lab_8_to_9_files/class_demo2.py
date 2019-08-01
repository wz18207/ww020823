#******************************************************************************#
#                                                                              #
#                              class_demo2.py                                  #
#                                                                              #
# Show how to create and use a simple class. This version uses properties to   #
# ensure position of staff member has a valid value.                           #
#                                                                              #
#******************************************************************************#

# To run this program, start Python and then type:
# from class_demo2 import Staff
# office_staff1 = Staff( 'Basic', 'Juan', 0 )
# etc.

#-------------------------------------------------------------------------------
#
# Class Staff.
# __init__ is called whenever an instance of the class is created. Here, it
# initialises three variables.
#
# There are three instance variables, _position, name and pay. 'self' refers to
# instance itself. It is optional to have an __init__.
#
# Underscore '_' in _position indicates we should not change it directly.
#
# __str__, if included, returns a string representing the class. Here, it
# includes the values of position, name, pay.
#
# calculate_pay is a method to calculate the pay of a person. The
# argument 'self' allows us to refer to name and pay which are defined in
# __init__. hourly_rate is a local variable for the method so it is not
# prefixed with 'self.'.

class Staff:

    def __init__( self, p_position, p_name, p_pay ):

        self._position = p_position
        self.name = p_name
        self.pay = p_pay
        print( 'Creating Staff object' )

    def __str__( self ):

        return( 'Position = %s, Name = %s, Pay = %d' %
        ( self._position, self.name, self.pay ) )

    def calculate_pay( self ):

        prompt = '\nEnter number of hours worked for %s: ' % ( self.name )
        hours = input( prompt )
        prompt2 = '\nEnter the hourly rate for %s in yuan: ' % ( self.name )
        hourly_rate = input( prompt2 )
        self.pay = int( hours ) * int( hourly_rate )
        return( self.pay )

    @property # This 'decorator' changes position method to a property
    def position( self ):

        print( 'Getter method' )
        return( self._position )

    @position.setter # This 'decorator' causes position method to be used
                     # when property 'position' is updated
    def position( self, value ):

        if value == 'Manager' or value == 'Basic':
            self._position = value

        else:
            print( 'Position is invalid. No changes made.' )
