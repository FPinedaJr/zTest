

def tokenize_expression(expression):
    expression = expression.replace(" ", "")

    tokens = []
    current_token_start = 0

    for i, symbol in enumerate(expression):
        if not symbol.isdigit():
            if current_token_start < i:
                tokens.append(expression[current_token_start:i])
            tokens.append(symbol)
            current_token_start = i + 1

    if current_token_start < len(expression):
        tokens.append(expression[current_token_start:])

    # print(tokens) #DEBUG
    return tokens


def get_precedence(op):
    precedences = {'+': 1, '-': 1, '*': 2, '/': 2, '^': 3}
    return precedences.get(op, 0)


def infix_to_postfix(tokens):
    output = []
    stack = []

    for token in tokens:
        if token.isdigit():
            output.append(token)
        elif token == '(':
            stack.append(token)
        elif token == ')':
            while stack and stack[-1] != '(':
                output.append(stack.pop())
            stack.pop() 
        else:
            while stack and get_precedence(stack[-1]) >= get_precedence(token):
                output.append(stack.pop())
            stack.append(token)

    while stack:
        output.append(stack.pop())

    # print(output)
    return output

def perform_pemdas(tokens):
    def do_op(left, op, right):
        match op:
            case '+': return left + right
            case '-': return left - right
            case '*': return left * right
            case '/': return left / right
            case '^': return left ** right

    stack = []
    while len(tokens) != 0:
        # print(f"stack: {stack}, token: {tokens[0]}") #DEBUG
        if tokens[0].isdigit():
            stack.append(tokens.pop(0))
        else:
            result = do_op(int(stack.pop(-2)), tokens[0], int(stack.pop(-1)))
            stack.append(str(int(result)))
            tokens.pop(0)

    # print(stack) #DEBUG
    return stack[0]


def pemdas_parser(expression):
    infix_expression = tokenize_expression(expression)
    postfix_expression = infix_to_postfix(infix_expression)
    result = perform_pemdas(postfix_expression)
    print(f"    {expression} = {result}")

if __name__ == "__main__":
    print("<<< PEMDAS CALCULATOR >>>")
    pemdas_parser("12 + (21 - 3) * 5")
    pemdas_parser("2^3 * (4 + 5)")
    pemdas_parser("15 * (6 + 2)")
    pemdas_parser("10 / 2 + (7 - 3)")
    pemdas_parser("(9 - 2) * 3 - 1")
    pemdas_parser("(8 + 2) / (6 - 1)")
    pemdas_parser("2 * (5 + 3) - 4")
    pemdas_parser("3 + 4 * (2 - 1)")
    pemdas_parser("(7 - 2^2) * 3 + 6")
    pemdas_parser("2^(2 + 1) + 4 * (5 - 2)")
    pemdas_parser("2^(3 + 1) + 6 / (4 - 1)")
    pemdas_parser("(2^3 * 4 + 4) / (6 - 2)")
