/* CAMPAIGN-PREP candidate for func_021baa04 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: jump-table switch(cmd-0xb); r4=021c93f0() across arms; default cmd+arg2 guard
 *   risk:       source asm TRUNCATED mid-.L_cc (_LIT3/4/5 + final bl missing); default-path mla base, +0x30 slot field, and tail call args inferred. struct-guessed + permuter-class (5-arm body order + r4 liveness)
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_021baa04 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED + TRUNCATED: source asm is cut off mid-.L_cc
 * (308B/71 insns; _LIT3/4/5 and the final bl/return are NOT in the batch).
 * The visible structure is modeled; the .L_cc tail is best-effort.
 *   recipe:   CLASS D: jump-table on (cmd-0xb) with addls pc,pc,r1,lsl#2 (5 entries) -> switch(cmd){0xb..0xf} else default; r4=func_021c93f0() bound across all arms; default branches on (cmd+arg2)<=0xa; mla base for the >0xa path.
 *   risk:     TRUNCATED tail -- the default .L_cc path computes mla base cf16c+(a&1)*0x868 +0x30 then slot4*0x14, plus add (cmd + a<<4) and a final func_021ba9e8 call I cannot see the full args/return for. struct-guessed (slot 0x14 stride, 0x30 field) + permuter-class (jump-table body order + r4 liveness across 5 arms likely needs reshape/permuter).
 *   confidence: low
 */
/* func_ov002_021baa04(a, cmd, arg2): slot=func_021c93f0(); dispatch on cmd:
 *   0xb -> func_021c37f4(a,slot)
 *   0xc -> func_021ba524(a,slot)
 *   0xd -> func_021ba430(a,slot)
 *   0xe -> func_021c2bd4(a,slot); func_021b229c(slot)
 *   0xf -> func_021c3150(a,slot); func_021b229c(slot)
 *   default: if (cmd+arg2 <= 0xa): func_021b1e80(a,slot); base = cf16c[a&1] slot[slot4]@+0x30 region; func_021ba9e8(base) ... [TRUNCATED]
 *            else: compare cf16c[0].f0==a && f1c==cmd -> pick d016c vs cd4cc; func_021ba9e8(that). */
typedef unsigned char u8;
typedef unsigned int  u32;

typedef struct Team { u8 _b[0x868]; } Team;

extern Team data_ov002_022cf16c[];
extern u8   data_ov002_022cd4b8[];
extern u8   data_ov002_022cd4cc[];
extern u8   data_ov002_022d016c[];
extern int  func_ov002_021b1e80(int a, int slot);
extern int  func_ov002_021b229c(int slot);
extern int  func_ov002_021ba430(int a, int slot);
extern int  func_ov002_021ba524(int a, int slot);
extern int  func_ov002_021ba9e8(int p);
extern int  func_ov002_021c2bd4(int a, int slot);
extern int  func_ov002_021c3150(int a, int slot);
extern int  func_ov002_021c37f4(int a, int slot);
extern int  func_ov002_021c93f0(void);

int func_ov002_021baa04(int a, int cmd, int arg2) {
    int slot = func_ov002_021c93f0();
    switch (cmd) {
    case 0xb:
        return func_ov002_021c37f4(a, slot);
    case 0xc:
        return func_ov002_021ba524(a, slot);
    case 0xd:
        return func_ov002_021ba430(a, slot);
    case 0xe:
        func_ov002_021c2bd4(a, slot);
        return func_ov002_021b229c(slot);
    case 0xf:
        func_ov002_021c3150(a, slot);
        return func_ov002_021b229c(slot);
    default:
        if (cmd + arg2 <= 0xa) {
            func_ov002_021b1e80(a, slot);
            /* TRUNCATED: mla base = cf16c + (a&1)*0x868 + 0x30, slot*0x14;
             * func_021ba9e8(base); + add (cmd + (a<<4)); tail not in source. */
            return func_ov002_021ba9e8((int)((u8 *)&data_ov002_022cf16c[a & 1]
                                             + 0x30 + slot * 0x14));
        } else {
            u8 *sel;
            if (*(int *)data_ov002_022cf16c == a &&
                *(int *)(data_ov002_022cf16c[0]._b + 0x1c) == cmd)
                sel = data_ov002_022d016c;
            else
                sel = data_ov002_022cd4cc;
            return func_ov002_021ba9e8((int)sel);
        }
    }
}
