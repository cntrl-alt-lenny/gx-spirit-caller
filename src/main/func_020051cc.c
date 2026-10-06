typedef struct {
    char pad[0x24];
    unsigned int f24;
} Arg_020051cc;

extern int data_02102c7c[];
extern void func_02003e98(void);
extern void func_020048c0(Arg_020051cc *a0, int a1, int a2, int a3, int a4, int a5, void *fn);

void func_020051cc(Arg_020051cc *a0, int a1, int a2, int a3, int a4, int a5) {
    data_02102c7c[2] = (a0->f24 << 11) >> 28;
    func_020048c0(a0, a1, a2, a3, a4, a5, func_02003e98);
}
