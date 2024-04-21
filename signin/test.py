def menu():
    print("__MAIN MENU__ ")
    print("  --- select --- ")
    print("      [1] distribution of overall ratings")
    print("      [2] count of recommended vs. not recommended")
    print("      [3] pie chart for the distribution of airline reviews")
    print("      [4] box plot for the distribution of value for money ratings")
    print("      [5] scatter plot of overall rating vs. inflight entertainment rating")
    print("      [6] bar plot of average overall rating by airline")
    print("      [7] pie chart for the distribution of recommended by verification status")
    print("      [8] stacked bar plot for the count of recommended vs. not recommended by verification status")
    print("      [9] line plot of the count of reviews over time")
    print("      [10] bar plot for the count of reviews by recommended status")
    print("      [0] exit")

menu()
option = int(input("Enter selected option: "))

while option != 0:
  if option == 1:
    print()
    print('1 ')
  elif option == 2:
    print()
    print('2 ')
  elif option == 3:
    print()
    print('3 ')
  elif option == 4:
    print()
    print('4 ')
  elif option == 5:
    print()
    print('5 ')
  elif option == 6:
    print()
    print('6 ')
  elif option == 7:
    print()
    print('7 ')
  elif option == 8:
    print()
    print('8 ')
  elif option == 9:
    print()
    print('9 ')
  elif option == 10:
    print()
    print('10 ')
  else:
    print("Invalid Option!")

  print()
  menu()
  selected = int(input("Enter selected option: "))

print("Thanks for using this program")