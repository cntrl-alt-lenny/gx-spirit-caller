/* func_02093c10: write NDS hardware MMIO at 0x4000247.
 *
 * 3-insn 0x10 byte function. Found by 3-insn-shape sweep across
 * main's remaining unmatched 0x10 functions.
 */

#define REG_4000247 (*(volatile unsigned char *)0x4000247)

void func_02093c10(unsigned int v) {
    REG_4000247 = (unsigned char)v;
}
