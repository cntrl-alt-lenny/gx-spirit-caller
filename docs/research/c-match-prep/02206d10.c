/* CAMPAIGN-PREP candidate for func_02206d10 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if/else-if chain with NO default => sel uninitialized (matches r4 unset, intentional-UB lever); base 0x15b6 bound to a local so compares/results add/sub from it.
 *   risk:       permuter-class: asm keeps 0x15b6 in one reg and forms 5 values via add/sub #imm. mwcc may instead ldr each folded literal (0x167e,0x157f,...) separately. CSE of the base constant is not guaranteed.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_02206d10 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft. Value-compare select + bitfield-arg call.
 * if (021ff3bc()==0) return 0;
 * if (f2.:6@bit6 == 0x23) return 1;            (.L_84 path)
 * switch on f0 (ushort@+0) vs base 0x15b6: sel = base-0x37 / base-0x318 / base-0x84
 *   for f0 == base / base+0xc8 / base+0xe8; NO default -> sel left UNINIT on no-match
 *   (matches r4 unset; intentional, do not add else).
 * call 021bb90c(f2.bit0, sel); return result ? 1 : 0.
 * base 0x15b6 held in one reg; compares/results formed by add/sub from it. */
typedef unsigned short u16;

extern int func_ov002_021ff3bc(void);
extern int func_ov002_021bb90c(int a, int sel);

struct Ent6d10 { u16 f0; u16 b0 : 1; u16 _1 : 5; u16 f6 : 6; u16 _12 : 4; };

int func_ov002_02206d10(struct Ent6d10 *p) {
    int base = 0x15b6;
    int sel;
    if (func_ov002_021ff3bc() == 0)
        return 0;
    if (p->f6 == 0x23)
        return 1;
    if (p->f0 == base)
        sel = base - 0x37;
    else if (p->f0 == base + 0xc8)
        sel = base - 0x318;
    else if (p->f0 == base + 0xe8)
        sel = base - 0x84;
    return func_ov002_021bb90c(p->b0, sel) != 0;
}
