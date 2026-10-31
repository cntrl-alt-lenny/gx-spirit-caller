typedef unsigned short u16;
typedef struct {
    unsigned int n0, n1, n2;
    u16 a0[0x50];
    u16 a1[0xf];
    u16 a2[0x1f];
} Out;
typedef struct {
    unsigned int pad0;
    unsigned int mode:3;
    unsigned int rest:29;
    char pad8[0xaf8];
    unsigned char saved;
} State;
extern State data_02104f4c;
extern Out data_02105a68;
extern char data_020c59c4[];
extern char data_02105a4d[];
extern int func_0202adf8(int a0);
extern void func_0202ae1c(int arg0);
extern void func_0202c070(int unused0);
extern int func_02011b9c(Out *out, int id);
extern char *func_0202c0c0(int id);
extern char *func_020aadf8(char *dst, const char *src);
extern void func_0202ba94(int arg0, int arg1);
extern void func_0202c1ac(void);
extern void func_0202af40(void);
void func_020138b8(void) {
    int buffer[15];
    unsigned int i;
    Out *out;
    func_0202adf8((int)buffer);
    func_0202ae1c(data_02104f4c.mode);
    func_0202c070(data_02104f4c.mode);
    func_02011b9c(&data_02105a68, (int)data_020c59c4);
    func_020aadf8(data_02105a4d, func_0202c0c0(0x29));
    out = &data_02105a68;
    data_02104f4c.saved = data_02104f4c.mode;
    for (i = 0; i < out->n0; i++) {
        func_0202ba94(out->a0[i], 1);
    }
    func_0202c1ac();
    func_0202af40();
}

