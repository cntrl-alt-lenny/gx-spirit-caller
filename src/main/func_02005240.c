typedef struct {
    char pad[0x24];
    unsigned int f24;
} Arg_02005240;

extern int data_02102c7c[];
extern void func_02003400(void);
extern void func_02004ef4(Arg_02005240 *a0, int a1, int a2, int a3, int a4, int a5, void *fn);

void func_02005240(Arg_02005240 *a0, int a1, int a2, int a3, int a4, int a5) {
    data_02102c7c[4] = 0;
    data_02102c7c[2] = (a0->f24 << 11) >> 28;
    a0->f24 |= 0x10000;
    func_02004ef4(a0, a1, a2, a3, a4, a5, func_02003400);
}
