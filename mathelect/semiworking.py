from pulp import *


Branch = ['A', 'B', 'C']
Warehouse = [1,2,3]


supply = {'A' : 158, 'B' : 184, 'C' : 179}
demand = {1 : 174, 2 : 204, 3 : 143}

cost = {'A': {1:4,  2:8,  3:8},
        'B': {1:16, 2:24, 3:16},
        'C': {1:8,  2:16, 3:24},
       }



# Setting Problem 
prob = LpProblem("Transportation", LpMinimize)
routes =[(i,j) for i in Branch for j in Warehouse]

# Defining Decision Variables
amount_vars = LpVariable.dicts("Amountship",(Branch,Warehouse),0)

# Defining Objective Function
prob += lpSum(amount_vars[i][j]*cost[i][j] for (i,j) in routes)

# Constraints
for j in Warehouse:
    prob += lpSum(amount_vars[i][j] for i in Branch) == demand[j]

for i in Branch:
    prob += lpSum(amount_vars[i][j] for j in Warehouse) <= supply[i]

prob.solve()

print(f"Status: {LpStatus[prob.status]}")

for v in prob.variables():
    if v.varValue > 0:
        print(f"Warehouse {v.name[-1]} to Branch {v.name[-3]} = {v.varValue}")


print(f"Minimum Cost = {value(prob.objective)}")