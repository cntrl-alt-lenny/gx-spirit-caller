/* func_02041520: clear bit 15 if set. mwcc emits `tst` (test-only) for
 * the natural `if (x & 0x8000)` C form; `ands` writing a scratch reg
 * while also setting flags is unusual codegen not reachable from C.
 */

asm void func_02041520(void) {
    nofralloc
    ands    r1, r0, #0x8000
    bicne   r0, r0, #0x8000
    bx      lr
}
