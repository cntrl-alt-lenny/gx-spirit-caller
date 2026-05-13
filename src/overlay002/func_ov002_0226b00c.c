/* func_ov002_0226b00c: C-20a byte-pack inline-asm recipe (per brief
 * 056-territory PR #404). asm void + nofralloc emits the body verbatim
 * with no prologue/epilogue/tail-call detection. Default `.c` routing
 * (mwcc 2.0/sp1p5) — legacy SPs reject `ldr ip, =label`.
 *
 *     and r3, r3, #0xff
 *     and r2, r2, #0xff
 *     orr r2, r3, r2, lsl #0x8
 *     mov r3, r2, lsl #0x10
 *     mov r2, r1
 *     ldr ip, =func_ov002_0226acf8
 *     mov r3, r3, lsr #0x10
 *     mov r1, #0x9
 *     bx  ip
 */

extern void func_ov002_0226acf8(int p, int x, int q, unsigned short packed);

asm void func_ov002_0226b00c(int p, int q, int b, int c) {
    nofralloc
    and r3, r3, #0xff
    and r2, r2, #0xff
    orr r2, r3, r2, lsl #0x8
    mov r3, r2, lsl #0x10
    mov r2, r1
    ldr ip, =func_ov002_0226acf8
    mov r3, r3, lsr #0x10
    mov r1, #0x9
    bx  ip
}
