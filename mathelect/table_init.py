def print_table(array_2d):
    for arr in array_2d:
        print(arr)

def initialize_table(supply, demand, costs):
    dimension = len(supply)
    
    table = [[0 for i in range(dimension)] for i in range(dimension)]
    s_index = 0
    d_index = 0
    
    while s_index < dimension and d_index < dimension:
        value = min(supply[s_index], demand[d_index])
        
        table[s_index][d_index] = value
        
        supply[s_index] -= value
        demand[d_index] -= value
        
        if supply[s_index] == 0:
            s_index += 1
        if demand[d_index] == 0:
            d_index += 1
    
    return table

supply = [158, 184, 176]
demand = [174, 204, 143]
costs = [
    [4, 8, 8],
    [16, 24, 16],
    [8, 16, 24]
]
values = [
    [158, 0, 0],
    [16, 168, 0],
    [0, 36, 140]
]

# supply = [174, 204, 143]
# demand = [158, 184, 176]
# costs = [
#     [4, 8, 8],
#     [16, 24, 16],
#     [8, 16, 24]
# ]

print_table(initialize_table(supply, demand, costs))
