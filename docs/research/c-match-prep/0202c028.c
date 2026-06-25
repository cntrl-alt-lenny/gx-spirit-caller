/* CAMPAIGN-PREP candidate for func_0202c028 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     alloc + indexed u16 load before null-guard + invoke
 *   risk:       ldrh may emit [r4,idx,lsl#1] vs asm's separate lsl+ldrh; load-before-branch ordering must hold
 *   confidence: med
 */
/* func_0202c028: p = func_02006c0c(data_020c6ae0, 4, 0);
 * idx = func_0202b0b4(a0); r = p[idx] (u16, loaded before the guard);
 * if (p) Task_InvokeLocked(p); return r. */

extern unsigned short *func_02006c0c(void *p, int n, int m);
extern unsigned short  func_0202b0b4(int id);
extern void            Task_InvokeLocked(void *p);
extern char            data_020c6ae0[];

int func_0202c028(int a0) {
    unsigned short *p = func_02006c0c(data_020c6ae0, 4, 0);
    int idx = func_0202b0b4(a0);
    unsigned short r = p[idx];
    if (p != 0)
        Task_InvokeLocked(p);
    return r;
}
