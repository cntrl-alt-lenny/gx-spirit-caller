/* Copy32: 4-byte-stride memory copy (NitroSDK identity: MI_CpuCopy32).
 * Arg convention: (src, dst, size_bytes). r0 = const src pointer, r1 =
 * dst pointer, r2 = count in bytes. Loop copies 4 bytes per iteration.
 * size_bytes is expected to be a multiple of 4 — callers guarantee
 * alignment, same contract as Fill32.
 *
 * Ships as `asm void` (like Fill32): mwcc-ARM -O4 won't emit the
 * `ldmltia {r2}` / `stmltia {r2}` store-multiple-with-one-register form
 * from any C `while (d < end) *d++ = *s++` pattern — it uses `ldr`/`str`
 * with post-indexed addressing and an unconditional branch. Functionally
 * identical, byte-different (see codegen-walls.md C-12 for the general
 * asm-void pattern).
 */

asm void Copy32(void) {
    nofralloc
    add     ip, r1, r2
loop_top:
    cmp     r1, ip
    ldmltia r0!, {r2}
    stmltia r1!, {r2}
    blt     loop_top
    bx      lr
}
