/* func_02018d1c: signed division-by-40 via magic multiplier, returns
 * (arg*4 + 20) / 40 + 1, with early zero return on arg == 0.
 *
 * Equivalent to `(arg + 5) / 10 + 1` semantically — but mwcc only
 * emits the exact baserom `asr #4` shift (combining the 32-bit high
 * word with `/16`) from the divide-by-40 form. Writing `/ 10` gets
 * a `asr #2` (divide-by-4 of the high word) which differs in one
 * instruction byte.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    GetSystemWork
 *     cmp   r4, #0x0
 *     moveq r0, #0x0
 *     ldmeqia sp!, {r4, pc}
 *     mov   r0, r4, lsl #0x2          ; r0 = arg * 4
 *     add   r1, r0, #0x14             ; r1 = arg*4 + 20
 *     ldr   r2, .L_02018d54            ; r2 = 0x66666667
 *     mov   r0, r1, lsr #0x1f          ; r0 = sign
 *     smull r1, r3, r2, r1            ; r1:r3 = (int64)r2 * r1
 *     add   r3, r0, r3, asr #0x4       ; r3 = sign + (hi >> 4) = result/40
 *     add   r0, r3, #0x1
 *     ldmia sp!, {r4, pc}
 *   .L_02018d54: .word 0x66666667
 *
 * 15 ARM instructions, 0x3c bytes.
 */

extern char *GetSystemWork(void);

int func_02018d1c(int arg) {
    int n;
    (void)GetSystemWork();
    if (arg == 0) return 0;
    n = arg * 4 + 20;
    return (n / 40) + 1;
}
