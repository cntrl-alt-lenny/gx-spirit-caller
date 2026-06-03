/* func_ov015_021b34cc: advance the scroll if the window has actually moved — the
 * target column is the scaled height span (0 if the span is empty); if it equals
 * the live +0x5c column nothing happens, otherwise arm the +0x68/+0x70 scroll
 * request and report 1. (ov015) */
extern int func_020b3870(int, int);
int func_ov015_021b34cc(void *o) {
    int span = *(short *)((char *)o + 0x6c);
    int v;
    if (span == 0)
        v = 0;
    else
        v = func_020b3870(*(short *)((char *)o + 0x5a) - *(short *)((char *)o + 0x56),
                          span);
    if (*(int *)((char *)o + 0x5c) == v - 1)
        return 0;
    *(int *)((char *)o + 0x68) = 3;
    *(int *)((char *)o + 0x70) = 0x5000;
    return 1;
}
