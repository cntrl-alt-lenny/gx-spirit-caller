/* func_02077a64: write u32 to data_02101dec.
 *
 * 3-insn 0x10 byte function. Found by 3-insn-shape sweep across
 * main's remaining unmatched 0x10 functions.
 */

extern char data_02101dec[];

void func_02077a64(void *p) {
    *(void **)data_02101dec = p;
}
