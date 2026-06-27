/* CAMPAIGN-PREP candidate for func_0201a044 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind sys r4; (x<<k>>k) extracts; 2*term operand-first adds; /409600 magic 0x51eb851f>>17
 *   risk:       permuter-class: scale computed first but multiplied last + 2a+2b+1 reassociation -> mwcc may reschedule the mul/add chain or pick highword>>17 only if it folds /409600 as 4096*100.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0201a044 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Bitfield extracts + unsigned magic divide.
 *   sys=GetSystemWork() bound r4; scale=func_0201a170(5) computed FIRST, multiplied LAST.
 *   acc = (lit52>>1) + 2*((e0<<11>>24)) + 2*((d4&0xffff)-(e4&0xffff));
 *   return scale * (50*(acc+1)) / 409600;   // 409600 = 4096*100, magic 0x51eb851f >>17
 */
extern char *GetSystemWork(void);
extern int func_0201a170(int);
extern unsigned short data_0210594c[];

int func_0201a044(void) {
    char *r4 = GetSystemWork();
    int scale = func_0201a170(5);
    int e4 = (unsigned int)((unsigned int)*(int *)(r4 + 0x8e4) << 0x10) >> 0x10;
    int e0 = (unsigned int)((unsigned int)*(int *)(r4 + 0x8e0) << 0xb) >> 0x18;
    int d4 = (unsigned int)((unsigned int)*(int *)(r4 + 0x8d4) << 0x10) >> 0x10;
    int h = (int)data_0210594c[0x52 / 2] >> 1;
    int acc = h + (e0 << 1) + ((d4 - e4) << 1);
    return (unsigned int)(scale * ((acc + 1) * 0x32)) / 409600U;
}
