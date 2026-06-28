/* CAMPAIGN-PREP candidate for func_0202bfd4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     alloc + indexed u16 load before null-guard + invoke
 *   risk:       ldrh may emit [r4,idx,lsl#1] vs asm's separate lsl+ldrh; load-before-branch ordering must hold
 *   confidence: med
 */
/* func_0202bfd4: p = func_02006bf0(data_020c6a00, 4, 0);
 * idx = func_0202b060(a0); r = p[idx] (u16, loaded before the guard);
 * if (p) Task_InvokeLocked(p); return r. */

extern unsigned short *func_02006bf0(void *p, int n, int m);
extern unsigned short  func_0202b060(int id);
extern void            Task_InvokeLocked(void *p);
extern char            data_020c6a00[];

int func_0202bfd4(int a0) {
    unsigned short *p = func_02006bf0(data_020c6a00, 4, 0);
    int idx = func_0202b060(a0);
    unsigned short r = p[idx];
    if (p != 0)
        Task_InvokeLocked(p);
    return r;
}
