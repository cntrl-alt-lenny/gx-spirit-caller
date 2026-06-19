/* func_ov015_021b45b0: tick the fade-in — decrement the +0x28 frame counter by
 * dt (clamped at 0, clearing +0xc), push the 31-step scaled brightness to the
 * master-bright register (up direction), and once the level reaches 0 release
 * the +0x8 handle and report done. Sibling of the fade-out 021b4740 (ov015). */
extern void func_0208e230(int, int, int, int, int);
extern int  func_020b377c(int, int);
extern char data_ov015_021b5d08[];
extern char data_ov015_021b5d24[];
int func_ov015_021b45b0(int dt) {
    char *s = data_ov015_021b5d24;
    int t = *(int *)(data_ov015_021b5d08 + 0x28) - dt;
    *(int *)(data_ov015_021b5d08 + 0x28) = t;
    if (t < 0)
        *(int *)(s + 0xc) = 0;
    {
        int level = *(int *)(s + 0xc);
        int p = func_020b377c(level * 31, *(int *)(s + 0x8));
        func_0208e230(0x4001050, 0x11, 8, p, 0x1f - p);
    }
    if (*(int *)(s + 0xc) == 0) {
        *(int *)(s + 0x8) = 0;
        return 1;
    }
    return 0;
}
