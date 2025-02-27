file = open('Sum.txt','r')

data =file.read()


data=data.split("\n")
data = " ".join(data)
data = data.split(" ")
time_list = []
carry_list = []

print(data)
for i in range(len(data)):
    if(i%2==0):
        time_list.append(int(data[i]))
    else:
        carry_list.append((data[i]))

print("Time List:", time_list)
print("Carry List:", carry_list)
#print(data)
pointer=0
# for i in range(len(time_list)):
#     if(time_list[i]>500):
#         pointer= i
#         break
# carry_list = (carry_list[pointer-1::])
# time_list = time_list[pointer-1::]
print(len(time_list),len(carry_list))
hex_carry_list = [bin(int(carry, 2))[2:] for carry in carry_list]

#print(hex_carry_list)
# Carry_Delay = [0]*64
# for i in range(1,len(hex_carry_list)-1):

#     x = (int(hex_carry_list[i]))- (int(hex_carry_list[i-1]))
#     place = 0
#     while(x>0):
        
#         if(x&1==1):
#             Carry_Delay[place] = time_list[i]-500
#         x=x>>1

#         place+=1

# print(Carry_Delay)


Carry_Delay = [0] * 64  

for i in range(1, len(hex_carry_list)):
    x = ~int(hex_carry_list[i], 2) - ~int(hex_carry_list[i - 1], 2)
    print(x)
    place = 0
    while x > 0:
        if x & 1 == 1:
            if place < len(Carry_Delay):  # Check if place is within the bounds
                Carry_Delay[place] = time_list[i] - 500
        x = x >> 1
        
        place += 1
    print(place)

print((Carry_Delay))
import pandas as pd


df = pd.DataFrame({'Carry_Delay': Carry_Delay})

writer = pd.ExcelWriter('Table_Assignment1.xlsx', engine='xlsxwriter')


df.to_excel(writer, sheet_name='Sheet1', startrow=3, startcol=5, index=False)

workbook = writer.book
worksheet = writer.sheets['Sheet1']


worksheet.set_column('C:C', 15)  

writer.save()
