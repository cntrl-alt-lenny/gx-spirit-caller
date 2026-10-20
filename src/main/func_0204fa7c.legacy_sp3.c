extern void *func_020498f0(void);
extern void func_0204f9cc(void);
typedef struct {
    unsigned char pad[0x24];
    int a[32];
    unsigned short b[40];
    int c[71];
    int d[32];
    unsigned short e[32];
    unsigned char f[32];
    unsigned int mask;
} State;
int func_0204fa7c(int index, int count) {
    int result;
    int i;
    if (!func_020498f0()) return 0;
    result = ((State *)func_020498f0())->c[index];
    ((State *)func_020498f0())->mask &= ~(1 << ((State *)func_020498f0())->f[index]);
    func_0204f9cc();
    if (index < count - 1) {
        for (i = 0; i < count - index - 1; i++) {
            ((State *)func_020498f0())->a[index + i] = ((State *)func_020498f0())->a[index + i + 1];
            ((State *)func_020498f0())->b[index + i] = ((State *)func_020498f0())->b[index + i + 1];
            ((State *)func_020498f0())->c[index + i] = ((State *)func_020498f0())->c[index + i + 1];
            ((State *)func_020498f0())->d[index + i] = ((State *)func_020498f0())->d[index + i + 1];
            ((State *)func_020498f0())->e[index + i] = ((State *)func_020498f0())->e[index + i + 1];
            ((State *)func_020498f0())->f[index + i] = ((State *)func_020498f0())->f[index + i + 1];
        }
    }
    if (count > 0) {
        ((State *)func_020498f0())->a[count-1] = 0;
        ((State *)func_020498f0())->b[count-1] = 0;
        ((State *)func_020498f0())->c[count-1] = 0;
        ((State *)func_020498f0())->d[count-1] = 0;
        ((State *)func_020498f0())->e[count-1] = 0;
        ((State *)func_020498f0())->f[count-1] = 0;
    }
    return result;
}
