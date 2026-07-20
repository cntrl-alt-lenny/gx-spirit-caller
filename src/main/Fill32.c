/* Fill32: 4-byte-stride memory fill. Arg convention: (value, dest,
 * size_bytes). r0 = fill value, r1 = dest pointer, r2 = count in bytes.
 * Loop writes 4 bytes per iteration. size_bytes is expected to be a
 * multiple of 4 — callers guarantee alignment.
 *
 * Ships as `asm void` rather than natural C: mwcc doesn't emit the
 * `stmltia {r0}` (predicated store-multiple, single register) form from
 * any C variation tried. The natural C loop
 * `while (p < end) *p++ = value;` compiles to a `str r0, [r1], #4`
 * post-indexed single-word store + separate cmp — functionally
 * identical but byte-different (7 insns / 0x1c vs baserom's 5 insns /
 * 0x14). The store-multiple-with-one-register idiom appears to be a
 * hand-crafted tight-loop optimisation mwcc's -O4 won't reach on its
 * own (see codegen-walls.md C-12 for the general asm-void pattern).
 */

asm void Fill32(void) {
    nofralloc
    add     ip, r1, r2
loop_top:
    cmp     r1, ip
    stmltia r1!, {r0}
    blt     loop_top
    bx      lr
}
