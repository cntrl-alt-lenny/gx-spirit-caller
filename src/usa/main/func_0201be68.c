/* CAMPAIGN-PREP candidate for func_0201be68 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Copy32(dest,src,len); orr2/bic2 around callback; bool=(f8==0&&f10==0)?0:1 via cmpeq chain
 *   risk:       reshape-able: the bool return is `cmp f8,#0; ldreq f10; cmpeq f10,#0; movne r0,#1; moveq r0,#0` (f10 load predicated on f8==0) — if mwcc loads f10 unconditionally the ldreq becomes a plain ldr; keep the && so the second load stays conditional.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0201be68 (main, class C) — UNVERIFIED build-free draft.
 * Sibling of func_0201bec4. Copy32 marshalling into syswork + flag set/clear around a callback.
 *   a = r0 (kept r5); w = GetSystemWork() (r4);
 *   Copy32(w+0x810, a, 0x20);          // (dest, src, len)
 *   *(int*)(w+0x8e0) |= 2;
 *   func_0201bd9c(a);
 *   *(int*)(w+0x8e0) &= ~2;
 *   return (a->f8==0 && a->f10==0) ? 0 : 1;   // cmp;ldreq;cmpeq;movne1/moveq0 */
extern char *GetSystemWork(void);
extern void Copy32(void *dest, void *src, int len);
extern void func_0201bd9c(char *a);

int func_0201be68(char *a) {
    char *w = GetSystemWork();
    Copy32(w + 0x810, a, 0x20);
    *(int *)(w + 0x8e0) |= 2;
    func_0201bd9c(a);
    *(int *)(w + 0x8e0) &= ~2;
    return !(*(int *)(a + 8) == 0 && *(int *)(a + 0x10) == 0);
}
