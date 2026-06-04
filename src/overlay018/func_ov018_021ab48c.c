/* func_ov018_021ab48c: reset the two scroll registers (clear the low nibble of
 * BG2 H-offset on both displays) and re-seed the two cell layers via
 * func_ov018_021aa5fc. Returns 1.
 */

extern char data_ov018_021ad860[];
extern void func_0208c884(int reg, int val);
extern void func_ov018_021aa5fc(int a, int b, int c, int d);

int func_ov018_021ab48c(void) {
    *(int *)(data_ov018_021ad860 + 0x50) = 0x1e000;
    *(int *)(data_ov018_021ad860 + 0x54) = 0x1e000;
    func_0208c884(0x400006c, ~0xf);
    func_0208c884(0x400106c, ~0xf);
    func_ov018_021aa5fc(6, 3, 1, 1);
    func_ov018_021aa5fc(7, 8, 1, 1);
    return 1;
}
