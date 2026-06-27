/* CAMPAIGN-PREP candidate for func_02034388 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     f3c==0 guard; func_020321b0(func_02031eac(),...) chain; f3c &= ~result reload
 *   risk:       DUPLICATED func_02031eac: asm has ONE bl func_02031eac whose r0 feeds func_020321b0; my code calls it twice — MUST drop the bare first call. reshape-able (delete the standalone func_02031eac()).
 *   confidence: med
 */
/* func_02034388 (main, class C) — branchy init, many guard calls, chained 0203268c return.
 * r0=self(r4), r1=n(r5). f34=0; gate func_020338f8; build f38/f3c; finalize f3c via func_02033944. */
typedef struct {
    unsigned char _pad_00[0x34];
    int  f34;             /* +0x34 */
    unsigned char _p38[0x38 - 0x38];
    int  f38;             /* +0x38 */
    int  f3c;             /* +0x3c */
    unsigned char f40;    /* +0x40 */
} Obj_02034388;

extern int  func_0203268c(void);
extern int  func_020338f8(void);
extern int  func_02031eac(void);
extern int  func_020321b0(int a, unsigned char *p, int n);
extern int  func_02032644(void);
extern int  func_02033858(void);
extern int  func_02033944(int a, int b, unsigned char *p, int s);

void func_02034388(Obj_02034388 *self, int n)
{
    int s;
    self->f34 = 0;
    func_0203268c();
    if (func_020338f8() == 0)
        return;
    if (self->f3c == 0) {
        func_02031eac();
        self->f38 = func_020321b0(func_02031eac(), &self->f40, n);
        if (self->f38 != 0) {
            if (func_02032644() != 0) {
                self->f3c = 1;
            } else {
                func_0203268c();
                self->f3c = func_02033858();
            }
        }
    }
    s = self->f38;
    if (s != 0) {
        func_0203268c();
        self->f3c &= ~func_02033944(self->f3c, self->f3c, &self->f40, s);
    }
    self->f34 = 1;
}
