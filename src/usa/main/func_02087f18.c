/* CAMPAIGN-PREP candidate for func_02087f18 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (x<<30)>>31 bit1-extract guard; if+do-while (beq guard then bne loop); 1<<f40 mask; arg held in r4
 *   risk:       Guard ((x<<30)>>31): asymmetric shift won't map to a symmetric :N bitfield; mwcc may emit lsl#30;asr#31 OR optimize the !=0 test to tst/and #2. reshape-able (keep explicit shifts; do NOT use a bitfield here).
 *   confidence: med
 */
/* func_02087f18 (main, class C/D). irq-guarded loop + shifted mask store.
 * r4=arg0 held. Guard: ((s32)([+0x24]<<30))>>31 == 0 -> return (tests bit1).
 * while ([+0x38] != 0) { irq=OS_DisableIrq(); func_02087fd4(arg0,1);
 *   OS_RestoreIrq(irq); }  -- but checked AFTER first [+0x38] test (do/guard).
 * Then func_02094fac([+0x44], 0, 1<<[+0x40], 0).
 */

struct S88000 {
    char         _pad00[0x24];
    unsigned int f24;         /* +0x24 (bitfield source) */
    char         _pad28[0x38 - 0x28];
    int          f38;         /* +0x38 */
    char         _pad3c[0x40 - 0x3c];
    int          f40;         /* +0x40 shift amount */
    int          f44;         /* +0x44 handle */
};

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int irq);
extern void func_02087fd4(struct S88000 *p, int v);
extern void func_02094fac(int a0, int a1, int a2, int a3);

void func_02087f18(struct S88000 *p) {
    if ((((int)(p->f24 << 30)) >> 31) == 0) return;

    if (p->f38 != 0) {
        do {
            int irq = OS_DisableIrq();
            func_02087fd4(p, 1);
            OS_RestoreIrq(irq);
        } while (p->f38 != 0);
    }

    func_02094fac(p->f44, 0, 1 << p->f40, 0);
}
