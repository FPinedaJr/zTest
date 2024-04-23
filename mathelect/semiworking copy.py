from pulp import *

Branch = [1, 2, 3]
Warehouse = ['A', 'B', 'C']

supply = {1: 158, 2: 184, 3: 179}
demand = {'A': 174, 'B': 204, 'C': 143}

cost = {1: {'A': 4,  'B': 8,  'C': 8},
        2: {'A': 16, 'B': 24, 'C': 16},
        3: {'A': 8,  'B': 16, 'C': 24},
        }

prob = LpProblem("Transportation", LpMinimize)
routes = [(i, j) for i in Branch for j in Warehouse]

amount_vars = LpVariable.dicts("Amountship", (Branch, Warehouse), 0)

prob += lpSum(amount_vars[i][j] * cost[i][j] for (i, j) in routes)

for j in Warehouse:
    prob += lpSum(amount_vars[i][j] for i in Branch) == demand[j]

for i in Branch:
    prob += lpSum(amount_vars[i][j] for j in Warehouse) <= supply[i]

prob.solve()

print(f"Status: {LpStatus[prob.status]}")

for i in Branch:
    for j in Warehouse:
        var = amount_vars[i][j]
        if var.varValue > 0:
            print(f"Plant {i} to Project {j} = {var.varValue}")

print(f"Minimum Cost = {value(prob.objective)}")
