/* func_ov018_021aa840: compute the two layout metrics for cell a0 (per the
 * current mode from func_ov018_021aa738) into *out1/*out2, via the per-mode
 * params at data_ad7a0/ad7a4[mode*0x20 + a0*0x10].
 */

extern char data_ov018_021ad6c0[];
extern char data_ov018_021ad6c4[];
extern int func_ov018_021aa738(int sel);
extern int func_0201ed20(int a, int b);
extern int func_0201ece8(int a, int b);

void func_ov018_021aa840(int a0, int *out1, int *out2, int a3, int a4) {
    int mode = func_ov018_021aa738(a0);
    *out1 = func_0201ed20(a3, *(int *)(data_ov018_021ad6c0 + mode * 0x20 + a0 * 0x10));
    *out2 = func_0201ece8(a4, *(int *)(data_ov018_021ad6c4 + mode * 0x20 + a0 * 0x10));
}
