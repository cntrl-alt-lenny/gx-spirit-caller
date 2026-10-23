typedef struct { unsigned int low:8; unsigned int layers:5; unsigned int high:19; } DisplayControl;
typedef unsigned short u16;
extern char data_ov010_021b8d08[];
extern char data_ov010_021b8d44[];
extern void func_0208c884(u16 *a0, int a1);
extern int func_020b3870(int a, int b);
extern int func_ov010_021b6514(void);
extern int func_ov010_021b8514(void);
int func_ov010_021b3ea0(void) {
    unsigned int reg = 0x04000000;
    char *d = data_ov010_021b8d44;
    int ret = 0;
    int v;
    v = *(int *)(data_ov010_021b8d08 + 0xa0) - 0x1000;
    *(int *)(data_ov010_021b8d08 + 0xa0) = v;
    if (v < 0) *(int *)(d + 0x64) = 0;
    v = func_020b3870(-(*(int *)(d + 0x64) << 4), *(int *)(d + 0x68));
    func_0208c884((u16 *)0x0400006c, -16 - v);
    if (*(int *)(d + 0x64) == 0) {
        v = *(unsigned int *)reg;
        v &= ~0x1f00;
        *(unsigned int *)reg = v;
        func_0208c884((u16 *)(reg + 0x6c), -16);
        ret = 1;
    }
    switch (*(int *)d) {
    case 1: func_ov010_021b6514(); break;
    case 2: func_ov010_021b8514(); break;
    case 3: break;
    }
    return ret;
}








