/* func_ov002_021b41e8: lookup-then-deref-or-default. Looks up an
 * entry by halfword key at p[5], returns the entry's f_4 field
 * (halfword), or -1 if lookup returns null. Style B with
 * predicated `ldrneh` / `mvneq`.
 *
 *     stmdb sp!, {r3, lr}
 *     ldrh  r0, [r0, #0xa]
 *     bl    func_ov002_021b3c10
 *     cmp   r0, #0x0
 *     ldrneh r0, [r0, #0x4]
 *     mvneq r0, #0x0
 *     ldmia sp!, {r3, pc}
 */

extern void *func_ov002_021b3c10(unsigned short key);

int func_ov002_021b41e8(unsigned short *p) {
    unsigned short *r = (unsigned short *)func_ov002_021b3c10(p[5]);
    if (r != 0) return r[2];
    return -1;
}
