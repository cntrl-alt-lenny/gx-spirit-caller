/* func_020930a0: read NDS hardware MMIO at 0x4000100.
 *
 * 3-insn 0x10 byte function. Found by 3-insn-shape sweep across
 * main's remaining unmatched 0x10 functions.
 */

#define REG_4000100 (*(volatile unsigned short *)0x4000100)

unsigned int func_020930a0(void) {
    return REG_4000100;
}
