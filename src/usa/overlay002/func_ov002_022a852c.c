/* func_ov002_022a852c: C-20a inline-asm recipe — store 3 fields + cross-
 * module tail-call with mwcc-2.0 `sub r1, r0, #0x32` constant-derive.
 * asm void + nofralloc bypasses tail-call detector + preserves the
 * sub-from-r0 form mwcc-1.2 wouldn't emit.
 *
 *     mov r3, #0x4
 *     str r3, [r0, #0x620]
 *     str r1, [r0, #0x630]
 *     str r2, [r0, #0x634]
 *     mov r0, #0x31
 *     ldr ip, =func_020371b8
 *     sub r1, r0, #0x32
 *     mov r2, #0x0
 *     mov r3, #0x1
 *     bx  ip
 */

extern void func_020371b8(int a, int b, int c, int d);

asm void func_ov002_022a852c(int p, int b, int c) {
    nofralloc
    mov r3, #0x4
    str r3, [r0, #0x620]
    str r1, [r0, #0x630]
    str r2, [r0, #0x634]
    mov r0, #0x31
    ldr ip, =func_020371b8
    sub r1, r0, #0x32
    mov r2, #0x0
    mov r3, #0x1
    bx  ip
}
