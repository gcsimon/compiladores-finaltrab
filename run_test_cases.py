import os;

test_files = os.listdir("etapa2-testcases")
os.system("make clean")
os.system("make")


testcaseserrados = 0

for filename in test_files:
    result = os.system("./etapa2< etapa2-testcases/{} > /dev/null".format(filename))

    file = open("etapa2-testcases/"+ filename, mode='r')
    content = file. read()

    if(content.startswith("//CORRECT")):
        if (result != 0):
            print("o arquivo {} devia ter sido lido como correto".format(filename))
            testcaseserrados = testcaseserrados + 1
    else:
        if (result == 0):
            print("o arquivo {} nao deveria estar correto".format(filename))
            testcaseserrados = testcaseserrados + 1
    
print("\n numero de testes errados: {}".format(testcaseserrados))

