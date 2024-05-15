def remove_zeros(data):
    return {coord: value for coord, value in data.items() if value != 0}

# Example usage:
data = {(0, 0): 0, (0, 1): 158, (0, 2): 0, (1, 0): 41, (1, 1): 0, (1, 2): 143, (2, 0): 133, (2, 1): 46, (2, 2): 0}
non_zero_data = remove_zeros(data)
print(non_zero_data)