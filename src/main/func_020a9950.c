/* func_020a9950: write u32 to data_02102aa0.
 *
 * 3-insn 0x10 byte function. Found by 3-insn-shape sweep across
 * main's remaining unmatched 0x10 functions.
 */

extern char data_02102aa0[];

void func_020a9950(void *p) {
    *(void **)data_02102aa0 = p;
}
