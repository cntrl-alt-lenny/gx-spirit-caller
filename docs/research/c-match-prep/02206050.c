/* CAMPAIGN-PREP candidate for func_02206050 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     3 reloaded bit0 gates + proven (1-b0)&1 *0x868 mul-select
 *   risk:       reshape-able: the (1-b0)&1*0x868 cf178 select is a PROVEN idiom (matched 022003c4/0220378c -> rsb;and;mul). Risk is b0 being cached vs reloaded across the 3 gates (orig does 3 ldrh); if mwcc hoists b0 to callee-saved, 2 ldrh vanish — re-read self->b0 each gate.
 *   confidence: med
 */
/* func_ov002_02206050 (ov002, D) — three sequential predicate gates then a
 * (1-b0)-indexed cf178 table select.
 *   each gate: 021bb90c(b0, KIND); if ==0 return 0.  KINDs 0x15ca/cb/cc.
 *   b0 = [r4,#2] lsl#0x1f;lsr#0x1f (RELOADED before each gate: 3 ldrh).
 *   tail: v = cf178[((1-b0)&1)*0x868]; return v ? 2 : 1.
 *     asm: rsb r2,#1; and #1; mul r0,r2,#0x868; ldr [cf178,r0]; movne#2;moveq#1 */
typedef unsigned short u16;
struct S02206050 { u16 f0; u16 b0 : 1; u16 rest : 15; };

extern char data_ov002_022cf178[];
extern int  func_ov002_021bb90c(int b0, int kind);

int func_ov002_02206050(struct S02206050 *self) {
    int v;
    if (func_ov002_021bb90c(self->b0, 0x15ca) == 0) return 0;
    if (func_ov002_021bb90c(self->b0, 0x15cb) == 0) return 0;
    if (func_ov002_021bb90c(self->b0, 0x15cc) == 0) return 0;
    v = *(int *)(data_ov002_022cf178 + ((1 - self->b0) & 1) * 0x868);
    return v ? 2 : 1;
}
