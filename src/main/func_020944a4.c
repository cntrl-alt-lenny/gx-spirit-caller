/* func_020944a4: 2-byte-stride memory copy. Sibling of Copy32, same
 * address neighbourhood (0x020944a4, immediately before Fill32/
 * Copy32). Arg convention: (src, dst, size_bytes). r0 = const src
 * pointer, r1 = dst pointer, r2 = count in bytes. Loop copies 2 bytes
 * per iteration. size_bytes is expected to be a multiple of 2 —
 * callers guarantee alignment, same contract as Copy32. Likely
 * Copy16's natural name (matching Fill32/Copy32's convention), but not
 * renamed here — see func_0209448c.c for why (a rename attempt here
 * broke the link across ~10 callers).
 *
 * Ships as `asm void`, same reason as Copy32: mwcc doesn't emit the
 * predicated `ldrlth`/`strlth` single-register conditional load/store
 * idiom from any natural C loop form (see codegen-walls.md C-12, and
 * src/main/Copy32.c for the 4-byte-stride sibling with the identical
 * shape).
 */

asm void func_020944a4(void) {
    nofralloc
    mov     ip, #0x0
loop_top:
    cmp     ip, r2
    ldrlth  r3, [r0, ip]
    strlth  r3, [r1, ip]
    addlt   ip, ip, #0x2
    blt     loop_top
    bx      lr
}
