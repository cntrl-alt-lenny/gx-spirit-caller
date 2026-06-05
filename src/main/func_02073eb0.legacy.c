/* func_02073eb0: probe-then-default. Return func_02073ed8(a0) when it is
 * non-zero (keeping a0), else the global default. STYLE-A: the orig epilogue
 * is `pop {r4,lr}; bx lr` -> legacy mwcc 1.2/sp2p3 (.legacy.c), not 2.0. */
extern int data_0219eef8;
extern int func_02073ed8(int);

int func_02073eb0(int a0) {
    if (func_02073ed8(a0)) return a0;
    return data_0219eef8;
}
