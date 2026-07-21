/* func_ov002_022b3434: Checks obj->field_4 != 0, and if so also obj->field_c != 0 -- the result is left as a raw value/condition-code in r0, not a clean 0/1 C boolean, so this ships as asm.
 * Ships as asm -- verbatim transcription of the original
 * instructions; the exact register/branch shape isn't reliably
 * reachable from natural C without risking a mismatch.
 */

asm void func_ov002_022b3434(void) {
    nofralloc
    ldr r1, [r0, #0x4]
    cmp r1, #0x0
    ldrne r0, [r0, #0xc]
    cmpne r0, #0x0
    bx lr
}
