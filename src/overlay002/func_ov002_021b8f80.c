/* func_ov002_021b8f80: short-circuit chain of phase predicates for arg0. */
extern int func_ov002_021b3ecc(int a, int b, int c);
extern int func_ov002_021bd85c(int a, int b);
extern int func_020317e0(int a);
int func_ov002_021b8f80(int arg0) {
    if (func_ov002_021b3ecc(0, 11, 0x1407) != 0)
        return 1;
    if (func_ov002_021bd85c(arg0, -1) != 0)
        return 1;
    return func_020317e0(arg0);
}
