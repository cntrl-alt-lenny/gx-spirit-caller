/* CAMPAIGN-PREP candidate for func_021c17c8 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: cond-ldr ternaries (obj->f18 ? recA : recB) -> ldrne/ldreq; flag word built with |=; (unsigned)(t-7)<=1 for t in {7,8}; rec0 signed short
 *   risk:       permuter-class: the flags block REUSES the f1c cmp-Z flag for orrne #0x400 ACROSS an intervening str f1c=0 (movne/strne don't touch flags); mwcc will recompute the test, re-ordering the bic/orr/str. Long body, multiple cond-ldr coin-flips. struct-guessed offsets.
 *   confidence: low
 */
/* func_ov006_021c17c8: marshal a record's fields into a packet writer. Open a
 * writer (02021660), locate the record via 021c1958, and when present and the
 * object's f14 counter has warmed up, write a fixed set of fields (some chosen
 * by obj->f18) plus a computed flags word; else write -1. Open a second writer,
 * write a state-derived flag, bump f14. Returns 1. (class D: cond-ldr ternaries
 * + flag-bit assembly.) */
extern int  func_02021660(int a, int b, int c);
extern void func_020216b0(int h, int field, int value);
extern int  func_0202de9c(void);
extern void *func_ov006_021c1958(char *obj, int a);

int func_ov006_021c17c8(char *obj) {
    int h;
    short *rec;
    int flags;
    int rec0;

    h = func_02021660(*(int *)obj, 3, 0);
    rec = (short *)func_ov006_021c1958(obj, *(int *)(obj + 0xc));
    if (rec != 0 && *(int *)(obj + 0x14) >= 0xf) {
        func_020216b0(h, 0xf, *(short *)((char *)rec + 0x2));
        func_020216b0(h, 0x10, *(short *)((char *)rec + 0x4));
        func_020216b0(h, 0xe, *(unsigned char *)((char *)rec + 0x17));
        func_020216b0(h, 0xa, *(short *)((char *)rec + 0x12));
        func_020216b0(h, 3, *(int *)(obj + 0x18) ? *(short *)((char *)rec + 0xc) : *(short *)((char *)rec + 0x6));
        func_020216b0(h, 4, *(int *)(obj + 0x18) ? *(short *)((char *)rec + 0xe) : *(short *)((char *)rec + 0x8));
        func_020216b0(h, 5, *(int *)(obj + 0x18) ? *(short *)((char *)rec + 0x10) : *(short *)((char *)rec + 0xa));
        rec0 = *(short *)rec;
        flags = 0x41;
        if (rec0 != *(int *)(obj + 0x10))
            flags |= 0x200;
        if (*(int *)(obj + 0x1c) != 0) {
            *(int *)(obj + 0x1c) = 0;
            flags |= 0x400;
        }
        if (*(int *)(obj + 0x18) != 0)
            flags |= 0x4;
        *(int *)(obj + 0x10) = rec0;
    } else {
        flags = 0;
        *(int *)(obj + 0x10) = -1;
    }
    func_020216b0(h, 0, flags);

    h = func_02021660(*(int *)obj, 3, 1);
    flags = 0;
    if (rec == 0 && *(int *)(obj + 0x14) >= 0xf && *(int *)(obj + 0xc) != 0) {
        int t = func_0202de9c();
        if ((unsigned int)(t - 7) <= 1)
            flags |= 1;
    }
    func_020216b0(h, 0, flags);
    *(int *)(obj + 0x14) = *(int *)(obj + 0x14) + 1;
    return 1;
}
