new{1}=[20 195 94 142 89 122 127 106 156 115 177 183 152 23 58 203 72 166 83];
new{2}=[71 85 61 15 69 175 138 196 9 48 173 157 97 24 100 123 91 186 110];
new{3}=[82 78 129 201 132 53 126 141 194 88 90 49 73 13 178 125 1 103 116];%
new{4}=[202 104 171 197 199 95 114 165 79 149 92 81 102 27 101 7 18 29 147];%
new{5}=[172 43 67 206 11 158 75 146 84 135 56 19 57 36 17 10 184 153 45];%
new{6}=[21 42 109 117 137 74 37 208 136 16 77 44 200 46 174 80 162 180 144];
new{7}=[209 22 8 50 62 120 34 143 169 63 170 55 193 134 119 190 163 198 113];
new{8}=[192 76 12 155 191 185 3 105 181 65 107 5 150 33 205 66 40 68 148];
new{9}=[133 182 96 70 168 164 167 189 112 145 207 4 131 35 14 111 26 28 179];
new{10}=[160 140 2 161 64 139 154 54 39 124 121 130 176 86 51 188 98 204 32];%
new{11}=[87 52 108 30 41 159 187 99 25 118 151 6 60 59 93 31 38 47 128];%
at=[];
    for j=1:19
            k=new{1,10}(j);
            k=k-1;
            if k<10
                t=strcat('00',int2str(k),'.bmp');
                at=[at imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件4\',t))];
            elseif k>=10 && k<100
                t=strcat('0',int2str(k),'.bmp');
                at=[at imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件4\',t))];
            else
                t=strcat(int2str(k),'.bmp');
                at=[at imread(strcat('E:\大学资料\2019年国赛数模\Text 2019.8.5\cumcm2013\B\附件4\',t))];
           j=j+1;
            end
    end
        b=[at(1:180,1:72),at(1:180,73:144),at(1:180,145:217),at(1:180,218:289),at(1:180,290:361),at(1:180,362:433),at(1:180,434:505),at(1:180,506:580),at(1:180,581:652),at(1:180,653:724),at(1:180,725:796),at(1:180,797:868),at(1:180,869:940),at(1:180,941:1012),at(1:180,1013:1083),at(1:180,1084:1156),at(1:180,1157:1228),at(1:180,1229:1300)];
       imshow(b)
        saveas(gcf,'10_1.bmp')