/* func_0202b798: sentinel wrapper — if idx==0 return default string,
 * else call func_0202b778 with idx + 0x1f4.
 *
 *     stmdb sp!, {r3, lr}
 *     cmp   r0, #0x0
 *     ldreq r0, .L_0202b808           ; default = &data_020c69bc
 *     ldmeqia sp!, {r3, pc}
 *     add   r0, r0, #0x1f4
 *     bl    func_0202b778
 *     ldmia sp!, {r3, pc}
 *
 * 7 insns + 1 pool = 0x20 bytes.
 *
 * Sibling offsets (same sentinel shape, different constants added to
 * idx before the call):
 *   - func_0202b7b8: 0x200 + 0x26 = 0x226
 *   - func_0202b7dc: 0x200 + 0x12 = 0x212
 *   - func_0202b800: 0x200 + 0x3a = 0x23a
 *
 * These 4 are all "lookup something in range [X, X+N)" helpers over
 * the same inner-struct table that func_0202b778 reads.
 */

extern char *data_020c69bc;
extern char *func_0202b778(int idx);

char *func_0202b798(int idx) {
    if (idx == 0) return (char *)&data_020c69bc;
    return func_0202b778(idx + 0x1f4);
}
