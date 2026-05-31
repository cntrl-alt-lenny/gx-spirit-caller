/* func_ov002_021b3f0c: pick row 0 if (arg0,arg1) matches the active
 * (cd3f4.f0, cd3f4.f28) pair else row 1, read cd4c2[row], run it through
 * func_ov002_021b3c10 with arg2, normalise 0/1. */
struct g3f4 { int f0; char _a[24]; int f28; };
extern struct g3f4 data_ov002_022cd3f4;
extern unsigned short data_ov002_022cd4c2[];
extern int func_ov002_021b3c10(int a, int b);
int func_ov002_021b3f0c(int arg0, int arg1, int arg2) {
    int row = (arg0 == data_ov002_022cd3f4.f0 && arg1 == data_ov002_022cd3f4.f28) ? 0 : 1;
    unsigned short v = *(unsigned short *)((char *)data_ov002_022cd4c2 + row * 20);
    return func_ov002_021b3c10(v, arg2) != 0;
}
