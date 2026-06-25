/* CAMPAIGN-PREP candidate for func_0209b384 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard early-return; spin invariants 8/1 in r5/r4; clear-loop i<5 strh at base+i*8; tail load-store global
 *   risk:       Clear loop: orig does mov r1,i*8; add i; strh (offset captured before increment). A plain for with base+i*8 matches, but mwcc may strength-reduce the index to a pointer walk diverging the add/strh pairing. reshape-able (pointer-walk vs index) / permuter-class.
 *   confidence: med
 */
/* func_0209b384: reset init + channel-spin + array-clear loops. */

extern unsigned short data_021a83cc;
extern int   data_021a83dc;

typedef struct {
    /* 0x00 */ int field_0;
    /* 0x04 */ int field_4;
} Struct_021a83e4;
extern Struct_021a83e4 data_021a83e4;

extern short data_021a840c[];   /* halfword array, stride 8 */
extern int   data_021a83f4;

extern void func_02096228(void);
extern int  func_0209640c(int ch, int on);
extern void func_02096434(int ch, void *cb);
extern void func_02092844(int *p);
extern void func_0209b298(void);

void func_0209b384(void) {
    int i;
    if (data_021a83cc != 0) return;
    data_021a83cc = 1;
    data_021a83e4.field_0 = 0;
    data_021a83e4.field_4 = 0;
    func_02096228();
    while (func_0209640c(8, 1) == 0)
        ;
    func_02096434(8, (void *)func_0209b298);
    for (i = 0; i < 5; i++)
        *(short *)((char *)data_021a840c + (i << 3)) = 0;
    func_02092844(&data_021a83f4);
    data_021a83dc = *(int *)0x027ffc3c;
}
