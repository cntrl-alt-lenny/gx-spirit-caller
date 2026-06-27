/* CAMPAIGN-PREP candidate for func_0223b228 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two-bit gate; smulbb=short*short via (short) trunc; lo/hi byte forwarded live; stack-arg order
 *   risk:       reshape-able (arg-order): the final 021d5a08 stack args 4,0 stored [sp],[sp+4] before the call — if mwcc reorders push or passes b/a in wrong regs, escape. smulbb needs both operands (short).
 *   confidence: med
 */
/* func_ov002_0223b228 (ov002, class D): two-bit gate on d016c[0xd0], then
 * resolve a row via 0223de94's packed byte result, smulbb*20 index into the
 * cf1a4 per-player table, and on hit fire 021d5a08 with two stack args. The
 * de94 result's lo/hi bytes are forwarded live to the final call. */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

extern char data_ov002_022cf1a4[];
extern int  data_ov002_022d016c[];
extern int  func_ov002_021d5a08(void *self, int b, int a, int hw, int four, int zero);
extern int  func_ov002_0223de94(int a, int b);
extern int  func_ov002_0223df38(int a, int b);

int func_ov002_0223b228(void *self) {
    u32 g = (u32)*(int *)((char *)data_ov002_022d016c + 0xd0);
    int raw, a, b;
    short s;
    if (g & 1) return 0;
    if (!((g >> 1) & 1)) return 0;
    if (func_ov002_0223df38(0, 0) == 0) return 0;
    raw = func_ov002_0223de94(self, 0);
    b = raw & 0xff;
    s = (short)raw;
    a = (s >> 8) & 0xff;
    {
        char *tbl = data_ov002_022cf1a4 + (b & 1) * 0x868;
        if (*(u16 *)(tbl + a * 20) == 0) return 0;
    }
    return func_ov002_021d5a08(self, b, a, (int)*(u16 *)self, 4, 0);
}
