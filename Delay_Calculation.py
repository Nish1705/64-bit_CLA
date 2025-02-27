file = open('Data.txt','r')

data =file.read()


data=data.split(" \n ")
data = " ".join(data)
data = data.split(" ")
time_list = []
carry_list = []

for item in data:
    if item.startswith('Time='):
        time_list.append(int(item.split('=')[1]))
    elif item.startswith('Carry='):
        carry_list.append(item.split('=')[1])

#rint("Time List:", time_list)
#print("Carry List:", carry_list)
#print(data)
pointer=0
for i in range(len(time_list)):
    if(time_list[i]>500):
        pointer= i
        break
carry_list = (carry_list[pointer-1::])
time_list = time_list[pointer-1::]
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

# Your previous code ...

Carry_Delay = [0] * 64  # Initialize the Carry_Delay list with zeros

for i in range(1, len(hex_carry_list)):
    x = int(hex_carry_list[i], 2) - int(hex_carry_list[i - 1], 2)
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

# Your previous code ...

# Create a DataFrame from Carry_Delay
df = pd.DataFrame({'Carry_Delay': Carry_Delay})

# Create a Pandas Excel writer using xlsxwriter as the engine
writer = pd.ExcelWriter('Table_Assignment1.xlsx', engine='xlsxwriter')

# Write the DataFrame to the Excel file, starting from Row 4, Column C
df.to_excel(writer, sheet_name='Sheet1', startrow=3, startcol=2, index=False)

# Get the xlsxwriter workbook and worksheet objects
workbook = writer.book
worksheet = writer.sheets['Sheet1']

# Add any additional formatting as needed
# For example, you can set the column width like this:
worksheet.set_column('C:C', 15)  # Adjust the column width as needed

# Close the Pandas Excel writer and save the Excel file
writer.save()
