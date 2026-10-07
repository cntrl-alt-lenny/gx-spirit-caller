typedef struct {
    int w0;
    int w4;
    int w8;
    int wc;
    char pad10[4];
    int w14;
    int w18;
    char pad1c[0x68 - 0x1c];
    int w68;
    int w6c;
} State;

extern State data_0219ad48;
extern void func_0202cc8c(int a);
extern void func_0202c9c0(int a);
extern int func_02034784(void);

void func_0202c948(int a, int b) {
    data_0219ad48.w68 = a;
    data_0219ad48.w6c = b;
    func_0202cc8c(0);
    func_0202c9c0(0);
    data_0219ad48.w4 = -1;
    data_0219ad48.w18 = 0;
    data_0219ad48.w14 = 0;
    data_0219ad48.wc = func_02034784() != 0 ? 0xf0 : 0x100;
}
