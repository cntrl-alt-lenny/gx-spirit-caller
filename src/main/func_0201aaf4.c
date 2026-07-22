/* func_0201aaf4: clear bit (arg - 0x75) in byte 0 of GetSystemWork()->field_0x900.
 * Same shift-pair byte/bit-extraction shape as func_020186b0 (adjacent
 * file, same GetSystemWork() base) — mwcc canonicalizes the natural C
 * shift-pair extraction to a shorter AND-based form, so this ships as
 * asm to match exactly.
 */

extern void *GetSystemWork(void);

asm void func_0201aaf4(void) {
    nofralloc
    stmdb   sp!, {r4, lr}
    mov     r4, r0
    bl      GetSystemWork
    ldr     r3, [r0, #0x900]
    sub     r1, r4, #0x75
    mov     r2, #0x1
    mvn     r1, r2, lsl r1
    mov     r2, r3, lsl #0x18
    and     r1, r1, r2, lsr #0x18
    bic     r2, r3, #0xff
    and     r1, r1, #0xff
    orr     r1, r2, r1
    str     r1, [r0, #0x900]
    ldmia   sp!, {r4, pc}
}
