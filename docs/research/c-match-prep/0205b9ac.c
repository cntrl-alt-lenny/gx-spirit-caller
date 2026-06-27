/* CAMPAIGN-PREP candidate for func_0205b9ac (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order b3/b2/low (callee-saved across calls); operand-order on extracts; no-CSE twin calls
 *   risk:       reshape-able: orig keeps b3,b2,low in r7/r6/r5 across the first call; if mwcc reorders the three decls or CSEs the 2nd func_0205ba5c, regs/calls diverge.
 *   confidence: med
 */
/* func_0205b9ac: split a packed int into byte3/byte2/low16, validate via
 * func_0205ba5c, and on success write the three pieces back through out
 * pointers (r2, r3, and the first stack arg). On validation failure log
 * and return 2. asr#0x18/asr#0x10 then and#0xff => signed >>24/>>16 & 0xff;
 * and r1,0xffff => low halfword. func_0205ba5c is called twice with the
 * same three args (orig does NOT CSE the call). */

extern char data_02100a20[];
extern char data_02100a64[];
extern char data_02100a7c[];
extern int  func_0205ba5c(int b3, int b2, int low16);
extern void func_0205ffc0(void *holder, void *tag);
extern void func_020a6d54(void *a, void *b, int c, int d);

int func_0205b9ac(void *holder, int packed, int *out_b3, int *out_b2, int *out_low) {
    int b3 = (packed >> 24) & 0xff;
    int b2 = (packed >> 16) & 0xff;
    int low = packed & 0xffff;

    if (func_0205ba5c(b3, b2, low) == 0) {
        func_020a6d54(data_02100a64, data_02100a20, 0, 0xb7);
    }
    if (func_0205ba5c(b3, b2, low) != 0) {
        *out_b3 = b3;
        *out_b2 = b2;
        *out_low = low;
        return 0;
    }
    func_0205ffc0(holder, data_02100a7c);
    return 2;
}
