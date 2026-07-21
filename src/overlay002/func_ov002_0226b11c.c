/* func_ov002_0226b11c: Tail-calls func_ov002_0226acf8 with (1 - arg0), arg1 truncated to 16 bits, and two fixed args (0xb, 0).
 * Ships as asm -- verbatim transcription of the original
 * instructions; the exact register/branch shape isn't reliably
 * reachable from natural C without risking a mismatch.
 */

extern void func_ov002_0226acf8(void);

asm void func_ov002_0226b11c(void) {
    nofralloc
    ldr ip, =func_ov002_0226acf8
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    rsb r0, r0, #0x1
    mov r1, #0xb
    mov r3, #0x0
    bx ip
}
