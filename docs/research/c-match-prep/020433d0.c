/* CAMPAIGN-PREP candidate for func_020433d0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: bind *self to r4 alloc reused; stmia 3-word struct-copy from in; store-order
 *   risk:       reshape-able: orig reloads data_0219d9f0 from memory at each use (ldr r1,_LIT0; ldr from [r1]) rather than caching. If mwcc caches the global ptr in a reg, the repeated ldr/str pattern diverges (bind-vs-reload).
 *   confidence: low
 */
/* func_020433d0 - main - class C/D
 * init: blx alloc + 12-byte struct-copy stmia + early-exits returning 4
 * r4 = (*self) fn ptr (allocator), reused for both blx calls
 * data_0219d9f0 / data_0219d9fc are the two allocated-ptr globals
 */
extern unsigned char data_020feba4[];
extern unsigned char data_020febb8[];
extern int data_0219d9f0;
extern int data_0219d9f8;
extern int data_0219d9fc;
extern void func_02043168(void);
extern void func_02092844(void *p);
extern void func_020945f4(int p, int v, int n);

typedef struct { int x, y, z; } Triple;

int func_020433d0(Triple *in)
{
    int (*alloc)(void *tag, int sz);

    alloc = *(int (**)(void *, int))in;
    if (data_0219d9f0 != 0)
        return 4;
    data_0219d9f0 = alloc(data_020feba4, 0x11f4);
    if (data_0219d9f0 == 0)
        return 4;
    func_020945f4(data_0219d9f0, 0, 0x11f4);
    *(int *)(data_0219d9f0 + 0x1004) = 0xfffe7961;
    *(Triple *)(data_0219d9f0 + 0x1108) = *in;
    if (data_0219d9fc != 0)
        return 4;
    data_0219d9fc = alloc(data_020febb8, 0x1c10);
    if (data_0219d9fc == 0)
        return 4;
    func_02092844((void *)(data_0219d9f0 + 0x11dc));
    data_0219d9f8 = 0;
    func_02043168();
    return 0;
}
