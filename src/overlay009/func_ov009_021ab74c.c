/* func_ov009_021ab74c: retarget entry o to frame `a`. No-op (returns 1) when
 * already on frame a with flag b clear. Otherwise records the frame, builds a
 * 3x2 cell via func_02021660 on the o[0x8] surface, applies the two attribute
 * passes (func_020216b0), and commits the o[0x14] sprite from data_ov009_021ad994
 * keyed by the new frame. Returns 1. (ov009_core.h) */
extern int func_02021660(int, int, int);
extern void func_020216b0(int, int, int);
extern void func_02091554(void *, void *, int);
extern char data_ov009_021ad994[];
int func_ov009_021ab74c(int *o, int a, int b) {
    if (a != o[3] || b != 0) {
        o[3] = a;
        {
            int h = func_02021660(o[2], 3, 2);
            func_020216b0(h, 2, 0x29);
            func_020216b0(h, 0, 0x41);
            func_02091554(&o[5], data_ov009_021ad994, o[3]);
        }
    }
    return 1;
}
