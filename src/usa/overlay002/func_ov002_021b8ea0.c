/* func_ov002_021b8ea0: short-circuit chain of phase predicates for arg0. */
extern int func_ov002_021b3dec(int a, int b, int c);
extern int func_ov002_021bd77c(int a, int b);
extern int func_0203178c(int a);
int func_ov002_021b8ea0(int arg0) {
    if (func_ov002_021b3dec(0, 11, 0x1407) != 0)
        return 1;
    if (func_ov002_021bd77c(arg0, -1) != 0)
        return 1;
    return func_0203178c(arg0);
}
