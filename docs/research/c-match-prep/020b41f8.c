/* CAMPAIGN-PREP candidate for func_020b41f8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: decl-order count/buf/i; *count store before tail-incr; strb full word low byte
 *   risk:       orig folds the CR/LF test as cmp #0xd;cmpne #0xa with strb scheduled BETWEEN; if mwcc emits both cmps before the store, 1-2 insns reorder (reshape-able: keep buf[i]= as its own statement before the if).
 *   confidence: med
 */
/* func_020b41f8 (main, C) — readline into buf until CR/LF or count reached.
 * r6=count*, r5=*count(limit), r7=buf, r4=i. On CR(0x0d)/LF(0x0a) store
 * *count=i+1 and return 0; otherwise fill up to *count bytes. r3 in the
 * push is the AAPCS 8-byte-align filler (6 regs incl lr).
 * Decl-order: count ptr, then buf, then i (first-used-first-allocated). */

extern int func_020b41d4(void);

int func_020b41f8(unsigned char *buf, unsigned int *count) {
    unsigned int limit = *count;
    unsigned int i = 0;
    if (limit != 0) {
        do {
            int c = func_020b41d4();
            unsigned int low = c & 0xff;
            buf[i] = (unsigned char)c;
            if (low == 0x0d || low == 0x0a) {
                *count = i + 1;
                break;
            }
            i++;
        } while (i < limit);
    }
    return 0;
}
