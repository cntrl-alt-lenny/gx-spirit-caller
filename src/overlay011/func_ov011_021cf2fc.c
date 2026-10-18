extern char *func_02018b94(void);
typedef struct {
    unsigned int pad[5];
    unsigned int a : 8;
    unsigned int unused14 : 24;
    unsigned int pad18;
    unsigned int unused1c : 8;
    unsigned int c : 8;
    unsigned int b : 5;
    unsigned int unused21 : 11;
} State;
void func_ov011_021cf2fc(int a, int b, int c) {
    ((State *)func_02018b94())->a = a;
    ((State *)func_02018b94())->b = b;
    ((State *)func_02018b94())->c = c;
}
