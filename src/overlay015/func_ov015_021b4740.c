/* func_ov015_021b4740: tick the fade-out — decrement the +0x28 frame counter by
 * dt (clamped at 0, which also clears the +0xc level), push the 31-step scaled
 * brightness to the master-bright register, and once the level reaches 0 blank
 * the register, release the +0x8 handle and report done. (ov015) */
extern void func_0208e318(int, int, int, int, int);
extern int  func_020b3870(int, int);
extern char data_ov015_021b5e28[];
extern char data_ov015_021b5e44[];
int func_ov015_021b4740(int dt) {
    char *s = data_ov015_021b5e44;
    int t = *(int *)(data_ov015_021b5e28 + 0x28) - dt;
    *(int *)(data_ov015_021b5e28 + 0x28) = t;
    if (t < 0)
        *(int *)(s + 0xc) = 0;
    {
        int level = *(int *)(s + 0xc);
        int p = func_020b3870(level * 31, *(int *)(s + 0x8));
        func_0208e318(0x4001050, 0x11, 8, 0x1f - p, p);
    }
    if (*(int *)(s + 0xc) != 0)
        return 0;
    *(short *)0x4001050 = 0;
    *(int *)(s + 0x8) = 0;
    return 1;
}
