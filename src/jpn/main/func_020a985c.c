/* func_020a985c: write u32 to data_021029c0.
 *
 * 3-insn 0x10 byte function. Found by 3-insn-shape sweep across
 * main's remaining unmatched 0x10 functions.
 */

extern char data_021029c0[];

void func_020a985c(void *p) {
    *(void **)data_021029c0 = p;
}
