#1.read text
#2.check+update
#3.find
#4.input figure


#!/usr/bin/python
# _*_ coding:utf-8 _*_
import re #正则表达库
import collections #词频表达库
import numpy as np #numpy数据处理库
import  jieba #分词
import wordcloud #词云展示库
from PIL import Image #图像处理库
import matplotlib.pyplot as plt #图像展示库

def check():
    #read the text
    read_text=input("Please put the txt into this locations(.txt):")
    fn_load=open(read_text,'r',encoding='utf-16')#open the text
    string_data=fn_load.read()#read the whole text
    fn_load.close()#close the text

    #check_update
    pattern=re.compile(u'\t|\n|\.|-|:|;|\)|\(|\?|"') #define the rules
    string_data=re.sub(pattern,'',string_data) #update the text

    #update all the un_word
    seg_list_exact=jieba.cut(string_data,cut_all=False) #percise the jieba's working
    object_list=[]
    remove_words=[u'的',u'，',u'和',u'是',u'随着',u'对于',u'对',u'等',u'能',u'都',u'。',u' ',u'、',u'中',u'在',u'了',u'通常',u'如果',u'我们',u'需要']#self define

    for word in seg_list_exact: #recycle to each words
        if word not in remove_words: #if not belong to the remove_words
            object_list.append(word) #append into the object_list

    #Statistic the words
    word_counts=collections.Counter(object_list) #Collect the words
    word_counts_tops=word_counts.most_common(10) #The highest of the words
    print(word_counts_tops) #output the words

    #show the Results
    imaginations=input("Please put the figure you want(.jpg):")
    mask=np.array(Image.open(imaginations)) #Define the backgrounds of the results
    #Set the background,fonts,words collections and the max size of the words.
    wc=wordcloud.WordCloud(font_path='C:\Windows\Fonts\simhei.ttf',mask=mask,max_words=200,max_font_size=100)

    wc.generate_from_frequencies(word_counts) #from the dictionary into the wordcloud
    image_colors=wordcloud.ImageColorGenerator(mask) #Set the color into the word sizes
    wc.recolor(color_func=image_colors) #Change the color into the background
    plt.imshow(wc) #show the wordcloud
    plt.axis('off') #close the axis
    plt.show() #show the image
if __name__ == "__main__":
    check()