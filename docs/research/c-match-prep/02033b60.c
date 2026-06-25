/* CAMPAIGN-PREP candidate for func_02033b60 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     inline idx*0xc and n*65 (no shared-base CSE); arr2 guard movne/moveq; reload arr1 in 2nd block
 *   risk:       Second block reloads [r8,#0xc] twice (strb then add r1); my single 'self->arr1' may CSE into one ldr — reshape-able by forcing a reload. mask arg from [sp,#0x20] 5th-arg position assumed.
 *   confidence: low
 */
/* func_02033b60 (main, class C) — mul index *0xc, shifted-adds, two func_02033ac0 sites.
 * r0=self(r8), r1=base(r7), r2=lim(r9), r3=idx(r6). r4=idx*0xc held. arr1 stride4 @0xc; arr2 stride0x104 @0x10. */
typedef struct {
    signed char  f0;            /* +0x00 */
    unsigned char _p1[2];
    signed char  cnt;           /* +0x03 */
    unsigned char _p4[0xc - 4];
    int         *arr1;          /* +0x0c */
    void        *arr2;          /* +0x10 */
} Obj_02033b60;

extern int  func_02053170(void *slot);
extern int  func_02033a80(Obj_02033b60 *self, int idx);
extern int  func_02033ac0(void *p0, int *o, void *a2, void *ctx, int mask);

void func_02033b60(Obj_02033b60 *self, char *base, int lim, int idx)
{
    int n;
    int slot = idx * 0xc;
    if (func_02053170(base + slot) == 0)
        return;
    n = func_02033a80(self, idx);
    if (n >= 0) {
        int *o = self->arr1 + n;
        void *a2;
        if (self->arr2 != 0)
            a2 = (char *)self->arr2 + (n + (n << 6)) * 4;
        else
            a2 = 0;
        func_02033ac0(self, o, a2, base + slot, -1);
        return;
    }
    {
        signed char k = self->cnt;
        int *o;
        void *a2;
        if (k >= lim)
            return;
        ((char *)self->arr1)[k << 2] = (char)idx;
        if (self->arr2 != 0)
            a2 = (char *)self->arr2 + (k + (k << 6)) * 4;
        else
            a2 = 0;
        o = (int *)((char *)self->arr1 + (k << 2));
        if (func_02033ac0(self, o, a2, base + slot, mask) != 0)
            self->cnt = k + 1;
    }
}
