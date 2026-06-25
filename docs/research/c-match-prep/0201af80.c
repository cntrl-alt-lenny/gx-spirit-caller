/* CAMPAIGN-PREP candidate for func_0201af80 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ip-held base ptr scan; short-circuit && of three packed-field extracts; return ptr-or-0
 *   risk:       permuter-class: orig keeps the table base in ip and re-derives each shifted field into r1 with cmpeq chaining (`moveq r1,w<<k`); mwcc will hoist w into a reg and order the extracts differently — register/scheduling, not C-shape; already shipped as .s for this reason.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_0201af80 (main, class C) — UNVERIFIED build-free draft.
 * NOTE: this function is ALREADY shipped as src/main/func_0201af80.s (whole-function .s endgame).
 * Linear scan over a packed-record table data_020c59ec; on a 3-field match returns &record else 0.
 *   a = r0 (kept r5); b = func_02018f80() (r4); c = func_02018f90() (r0).
 *   p = data_020c59ec;
 *   for (i=0; i<1; i++) {                       // single iteration (cmp r3,#1; bcc)
 *       w = p[0];
 *       if (b == ((w<<0x18)>>0x18) &&            // byte field [7:0]
 *           c == ((w<<0x14)>>0x1c) &&            // nibble field [15:12]
 *           a == ((w<<0xc)>>0x18))               // byte field [19:12]? -> (w<<0xc)>>0x18 = bits 19:12
 *           return (int)p;
 *       p++;
 *   }
 *   return 0;
 * Packed compares are bitfields read via lsl/lsr; emit as masked extracts in this exact order. */
extern unsigned int data_020c59ec[];
extern int func_02018f80(void);
extern int func_02018f90(void);

int func_0201af80(int a) {
    int b = func_02018f80();
    int c = func_02018f90();
    unsigned int *p = data_020c59ec;
    int i;
    for (i = 0; i < 1; i++) {
        unsigned int w = *p;
        if (b == (int)((w << 0x18) >> 0x18) &&
            c == (int)((w << 0x14) >> 0x1c) &&
            a == (int)((w << 0xc) >> 0x18))
            return (int)p;
        p++;
    }
    return 0;
}
