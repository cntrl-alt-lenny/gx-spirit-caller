/* func_ov002_021b3014: sibling of func_ov002_021b2f78 (mode 1). */
struct g3f4 { int f0; char _a[24]; int f28; };
extern struct g3f4 data_ov002_022cd314;
extern unsigned short data_ov002_022cd3e2[];
extern int func_ov002_021b2ddc(int a, int b, int c, int d, int e, int f);
void func_ov002_021b3014(int arg0, int arg1, int arg2) {
    int row = (arg0 == data_ov002_022cd314.f0 && arg1 == data_ov002_022cd314.f28) ? 0 : 1;
    unsigned short v = *(unsigned short *)((char *)data_ov002_022cd3e2 + row * 20);
    func_ov002_021b2ddc(arg0, v, arg2, 1, 0, 0);
}
