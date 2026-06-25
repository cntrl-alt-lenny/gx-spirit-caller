/* CAMPAIGN-PREP candidate for func_021b82e4 (ov016, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     product idx*0x54 bound to one local (held in callee-saved); clamps via if-assign (strlt/strgt)
 *   risk:       permuter-class: orig computes r4 = idx*0x54 immediately and KEEPS it in a callee-saved reg across both bl's (`add r1,r5,r4` reused twice); mwcc may recompute the mul after the calls => extra mul + reload diverge. If it spills instead, reshape by forcing `entry` live. struct-guessed: idx at +0x1dc placed after _1f0 in struct is a layout fiction — confirm real offsets (flagD8 read as [base+0x100]+0xd8 = +0x1d8).
 *   confidence: low
 */
/* func_ov016_021b82e4 (ov016, class C) — camera/scroll clamp. base =
 * &data_021b9784 + obj->_1dc * 0x54 (product held in callee-saved r4
 * across two helper calls). Branches on obj->_1f0 and a u16 at +0x1d8
 * (within the +0x100 sub-struct). Clamps _1e0 and _1e8 by +/-0x10/0x18.
 */
extern unsigned char data_ov016_021b9784[];
extern void func_ov016_021b83a0(void *obj, void *entry);
extern void func_ov016_021b8774(void *entry);

typedef struct {
    unsigned char _pad0[0x100];
    unsigned char _sub[0xd8];   /* +0x100 base for the +0xd8 u16 */
    unsigned short flagD8;      /* +0x1d8 (accessed as [r6+0x100]+0xd8) */
    unsigned char _padda[0x6];
    int _1e0;                   /* +0x1e0 */
    unsigned char _pad1e4[0x4];
    int _1e8;                   /* +0x1e8 */
    unsigned char _pad1ec[0x4];
    int _1f0;                   /* +0x1f0 */
    unsigned char _padf4[0x4];
    int idx;                    /* +0x1dc ... NOTE precedes _1e0 */
} Obj;

int func_ov016_021b82e4(Obj *obj) {
    unsigned char *entry = &data_ov016_021b9784[obj->idx * 0x54];

    if (obj->_1f0 == 0) {
        if (obj->flagD8 == 0) {
            if (obj->_1e0 < 0x50)  obj->_1e0 += 0x10;
            if (obj->_1e8 < 0x18)  obj->_1e8 += 0x10;
        } else if (obj->_1e0 < 0) {
            func_ov016_021b8774(entry);
            func_ov016_021b83a0(obj, entry);
            obj->flagD8 = 0;
        }
    } else {
        if (obj->_1e0 > 0x54 - 0xf4)  obj->_1e0 -= 0x18;
        if (obj->_1e8 > ~0xd7)        obj->_1e8 -= 0x18;
    }
    return 1;
}
