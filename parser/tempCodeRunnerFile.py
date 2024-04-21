

def tokenize_expression(equation: str):
    equation = equation.replace(" ", "")

    tokens = []
    current_token_start = 0

    for i, symbol in enumerate(equation):
        if not symbol.isdigit():
            if current_token_start < i:
                tokens.append(equation[current_token_start:i])
            tokens.append(symbol)
            current_token_start = i + 1

    if current_token_start < len(equation):
        tokens.append(equation[current_token_start:])

    # print(tokens) #DEBUG
    return tokens


def get_precedence(op):
    precedences = {'+': 1, '-': 1, '*': 2, '/': 2, '^': 3}
    return precedences.get(op, 0)


def infix_to_postfix(tokens):
    output = []
    stack = []

    for token in tokens:
        if token.isnumeric():
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
    print(tokens)
    print(tokens.pop(0))
    print(tokens)
    stack = []

    




expression = "12 + (21 - 3) * 5"
infix_expression = tokenize_expression(expression)
postfix_expression = infix_to_postfix(infix_expression)
perform_pemdas(postfix_expression)
