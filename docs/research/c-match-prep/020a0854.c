/* CAMPAIGN-PREP candidate for func_020a0854 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     dc30 guard + guard chain (one beq-skip) + 020928e8 + de5c + dd30
 *   risk:       dd30 vararg with str r5 [sp] (4th payload on stack) ordering; the p1==0 beq-skip-over-928e8 control flow may reorder vs source.
 *   confidence: low
 */
/* func_020a0854: dc30(p0) guard; p1>3 ->6; if(p1!=0){ if(p3==0) return 6;
 * func_020928e8(p3,0x50); }  de5c(0x27,p0); dd30(0x27, 3, p1, p3, p2). */

extern int  func_020928e8(void *p, int len);
extern int  func_0209dc30(int a0);
extern void func_0209de5c(int code, int handle);
extern int  func_0209dd30(int code, int count, ...);

int func_020a0854(int p0, int p1, int p2, int p3) {
    int r = func_0209dc30(p0);
    if (r != 0) return r;
    if ((unsigned)p1 > 3) return 6;
    if (p1 != 0) {
        if (p3 == 0) return 6;
        func_020928e8((void *)p3, 0x50);
    }
    func_0209de5c(0x27, p0);
    r = func_0209dd30(0x27, 3, p1, p3, p2);
    return r == 0 ? 2 : r;
}
