/* func_ov011_021d2278: conditional accessor — bit-8 test.
 *
 *     ldr  r1, [r0, #0x40]
 *     mov  r1, r1, lsl #0x17     ; bit 8 -> bit 31
 *     movs r1, r1, lsr #0x1f     ; extract bit 8 (u32 {0,1})
 *     movne r0, #0x0             ; if set: return 0
 *     addeq r0, r0, #0x8         ; if clear: return (r0 + 8)
 *     bx   lr
 *
 * When the bit-8 flag at +0x40 is clear, returns `(char *)p + 8`
 * (probably a pointer to a subfield); when set, returns NULL.
 */

int func_ov011_021d2278(void *p) {
    /* The `(x << 23) >> 31` idiom is what reproduces the baserom's
     * `mov r1, r1, lsl #0x17; movs r1, r1, lsr #0x1f` shift-shift-
     * flags sequence. Using bitwise-AND (`flags & (1u << 8)`) lets
     * mwcc fold to `tst r1, #0x100` — one instruction shorter and
     * breaks the match. Two shifts preserve the baserom shape. */
    unsigned flags = *(unsigned *)((char *)p + 0x40);
    if ((flags << 23) >> 31) return 0;
    return (int)((char *)p + 8);
}
