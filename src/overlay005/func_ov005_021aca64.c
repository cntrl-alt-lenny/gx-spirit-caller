/* func_ov005_021aca64: begin a scroll if one isn't already running and there is
 * room to scroll. Bails if the +0x54 state is busy; computes the slack columns
 * (style count minus the visible cap minus 1) and bails unless +0x34 fits in
 * slack*16; otherwise latches the target into +0x4c/+0x50, marks state 2, and
 * snapshots +0x34 into +0x58. (ov005_core.h) */
extern int func_ov005_021ab108(void *, int);
extern int func_ov005_021ac984(void *);
void func_ov005_021aca64(void *o, int target) {
    if (*(int *)((char *)o + 0x54) != 0)
        return;
    {
        int x = func_ov005_021ab108(
            *(void **)o,
            ((unsigned)*(unsigned short *)((char *)o + 0x5c) << 22) >> 28);
        int y = func_ov005_021ac984(o);
        int d = x - y - 1;
        if (*(int *)((char *)o + 0x34) > (d << 4))
            return;
        *(int *)((char *)o + 0x4c) = target;
        *(int *)((char *)o + 0x50) = target;
        *(int *)((char *)o + 0x54) = 2;
        *(int *)((char *)o + 0x58) = *(int *)((char *)o + 0x34);
    }
}
