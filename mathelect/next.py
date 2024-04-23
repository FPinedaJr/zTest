def optimize_table(supply, demand, costs, values):
    cost = 0
    for i in values:
        for j in values:
            cost += values[i][j] * costs[i][j]

    

def find_loop(backward_positions, start_position):
    # This function searches for a loop starting from a given position (start_position) 
    # in a graph represented by backward_positions. It returns the loop if found,
    # otherwise, it returns None.

    def search_path(current_path):
        # If the current path has more than 3 nodes and the start position is the only 
        # possible next node, then it's a potential loop.
        if len(current_path) > 3:
            can_close_loop = len(possible_next_nodes(current_path, [start_position])) == 1
            if can_close_loop:
                return current_path
        
        # Get the nodes that haven't been visited yet
        unvisited_nodes = list(set(backward_positions) - set(current_path))
        
        # Get the possible next nodes from the current path
        next_nodes = possible_next_nodes(current_path, unvisited_nodes)
        
        # Iterate through possible next nodes
        for next_node in next_nodes:
            # Recursively call search_path to extend the path
            new_path = search_path(current_path + [next_node])
            # If a loop is found, return it
            if new_path:
                return new_path
    
    # Start the search for loop from the initial position (start_position)
    return search_path([start_position])


# Helper function to get possible next nodes from a given path
def possible_next_nodes(path, unvisited_nodes):
    # In a real implementation, this function would compute the possible
    # next nodes based on the graph structure. Here, it simply returns 
    # the unvisited nodes, but you can replace it with actual logic.
    return unvisited_nodes



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