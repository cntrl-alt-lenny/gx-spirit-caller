extern int func_0202b4f4(int, unsigned short *);
extern void func_020a97b8(void *, int, int, void *);
extern unsigned short func_02005a60(void *, unsigned short, int, void *);
extern int func_ov006_021b843c(void *, int, int);
extern unsigned short func_ov006_021b8f88(char *, int);
extern int func_ov006_021b7240(void *, int, int, unsigned short, int);
extern int func_ov006_021b7bb0(char *, int);
extern int func_ov006_021b9c88(unsigned short *, unsigned short *);

int func_ov006_021b8e4c(char *self, int arg, int test, int update)
{
    int i;
    if (test) {
        *(int *)(self + 0xca94) = func_0202b4f4(arg, 0) != 0;
        return 1;
    }
    *(int *)(self + 0xca94) = func_0202b4f4(arg, *(unsigned short **)(self + 0xca90));
    func_020a97b8(*(unsigned short **)(self + 0xca90), *(int *)(self + 0xca94), 2, func_ov006_021b9c88);
    *(int *)(self + 0xca94) = func_02005a60(*(unsigned short **)(self + 0xca90), (unsigned short)*(int *)(self + 0xca94), 2, func_ov006_021b9c88);
    if (update) {
        func_ov006_021b843c(self, 4, 0);
        for (i = 0; i < *(int *)(self + 0xca94); i++) {
            if (i >= 64) break;
            func_ov006_021b7240(self, 4, -1, func_ov006_021b8f88(self, i), 1);
        }
        *(unsigned short *)(self + 0x8168) = *(int *)(self + 0xca94);
        *(unsigned short *)(self + 0x8172) = *(int *)(self + 0xca94);
        func_ov006_021b7bb0(self, 4);
    }
    return 1;
}
