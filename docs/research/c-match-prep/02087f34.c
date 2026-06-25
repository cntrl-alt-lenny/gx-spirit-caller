/* CAMPAIGN-PREP candidate for func_02087f34 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order fc,f10,f8 exact; 5th arg via str [sp]; arg0 reused as mla index AND stored f10; pool literal &func_02087640
 *   risk:       Store order [+0xc],[+0x10],[+0x8] is non-monotonic; if mwcc sorts the three field inits ascending (0x8,0xc,0x10) the str sequence diverges. reshape-able (keep this exact statement order; do not let -O4 reorder).
 *   confidence: med
 */
/* func_02087f34 (main, class C). mla struct-base + struct init stores.
 * r6=arg0, r5=arg2 held. Call func_020897fc(arg1, arg2+0x14, &func_02087640,
 * 0, /*stack*/0) -> r4 result; if(!r4) return 0.
 * Stores in ASM order: [r4+0xc]=0; [r4+0x10]=arg0; [r4+0x8]=0.
 * func_02089938(r4+0x14, arg2); if(0) return 0; [r4+0x8]=result.
 * e=&data_021a4cb4[arg0] (stride 0x24, mla); func_0207d12c(e+0xc, r4); return 1.
 */

struct R87f34 {
    char _pad00[0x8];
    int  f8;                  /* +0x08 */
    int  fc;                  /* +0x0c */
    int  f10;                 /* +0x10 */
    char _pad14[0x4];         /* +0x14 sub-object (by address) */
};

struct E87f34 { char _pad[0x24]; };   /* stride 0x24 */

extern struct E87f34 data_021a4cb4[];
extern void func_02087640(void);
extern struct R87f34 *func_020897fc(int a0, void *a1, void *a2, int a3, int a4);
extern int  func_02089938(void *p, int q);
extern void func_0207d12c(void *base, void *elem);

int func_02087f34(int arg0, int arg1, char *arg2) {
    struct R87f34 *r;
    int rc;

    r = func_020897fc(arg1, arg2 + 0x14, (void *)func_02087640, 0, 0);
    if (r == 0) return 0;

    r->fc = 0;
    r->f10 = arg0;
    r->f8 = 0;

    rc = func_02089938((char *)r + 0x14, (int)arg2);
    if (rc == 0) return 0;
    r->f8 = rc;

    func_0207d12c((char *)&data_021a4cb4[arg0] + 0xc, r);
    return 1;
}
