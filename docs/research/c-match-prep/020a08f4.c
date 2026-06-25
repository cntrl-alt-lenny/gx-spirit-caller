/* CAMPAIGN-PREP candidate for func_020a08f4 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     dc30 guard + guard chain (one beq-skip) + 020928e8 + de5c + dd30, no frame
 *   risk:       dd30 3-arg vararg (r2=p1,r3=p2 in regs only, no stack spill) + the p1==0 skip control flow may reorder vs source.
 *   confidence: med
 */
/* func_020a08f4: dc30(p0) guard; p1>3 ->6; if(p1!=0){ if(p2==0) return 6;
 * func_020928e8(p2,0x50); }  de5c(0x14,p0); dd30(0x14, 2, p1, p2). */

extern int  func_020928e8(void *p, int len);
extern int  func_0209dc30(int a0);
extern void func_0209de5c(int code, int handle);
extern int  func_0209dd30(int code, int count, ...);

int func_020a08f4(int p0, int p1, int p2) {
    int r = func_0209dc30(p0);
    if (r != 0) return r;
    if ((unsigned)p1 > 3) return 6;
    if (p1 != 0) {
        if (p2 == 0) return 6;
        func_020928e8((void *)p2, 0x50);
    }
    func_0209de5c(0x14, p0);
    r = func_0209dd30(0x14, 2, p1, p2);
    return r == 0 ? 2 : r;
}
