extern void func_02006110(int *out_a, int *out_b);
extern unsigned int func_0200617c(void);
extern unsigned int func_02006194(void);
extern int func_02022234(unsigned int idx, unsigned int v);
extern int func_02037208(int a0, int a1, int a2, int a3);
extern int func_ov006_021caea8(char *self);

int func_ov006_021cac38(char *self) {
    int x, y;
    int dx, dy, sx, sy;
    if (*(int *)(self + 8) == 0) return 1;
    if (func_0200617c()) {
        func_02037208(0x84, -1, 0, 1);
        *(int *)(self + 8) = 0;
        return 1;
    }
    if (func_02006194()) {
        func_02006110(&x, &y);
        dx = x - *(int *)(self + 0x24);
        sx = -(*(int *)(self + 0x10) + dx);
        dy = y - *(int *)(self + 0x28);
        sy = -(*(int *)(self + 0x14) + dy);
        *(volatile unsigned int *)0x04001018 =
            (sx & 0x1ff) | ((sy << 16) & 0x01ff0000);
        func_02022234(6, dx);
        func_02022234(7, dy);
    }
    if (*(int *)(self + 0xc)) {
        func_ov006_021caea8(self);
        *(int *)(self + 0xc) = 0;
    }
    return 0;
}

