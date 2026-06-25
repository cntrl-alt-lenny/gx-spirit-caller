/* CAMPAIGN-PREP candidate for func_020548b4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     dual separate-index loop + bind base across iters
 *   risk:       loop bound emits blt vs the original bcc (unsigned) -> may need unsigned i
 *   confidence: med
 */
/* func_020548b4: 16-iteration loop, dual index (byte index i, output
 * index j=i*2 kept as a SEPARATE incrementing counter). Calls
 * func_020a978c(dst+j, data_020ffbcc, src[i]) - likely a per-byte hex
 * format. data_020ffbcc reloaded? no: held in r4 across the loop, so
 * bind it to one local. */

extern char data_020ffbcc[];
extern void func_020a978c(char *out, char *fmt, int val);

void func_020548b4(unsigned char *src, char *dst) {
    char *fmt = data_020ffbcc;
    int i;
    int j = 0;

    for (i = 0; i < 16; i++) {
        func_020a978c(dst + j, fmt, src[i]);
        j += 2;
    }
}
