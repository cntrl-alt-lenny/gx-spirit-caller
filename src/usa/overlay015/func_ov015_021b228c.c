/* func_ov015_021b228c: when the +0x70 dirty bit is set, recompute the +0x68
 * scroll target (lo + height_span*mode/(hi-lo), or just lo when the window is
 * empty) and clear the dirty bit. Returns the current +0x68 target. (ov015) */
extern int func_020b377c(int, int);
typedef struct { unsigned dirty : 1; } Ov015DirtyFlag;
int func_ov015_021b228c(void *o) {
    int span = *(short *)((char *)o + 0x56) - *(short *)((char *)o + 0x4e);
    int mode = *(int *)((char *)o + 0x4);
    if (((Ov015DirtyFlag *)((char *)o + 0x70))->dirty == 1) {
        int hi = *(int *)((char *)o + 0x5c);
        int lo = *(int *)((char *)o + 0x60);
        if (lo == hi)
            *(int *)((char *)o + 0x68) = lo;
        else
            *(int *)((char *)o + 0x68) = lo + func_020b377c(mode * (hi - lo), span);
        *(int *)((char *)o + 0x70) &= ~1;
    }
    return *(int *)((char *)o + 0x68);
}
