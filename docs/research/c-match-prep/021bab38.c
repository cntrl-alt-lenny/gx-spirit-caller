/* CAMPAIGN-PREP candidate for func_021bab38 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: jump-table switch (case-order = table order); tail bit-pack via lsl/lsr; no stores
 *   risk:       permuter-class: addls-pc table base reg + orig switches on r1(=sel-0xb) while my switch is on sel; mwcc will likely build a different table/CSE and the case-0xb sel<5 branch is structurally odd.
 *   confidence: low
 */
/* func_ov002_021bab38 (ov002, class D): selector dispatch on arg1 (sel, range
 * 0xb..0x10) via an addls-pc jump table, then a common tail (only when sel in
 * {0xb,0xc,0xd}) that calls 021b229c(obj) and packs two bitfields out of [obj]
 * into the arg of 021b27a4. Args: r0 unused, r1=sel, r2=b, r3=obj. */

extern int func_ov002_021b229c(int obj);
extern int func_ov002_021b27a4(int packed);
extern int func_ov002_021b9254(int sel, int obj, int hi, int b, int stack0);
extern int func_ov002_021b9368(int sel, int obj, int b);
extern int func_ov002_021ba11c(int obj);
extern int func_ov002_021ba1a0(int obj);
extern int func_ov002_021ba1e8(int obj);
extern int func_ov002_021c2a40(int obj);
extern int func_ov002_021c2abc(int obj, int b);
extern int func_ov002_021c3754(int obj);

int func_ov002_021bab38(int a, int sel, int b, int obj) {
    unsigned int w;

    switch (sel) {
    case 0xd:
        func_ov002_021ba1e8(obj);
        break;
    case 0xe:
        if (b != 0)
            func_ov002_021ba1a0(obj);
        else
            func_ov002_021ba11c(obj);
        break;
    case 0xf:
        func_ov002_021c2a40(obj);
        break;
    case 0x10:
        func_ov002_021c2abc(obj, b);
        break;
    case 0xc:
        func_ov002_021c3754(obj);
        break;
    case 0xb:
        if (sel < 5)
            func_ov002_021b9254(sel, obj, (b << 16 >> 16) >> 8 & 0xff,
                                b & 0xff, 0);
        else
            func_ov002_021b9368(sel, obj, b & 0xff);
        break;
    default:
        break;
    }

    if (sel == 0xb || sel == 0xc || sel == 0xd) {
        func_ov002_021b229c(obj);
        w = *(unsigned int *)obj;
        func_ov002_021b27a4((int)((((w << 2) >> 24) << 1) + ((w << 18) >> 31)));
    }
    return 0;
}
