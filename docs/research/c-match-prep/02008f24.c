/* CAMPAIGN-PREP candidate for func_02008f24 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     3-way if-chain dispatch; :3 bitfield store; bind b+1; preserve store-then-call order
 *   risk:       orig hoists `add r0,r5,#1` (b+1) ABOVE the strb of the bitfield; if mwcc schedules the byte-store first the two instrs swap. reshape-able (compute b+1 / reorder stmts).
 *   confidence: med
 */
/* func_02008f24: 3-way dispatch on selector, then field marshalling (case 1).
   sel->r6, b(arg1)->r5, c(arg2)->r4 all survive the bl func_02008c10. */
extern void func_02008c10(int sel, int b, unsigned char *c);
extern int  func_02008d60(int b, unsigned char *c);
extern void func_020945f4(void *p, int v, unsigned n);   /* memset */
extern int  func_02011b68(int x);
extern int  func_02011b4c(int x);
extern void func_020aadf8(unsigned char *p, int v);
extern int  func_02011b9c(unsigned char *p, int v);

/* data_02104f3c: word at 0x14 holds an unsigned :3 bitfield in its low bits
   (asm: ldr [.,#0x14]; lsl#29; lsr#29 -> bitfield, not a plain mask). */
extern struct G02104f3c { char pad[0x14]; unsigned bf : 3; } data_02104f3c;

int func_02008f24(int sel, int b, unsigned char *c)
{
    func_02008c10(sel, b, c);
    if (sel == 0)
        return func_02008d60(b, c);
    if (sel == 1) {
        int v;
        func_020945f4(c, 0, 0x124);
        *c = (unsigned char)data_02104f3c.bf;
        v = func_02011b68(b + 1);
        func_020aadf8(c + 1, v);
        v = func_02011b4c(b + 1);
        return func_02011b9c(c + 0x1c, v);
    }
    return 0;
}
