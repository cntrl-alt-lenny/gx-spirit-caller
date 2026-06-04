/* func_ov018_021accc8: drive the screen-fade countdown. Each call bleeds the
 * timer at snd+0x54 by 0x1000; once it underflows, clamp the level at st+0xc to
 * 0. Push the current blend factor (-(level<<4) / step) to both BLDY registers.
 * When the level reaches 0, reset the fade state (level/step 0, reload 0xe),
 * force both BLDY to -0x10, clear the mosaic nibble of both DISPCNTs, zero the
 * timer pair, and report done (1); otherwise report still-fading (0).
 */

extern char data_ov018_021ad860[];
extern char data_ov018_021ad8a8[];
extern int func_020b3870(int num, int den);
extern void func_0208c884(int reg, int val);

int func_ov018_021accc8(void) {
    char *st = data_ov018_021ad8a8;
    int t;
    int v;

    t = *(int *)(data_ov018_021ad860 + 0x54) - 0x1000;
    *(int *)(data_ov018_021ad860 + 0x54) = t;
    if (t < 0) {
        *(int *)(st + 0xc) = 0;
    }
    v = -0x10 - func_020b3870(-(*(int *)(st + 0xc) << 4), *(int *)(st + 0x8));
    func_0208c884(0x400006c, v);
    func_0208c884(0x400106c, v);
    if (*(int *)(st + 0xc) != 0) {
        return 0;
    }
    *(int *)(st + 0xc) = 0;
    *(int *)(st + 0x8) = 0;
    *(int *)(st + 0x0) = 0xe;
    func_0208c884(0x400006c, -0x10);
    func_0208c884(0x400106c, -0x10);
    *(int *)0x4000000 &= ~0x1f00;
    *(int *)0x4001000 &= ~0x1f00;
    *(int *)(data_ov018_021ad860 + 0x50) = 0;
    *(int *)(data_ov018_021ad860 + 0x54) = 0;
    return 1;
}
