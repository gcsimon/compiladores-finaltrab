// To run with the test, use the following commands:
// $ make
// $ ./etapa1 < compiler_test.cpp

class Classe{
    public:
        int att_int;
        float att_float;
    private:
        char att_char;
        bool att_bool;
    protected:
        int att_int_2;
};

int main() {
    // Testes para identificadores
    int _ident = -1;
    bool ident_ = false;
    char 0error = 'a';
    int @error = 5;

    // Testes para int
    int a = 0;
    int b = -1;
    int c = +500;
    
    // Testes para float
    float d = 4.8;
    float d = +7.999;
    float f = -573.8695;
    float g = E5050977;
    float h = E+4985746;
    float i = e-5674694
    float error = 3.;
    float error2 = .5;

    // Testes para bool
    bool j = true;
    bool k = false;

    // Testes para char
    char l = '&';
    char error3 = 'abc';
    char* m = "abc";

    // Testes para caracteres especiais
    ,;:()[]{}+-|*<>/=!&%#^.$

    // Testes para operadores compostos
    if( a <= b
     || a >= b
     && a == b
     && a != b){
        a = a<<1;
        b = b >> 1;
    }

    // Teste para palavras reservadas ainda não citadas
    string str = "";
    if (true){
        const int n = 7;
    }
    else{
    }

    while(false){
    }
    for (int it=0; it<999; it=it+1){
        continue;
    }

    switch (a){
        case 0:
            a += 1;
            break;
        default:
            a -= 1;
            break;
    }

    static bool stc = false;


    // Teste para palavras reservadas que não existem no C
    end then input output foreach



    return 0;
}
