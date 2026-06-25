/* CAMPAIGN-PREP candidate for func_0204d468 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Copy32 wrapper + unsigned guard (n>2) + two field stores
 *   risk:       Copy32 arg order (dst,src,n); n+2 unsigned compare; f348/f34c/0x350 offsets
 *   confidence: med
 */
/* func_0204d468: n = a1->f0 + 2; if ((unsigned)n > 2)
 *   Copy32((char*)a1 + 4, (char*)acc() + 0x350, (n - 2) << 2);
 * acc()->f348 = n - 1; acc()->f34c = a0.  Copy32(dst,src,nbytes). a1->f0 is
 * the source element count; dst is the input buffer at a1+4. */

typedef struct {
    char _pad0[0x348];
    int  f348; /* +0x348 */
    int  f34c; /* +0x34c */
} State0204d468;

extern State0204d468 *func_020498f0(void);
extern void Copy32(void *dst, void *src, int nbytes);

void func_0204d468(int a0, int *a1) {
    int n = a1[0] + 2;
    if ((unsigned)n > 2)
        Copy32((char *)a1 + 4, (char *)func_020498f0() + 0x350, (n - 2) << 2);
    func_020498f0()->f348 = n - 1;
    func_020498f0()->f34c = a0;
}
