/* CAMPAIGN-PREP candidate for func_022061e0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     call(1-b0) + proven (1-b0)&1*0x868 select; table-first add; >0 bool
 *   risk:       reshape-able: add operand order is table-first (add r0,table,call) — declaring t after r but writing (t+r) should pick it; if mwcc emits (r+t) flip to (t+r) order. cf178 select idiom proven. b0 reload across the call is the secondary risk.
 *   confidence: med
 */
/* func_ov002_022061e0 (ov002, D) — 021bbeac(1-b0) summed with a (1-b0)-indexed
 * cf178 table slot; return (table + call) > 0.
 *   b0 = [r4,#2] lsl#0x1f;lsr#0x1f ; rsb #1 -> (1-b0) passed to 021bbeac.
 *   [r4,#2] RELOADED for the table index extract.
 *   tail: t = cf178[((1-b0)&1)*0x868]; r = t + call_result; return r > 0.
 *     asm add operand order: add r0, r1(table), r0(call) -> table first. */
typedef unsigned short u16;
struct S022061e0 { u16 f0; u16 b0 : 1; u16 rest : 15; };

extern char data_ov002_022cf178[];
extern int  func_ov002_021bbeac(int side);

int func_ov002_022061e0(struct S022061e0 *self) {
    int r = func_ov002_021bbeac(1 - self->b0);
    int t = *(int *)(data_ov002_022cf178 + ((1 - self->b0) & 1) * 0x868);
    return (t + r) > 0;
}
