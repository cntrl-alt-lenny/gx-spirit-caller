/* func_ov018_021aa920: compute the two layout metrics for cell a0 (per the
 * current mode from func_ov018_021aa818) into *out1/*out2, via the per-mode
 * params at data_ad7a0/ad7a4[mode*0x20 + a0*0x10].
 */

extern char data_ov018_021ad7a0[];
extern char data_ov018_021ad7a4[];
extern int func_ov018_021aa818(int sel);
extern int func_0201ed74(int a, int b);
extern int func_0201ed3c(int a, int b);

void func_ov018_021aa920(int a0, int *out1, int *out2, int a3, int a4) {
    int mode = func_ov018_021aa818(a0);
    *out1 = func_0201ed74(a3, *(int *)(data_ov018_021ad7a0 + mode * 0x20 + a0 * 0x10));
    *out2 = func_0201ed3c(a4, *(int *)(data_ov018_021ad7a4 + mode * 0x20 + a0 * 0x10));
}
