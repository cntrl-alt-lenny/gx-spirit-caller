/* func_ov018_021ab3ac: reset the two scroll registers (clear the low nibble of
 * BG2 H-offset on both displays) and re-seed the two cell layers via
 * func_ov018_021aa51c. Returns 1.
 */

extern char data_ov018_021ad780[];
extern void func_0208c79c(int reg, int val);
extern void func_ov018_021aa51c(int a, int b, int c, int d);

int func_ov018_021ab3ac(void) {
    *(int *)(data_ov018_021ad780 + 0x50) = 0x1e000;
    *(int *)(data_ov018_021ad780 + 0x54) = 0x1e000;
    func_0208c79c(0x400006c, ~0xf);
    func_0208c79c(0x400106c, ~0xf);
    func_ov018_021aa51c(6, 3, 1, 1);
    func_ov018_021aa51c(7, 8, 1, 1);
    return 1;
}
