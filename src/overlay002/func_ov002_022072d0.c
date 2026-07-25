/* func_ov002_022072d0 (ov002): leaf bitfield extract + field-bit compare.
 * type6=bits[11:6] of u16@+2; if !=0x16 -> 0. Then compare bit9(u32@+0x14)
 * vs bit0(u16@+2); equal -> 0 else -> 2. Written with the literal
 * shift-pair form (asymmetric shifts are safe as raw C -- mwcc only folds
 * to a mask when the two shift amounts are equal). */
struct Ent {
    char _0[2];
    unsigned short f2;          /* +0x2  */
    char _4[0x10];
    unsigned int  f14;          /* +0x14 */
};

int func_ov002_022072d0(struct Ent *c) {
    unsigned short v;
    unsigned int   w;
    v = c->f2;
    if (((unsigned)(v << 0x14) >> 0x1a) != 0x16)
        goto ret0;
    w = c->f14;
    if (((w << 0x16) >> 0x1f) == ((unsigned)(v << 0x1f) >> 0x1f))
        return 0;
    return 2;
ret0:
    return 0;
}
