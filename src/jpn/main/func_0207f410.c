/* func_0207f410: tail call into func_020943b0 (a 2-byte-stride copy)
 * with dst offset by 0x7000400 -- natural C compiles, but mwcc
 * synthesizes the constant via two immediate `add`s (0x7000000 +
 * 0x400) instead of the original's single pool-loaded constant +
 * one `add`. Ships as asm to match exactly.
 */

extern void func_020943b0(void);

asm void func_0207f410(void) {
    nofralloc
    ldr     r3, =0x7000400
    ldr     ip, =func_020943b0
    add     r1, r1, r3
    bx      ip
}
