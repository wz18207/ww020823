#encoding:utf-8
#import sys
#import csv
import time
import bluetooth
from mindwavemobile.MindwaveDataPoints import RawDataPoint, PoorSignalLevelDataPoint,\
    AttentionDataPoint, MeditationDataPoint, BlinkDataPoint, EEGPowersDataPoint,\
    UnknownDataPoint
from mindwavemobile.MindwaveDataPointReader import MindwaveDataPointReader
import textwrap

import serial
ser = serial.Serial('/dev/ttyUSB0',115200,timeout=0.5)
#import RPi.GPIO 

# LED_PWM_SET
'''
RPi.GPIO.setmode(RPi.GPIO.BCM)
RPi.GPIO.setup(18,RPi.GPIO.OUT)

#pwm = RPi.GPIO.PWM(18,80)
#pwm.start(0)

RPi.GPIO.output(18,RPi.GPIO.LOW)
'''
if __name__ == '__main__':
    mindwaveDataPointReader = MindwaveDataPointReader()
    mindwaveDataPointReader.start()
    
    
    #out = open('blink_raw_csv.csv','wb')
    #csv_write = csv.writer(out,dialect='excel')
    time = 1
    i = 1
    temp = 0
    sign = 0
    before_pwm = 0
    attention_before = 0
    before_blind = 0
    
    if (mindwaveDataPointReader.isConnected()):
        print "collecting EEG data..."
        blind_value = 0
        temp = 0
        num = 0
        try:
            while(True):
                dataPoint = mindwaveDataPointReader.readNextDataPoint()
                if (dataPoint.__class__ is RawDataPoint):
               
             #      if sign == 1: #turn on or turn off
             #          if time % 10 == 0: # pwm out setting
             #              pwm.ChangeDutyCycle(before_pwm + value_pwm)
             #              before_pwm = before_pwm + value_pwm
              #     else:
              #         pwm.ChangeDutyCycle(0)  
                   
                   new_dataPoint = str(dataPoint) #setting data format
                   
                   rate = abs(abs(int(new_dataPoint[11:])) - temp)#rate of rawvalue_datapoint
                   temp = abs(int(new_dataPoint[11:]))
                   if rate > 100:
                       num += 1
      
                   if (time % 512) == 0: # if one second passed
                       print(i)
                       print("seconds passed...")
                       time = 1
                       i += 1
                   
                       if num > 10: #set blind value
                           blind_value = 1;
                       else:
                           blind_value = 0;
                       num = 0
                   
                   else:
                       time = time + 1
               #if i == 101:
               #   print"clecting over"
               #  sys.exit()
                           
                elif (dataPoint.__class__ is AttentionDataPoint):
                    new_dataPoint = str(dataPoint) #setting data format
                    attention_value = [new_dataPoint[17:]]
                
                elif (dataPoint.__class__ is MeditationDataPoint):
                    new_dataPoint = str(dataPoint) #setting data format
                    meditation_value = [new_dataPoint[18:]]
                
                elif (dataPoint.__class__ is PoorSignalLevelDataPoint):
                    new_dataPoint = str(dataPoint) #setting data format
                    poorsignallevel_value = [new_dataPoint[19:]]
                    
                    
                    if (blind_value == 1) & (before_blind == 0):  #setting pwm parameters
                        sign = ~sign;
                        print "led changed",blind_value,before_blind
                    
                    
                    
                        if sign == 0:
                        #value_pwm = (attention_value - attention_before)/50
                        #attenion_before = attention_value
                            ''' 
                            RPi.GPIO.output(18,RPi.GPIO.HIGH)
                            '''
                            ser.write('111')
                        else:
                            '''
                            RPi.GPIO.output(18,RPi.GPIO.LOW)
                            '''
                            ser.write('000')
                        
                    before_blind = blind_value
                        
                        
                        
              
 
        
                
                    print "poorsignallevel_value",poorsignallevel_value
                    print "meditation_value",meditation_value
                    print "attention_value",attention_value
                    print "blind_value",blind_value
                    
        except KeyboardInterrupt:
            pass
            ser.write('000')
        #pwm.stop()
        #RPi.GPIO.cleanup()
                                
 
    else:
        print(textwrap.dedent("""\
            Exiting because the program could not connect
            to the Mindwave Mobile device.""").replace("\n", " "))
        ser.write('000')
        #pwm.stop()
        #RPi.GPIO.cleanup()
        