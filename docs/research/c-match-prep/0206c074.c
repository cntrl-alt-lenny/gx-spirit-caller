/* CAMPAIGN-PREP candidate for func_0206c074 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (x+3)&~3 align => bic; reuse n*4-align as elem base; countdown loop n..1
 *   risk:       Operation order in the size sum: orig computes bic r5 (n*4) BEFORE bic r2 (n*44) then `add r0, n44, n4`. mwcc may emit the muls/bics in source order, swapping which goes in r2 vs r5 and breaking the r5-reuse-as-offset. reshape-able (reorder the two align temps), but fragile.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0206c074 (main, class C/D) - brief 494.
 * UNVERIFIED build-free draft. recipe: word-align expressions ((x+3)&~3) for
 * the bic; n*44 via mul; reuse the n*4-aligned size as the per-element base
 * offset (r5); allocate through (*g)->f18 fn-ptr; count-down init loop.
 */
/* sz = ((n*44+3)&~3) + ((n*4+3)&~3); mem=(*data_0219ecd8)->alloc(sz);
 * if(!mem) return -1; func_02092614(data_0219ed20,mem,n);
 * p = mem + ((n*4+3)&~3); for(i=n;i>0;i--){ func_0206bf60(p); p+=44; }
 * data_0219ed1c = mem; return 0. */

typedef struct { char _pad18[0x18]; void *(*f18)(int sz); } Allocator;

extern Allocator *data_0219ecd8;
extern void *data_0219ed20;
extern void *data_0219ed1c;
extern void func_02092614(void *tag, void *mem, int n);
extern void func_0206bf60(void *p);

int func_0206c074(int n)
{
    int idxsz = (n * 4 + 3) & ~3;
    char *mem;
    char *p;
    int i;
    mem = (char *)data_0219ecd8->f18(((n * 0x2c + 3) & ~3) + idxsz);
    if (mem == 0)
        return -1;
    func_02092614(data_0219ed20, mem, n);
    p = mem + idxsz;
    for (i = n; i > 0; i--) {
        func_0206bf60(p);
        p += 0x2c;
    }
    data_0219ed1c = mem;
    return 0;
}
