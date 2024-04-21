def tokenize_expression(equation: str):
    equation = equation.replace(" ", "") + '/'

    digit = ""
    tokens = []
    for symbol in equation:
        if symbol.isdigit():
            digit += symbol
        elif not symbol.isdigit():
            tokens.append((digit)) if digit != "" else None
            tokens.append(symbol)
            digit = ""
        if symbol == '/':
            tokens.pop()
    return tokens



def main():
    print(tokenize_expression("12 + (21 - 3) * 5"))

if __name__ == "__main__":
    main()