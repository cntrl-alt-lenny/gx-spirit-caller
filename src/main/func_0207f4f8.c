/* func_0207f4f8: tail call into func_020944a4 (a 2-byte-stride copy)
 * with dst offset by 0x7000400 -- natural C compiles, but mwcc
 * synthesizes the constant via two immediate `add`s (0x7000000 +
 * 0x400) instead of the original's single pool-loaded constant +
 * one `add`. Ships as asm to match exactly.
 */

extern void func_020944a4(void);

asm void func_0207f4f8(void) {
    nofralloc
    ldr     r3, =0x7000400
    ldr     ip, =func_020944a4
    add     r1, r1, r3
    bx      ip
}
