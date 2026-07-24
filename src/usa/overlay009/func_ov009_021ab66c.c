/* func_ov009_021ab66c: retarget entry o to frame `a`. No-op (returns 1) when
 * already on frame a with flag b clear. Otherwise records the frame, builds a
 * 3x2 cell via func_0202160c on the o[0x8] surface, applies the two attribute
 * passes (func_0202165c), and commits the o[0x14] sprite from data_ov009_021ad8b4
 * keyed by the new frame. Returns 1. (ov009_core.h) */
extern int func_0202160c(int, int, int);
extern void func_0202165c(int, int, int);
extern void OS_SPrintf(void *, void *, int);
extern char data_ov009_021ad8b4[];
int func_ov009_021ab66c(int *o, int a, int b) {
    if (a != o[3] || b != 0) {
        o[3] = a;
        {
            int h = func_0202160c(o[2], 3, 2);
            func_0202165c(h, 2, 0x29);
            func_0202165c(h, 0, 0x41);
            OS_SPrintf(&o[5], data_ov009_021ad8b4, o[3]);
        }
    }
    return 1;
}
