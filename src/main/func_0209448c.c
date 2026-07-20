/* func_0209448c: 2-byte-stride memory fill. Sibling of Fill32, same
 * address neighbourhood (0x0209448c, immediately before the function
 * at 0x020944a4, Fill32, and Copy32). Arg convention: (value, dest,
 * size_bytes). r0 = fill value (low halfword used), r1 = dest pointer,
 * r2 = count in bytes. Loop writes 2 bytes per iteration. size_bytes
 * is expected to be a multiple of 2 — callers guarantee alignment,
 * same contract as Fill32. Likely Fill16's natural name (matching
 * Fill32/Copy32's convention), but not renamed here — this brief
 * converts .s -> .c only; renaming a function with existing callers
 * needs every `extern` declaration updated too, out of scope for a
 * single-function conversion (confirmed the hard way: an earlier
 * attempt at this exact rename broke the link across ~10 callers).
 *
 * Ships as `asm void`, same reason as Fill32: mwcc doesn't emit the
 * predicated `strlth {r0}` single-register conditional-store idiom
 * from any natural C loop form (see codegen-walls.md C-12, and
 * src/main/Fill32.c for the 4-byte-stride sibling with the identical
 * shape).
 */

asm void func_0209448c(void) {
    nofralloc
    mov     r3, #0x0
loop_top:
    cmp     r3, r2
    strlth  r0, [r1, r3]
    addlt   r3, r3, #0x2
    blt     loop_top
    bx      lr
}
