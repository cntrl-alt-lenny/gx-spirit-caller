/* CAMPAIGN-PREP candidate for func_0200f044 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard&&; uninit-local bit5 insert; branch-table switch; orr-then-bic per case source-order
 *   risk:       struct-guessed/reshape-able: uninitialised-r3 bit5 insert is fragile (mwcc may zero it); switch needs jump-table (addls) not if-chain -- may need explicit ascending case 0..6 + a real default to force the table
 *   confidence: low
 */
/* func_0200f044 @ 0x0200f044 (main, class D)
 * jump-table switch (sel 0..6) of flag bic/orr ops on field 0x84, guarded by
 * (obj != 0 && obj->f80 != 0). A common preamble sets bit0, sets bit5 from an
 * uninitialised local, then the switch toggles bits 1/2/4/8/16. returns 1 if
 * the guard passed (work done), else 0.
 *
 * Branch-table mapping (addls pc,pc,r1,lsl#2 ; first entry = sel 0):
 *   sel 0  -> .L_370  : no flag change (just return 1)
 *   sel 1  -> .L_2e4  : arg2=0; insert arg2<<6 (mask 0xffc0003f); clear 2,4,8,16
 *   sel 2  -> .L_31c  : set 0x2;  clear 0x4; clear 0x10
 *   sel 3  -> .L_334  : set 0x4;  clear 0x2; clear 0x8
 *   sel 4  -> .L_34c  : set 0x8;  clear 0x4
 *   sel 5  -> .L_360  : set 0x10; clear 0x2
 *   sel 6  -> .L_300  : clear 2,4,8,16
 *   (sel 1 falls through .L_2e8->.L_300; .L_2e8 insert-no-zero is sel-1 only)
 *
 * Preamble (f84):  v=f84; v=(v&~1)|1; v&=~0x20; v|=((uninit&1)<<5); f84=v;
 * uninit = the raw stmdb-saved r3 (intentionally-uninitialised local).
 *
 * f84 bit5 insert + the arg2 16-bit insert at bit6 are bitfield-style writes;
 * per-case store-order is orr-then-bic following source order.
 */

struct Obj0200f044 {
    char _pad0[0x80];
    unsigned int f80;   /* 0x80 */
    unsigned int f84;   /* 0x84 */
};

int func_0200f044(struct Obj0200f044 *obj, int sel, int arg2)
{
    unsigned int v;
    int uninit;   /* intentionally uninitialised: stmdb {r3,lr}, r3 used raw */

    if (obj == 0 || obj->f80 == 0) {
        return 0;
    }

    v = obj->f84;
    v = (v & ~0x1u) | 0x1u;
    v = v & ~0x20u;
    v = v | (((unsigned int)uninit & 1u) << 5);
    obj->f84 = v;

    switch (sel) {
    case 1:
        arg2 = 0;
        v = obj->f84;
        v = (v & 0xffc0003fu) | (((unsigned int)arg2 & 0xffffu) << 6);
        obj->f84 = v;
        /* fall through to the clear block (sel 6 body) */
    case 6:
        v = obj->f84;
        v = v & ~0x2u;
        v = v & ~0x4u;
        v = v & ~0x8u;
        v = v & ~0x10u;
        obj->f84 = v;
        break;
    case 2:
        v = obj->f84;
        v = v | 0x2u;
        v = v & ~0x4u;
        v = v & ~0x10u;
        obj->f84 = v;
        break;
    case 3:
        v = obj->f84;
        v = v | 0x4u;
        v = v & ~0x2u;
        v = v & ~0x8u;
        obj->f84 = v;
        break;
    case 4:
        v = obj->f84;
        v = v | 0x8u;
        v = v & ~0x4u;
        obj->f84 = v;
        break;
    case 5:
        v = obj->f84;
        v = v | 0x10u;
        v = v & ~0x2u;
        obj->f84 = v;
        break;
    default:   /* sel 0 and out-of-range -> .L_370, no flag change */
        break;
    }
    return 1;
}
