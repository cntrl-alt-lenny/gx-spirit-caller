/* CAMPAIGN-PREP candidate for func_02034948 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: &0x7ff + u16 lsl16;lsr16 extract; struct field loads in order
 *   risk:       Orig RELOADS rec->half2/half4 after the func_02094688 call (not cached across the call) and keeps the 0x7ff literal in r8 across iters; mwcc may cache the halfwords or re-materialize the constant. Reload reshape-able by re-reading post-call; reg-pinning of literal is permuter-class. Rec offsets struct-guessed.
 *   confidence: med
 */
/* func_02034948: IRQ-bracketed iterator. Loop: func_02032350(); rec =
 * func_0203244c(&local); if rec==0 return 0. id = rec->half0 & 0x7ff (u16);
 * if id != key return 0. func_02094688(rec+8, base + rec->half2, rec->half4).
 * If (rec->byte6 & 2): func_02032350(); func_020324c0(); return rec->half2 +
 * rec->half4. Else func_02032350(); func_020324c0(); loop again.
 * A 4-byte stack local is passed by address to func_0203244c.
 */
extern int   func_02032350(void);
extern void *func_0203244c(void *out);
extern void  func_020324c0(void);
extern void  func_02094688(void *dst, int a, int n);

struct Rec_2034948 {
    unsigned short half0;   /* +0x0, &0x7ff = id */
    unsigned short half2;   /* +0x2 */
    unsigned short half4;   /* +0x4 */
    unsigned char  byte6;   /* +0x6, &2 flag */
};

int func_02034948(unsigned int key, int base) {
    int local;
    struct Rec_2034948 *rec;
    for (;;) {
        func_02032350();
        rec = (struct Rec_2034948 *)func_0203244c(&local);
        if (rec == 0) return 0;
        if ((unsigned int)(rec->half0 & 0x7ff) != key) return 0;
        func_02094688((char *)rec + 8, base + rec->half2, rec->half4);
        if (rec->byte6 & 2) {
            func_02032350();
            func_020324c0();
            return rec->half2 + rec->half4;
        }
        func_02032350();
        func_020324c0();
    }
}
