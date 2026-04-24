/* func_0202b7ec: sentinel wrapper — if idx==0 return default string,
 * else call func_0202b7cc with idx + 0x1f4.
 *
 *     stmdb sp!, {r3, lr}
 *     cmp   r0, #0x0
 *     ldreq r0, .L_0202b808           ; default = &data_020c6a9c
 *     ldmeqia sp!, {r3, pc}
 *     add   r0, r0, #0x1f4
 *     bl    func_0202b7cc
 *     ldmia sp!, {r3, pc}
 *
 * 7 insns + 1 pool = 0x20 bytes.
 *
 * Sibling offsets (same sentinel shape, different constants added to
 * idx before the call):
 *   - func_0202b80c: 0x200 + 0x26 = 0x226
 *   - func_0202b830: 0x200 + 0x12 = 0x212
 *   - func_0202b854: 0x200 + 0x3a = 0x23a
 *
 * These 4 are all "lookup something in range [X, X+N)" helpers over
 * the same inner-struct table that func_0202b7cc reads.
 */

extern char *data_020c6a9c;
extern char *func_0202b7cc(int idx);

char *func_0202b7ec(int idx) {
    if (idx == 0) return (char *)&data_020c6a9c;
    return func_0202b7cc(idx + 0x1f4);
}
