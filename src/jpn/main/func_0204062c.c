/* func_0204062c: write u32 to data_020fe47c.
 *
 * 3-insn 0x10 byte function. Found by 3-insn-shape sweep across
 * main's remaining unmatched 0x10 functions.
 */

extern char data_020fe47c[];

void func_0204062c(void *p) {
    *(void **)data_020fe47c = p;
}
