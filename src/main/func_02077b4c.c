/* func_02077b4c: write u32 to data_02101ecc.
 *
 * 3-insn 0x10 byte function. Found by 3-insn-shape sweep across
 * main's remaining unmatched 0x10 functions.
 */

extern char data_02101ecc[];

void func_02077b4c(void *p) {
    *(void **)data_02101ecc = p;
}
