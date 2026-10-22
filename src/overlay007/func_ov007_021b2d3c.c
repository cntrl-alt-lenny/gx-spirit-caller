extern void *func_020211c8(unsigned int *a0);
extern int func_0202147c(int *p);
extern int func_02022234(unsigned int idx, unsigned int v);
extern int func_0202224c(int idx);
extern int func_02037208(int a0, int r1, int r2, int r3);
extern int func_ov007_021b2cf8(int ctx, int idx1, int idx2);
extern int func_ov007_021b2e00(void *unused0, void *arg1, int arg2);
extern int func_ov007_021b2e84(int *ctx);
extern unsigned int data_020d0ef0[];

int func_ov007_021b2d3c(int *ctx) {
    void *slot;
    if (ctx[1] != 0) {
        if (func_ov007_021b2e84(ctx) != 0) {
            func_02037208(func_ov007_021b2cf8((int)ctx, ctx[4], ctx[5]), -1, 0, 1);
        }
        if (ctx[8] == 3 && ctx[7] != 0) {
            slot = func_020211c8(data_020d0ef0);
            func_0202147c(slot);
            func_ov007_021b2e00(ctx, slot, 0);
        } else if (ctx[8] == 10 && ctx[7] == 0) {
            func_02022234(0, func_0202224c(0) | 0x4000);
        }
        ctx[8]++;
    } else {
        ctx[8] = 0;
    }
    return 1;
}
