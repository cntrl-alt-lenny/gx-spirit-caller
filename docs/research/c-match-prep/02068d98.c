/* CAMPAIGN-PREP candidate for func_02068d98 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: byteswap16 via shift-or; u16 cast gives lsl16/lsr16; passthru stack arg
 *   risk:       reshape-able: orig schedules `str ip,[sp]` before the orr; arg-eval/scheduling order of the spilled stack arg vs the swap may reorder a few movs.
 *   confidence: med
 */
/* func_02068d98 — byteswap16 pack + extra stack arg, then forward to packetizer.
 *   r0=ctx, r1=val(->func_02054c0c), r2=raw16, r3=passthru, [sp,#0x18]=stack arg.
 *   func_0206950c(ctx+0x4c, func_02054c0c(r1), swap16(r2), r3, stackarg).
 */
typedef unsigned short u16;

extern int func_02054c0c(int v);
extern int func_0206950c(void *p, int a, int b, int c, int d);

int func_02068d98(char *ctx, int val, u16 raw, int passthru, int stackarg)
{
    u16 swap = (u16)(((raw >> 8) & 0xff) | ((raw << 8) & 0xff00));
    return func_0206950c(ctx + 0x4c, func_02054c0c(val), swap, passthru, stackarg);
}
