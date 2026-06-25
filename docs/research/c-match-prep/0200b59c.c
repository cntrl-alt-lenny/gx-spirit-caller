/* CAMPAIGN-PREP candidate for func_0200b59c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     alloc + null-guard + STORE-ORDER field stores (base+off vs plain)
 *   risk:       src/dst offsets guessed; store order assumed to match source order; alloc-null guard via movs result
 *   confidence: med
 */
/* func_0200b59c — alloc a 0x18 task, zero it, then store six fields (base+off and plain). */

extern void *Task_PostLocked(int size, int align, int flags);
extern void Fill32(int val, void *dst, int n);

typedef struct {
    char _p[0x18];
    int  f18;   /* 0x18 */
    int  _p1;   /* 0x1c */
    int  f20;   /* 0x20 */
    int  _p2;   /* 0x24 */
    int  f28;   /* 0x28 */
    int  _p3;   /* 0x2c */
    int  f30;   /* 0x30 */
    int  f34;   /* 0x34 */
    int  f38;   /* 0x38 */
} Src13;

typedef struct {
    int   f0;    /* 0x0 */
    char *f4;    /* 0x4 */
    char *f8;    /* 0x8 */
    char *fc;    /* 0xc */
    int   f10;   /* 0x10 */
    char *f14;   /* 0x14 */
} Dst13;

Dst13 *func_0200b59c(Src13 *s)
{
    Dst13 *d = (Dst13 *)Task_PostLocked(0x18, 4, 0);
    if (d) {
        Fill32(0, d, 0x18);
        d->f0  = s->f18;
        d->f4  = (char *)s + s->f20;
        d->f8  = (char *)s + s->f28;
        d->fc  = (char *)s + s->f30;
        d->f10 = s->f34;
        d->f14 = (char *)s + s->f38;
    }
    return d;
}
