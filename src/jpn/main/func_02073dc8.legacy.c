/* func_02073dc8: probe-then-default. Return func_02073df0(a0) when it is
 * non-zero (keeping a0), else the global default. STYLE-A: the orig epilogue
 * is `pop {r4,lr}; bx lr` -> legacy mwcc 1.2/sp2p3 (.legacy.c), not 2.0. */
extern int data_0219ee18;
extern int func_02073df0(int);

int func_02073dc8(int a0) {
    if (func_02073df0(a0)) return a0;
    return data_0219ee18;
}
