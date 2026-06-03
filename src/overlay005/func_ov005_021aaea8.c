/* func_ov005_021aaea8: interpolate a coordinate — pick the active/idle endpoint
 * pair by the +0 flag, then return start + scale((end-start)*field4, field8).
 * The whole (sub,scale,add) tail is duplicated per branch in the orig. Returns
 * the interpolated value. (ov005_core.h) */
extern int func_020b3870(int, int);
int func_ov005_021aaea8(void *o) {
    if (*(int *)o == 0) {
        short a = *(short *)((char *)o + 0x4e);
        short b = *(short *)((char *)o + 0x56);
        return a + func_020b3870((b - a) * *(int *)((char *)o + 4),
                                 *(int *)((char *)o + 8));
    } else {
        short a = *(short *)((char *)o + 0x4c);
        short b = *(short *)((char *)o + 0x54);
        return a + func_020b3870((b - a) * *(int *)((char *)o + 4),
                                 *(int *)((char *)o + 8));
    }
}
