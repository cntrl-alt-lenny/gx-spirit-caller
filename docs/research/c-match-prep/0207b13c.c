/* CAMPAIGN-PREP candidate for func_0207b13c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     read+zero s16 at +0x2280, forward as 1st arg to func_0207b0e0
 *   risk:       struct offset 0x2280 guessed; the saved-s16 becomes arg0 while a/b/c shift to args 2-4 and orig r3 to the stack arg — arg threading may reorder under reg-alloc
 *   confidence: low
 */
/* func_0207b13c: read a signed halfword from the global singleton at byte
 * offset 0x2280, zero that slot, then call func_0207b0e0 passing the
 * previously-stored halfword as the first argument and shifting this
 * function's own args (a,b,c) into positions 2..4, with d as the 5th
 * (stack) argument.
 *
 *   s = (*data_021a088c)->slot_2280;   // ldrsh
 *   (*data_021a088c)->slot_2280 = 0;
 *   func_0207b0e0(s, a, b, c, d);
 *
 * mwcc splits the base as +0x2200 then field +0x80 = 0x2280.
 */

typedef struct {
    char _pad[0x2280];
    short slot_2280;   /* +0x2280 (ldrsh / strh) */
} Singleton2;

extern Singleton2 *data_021a088c;
extern void func_0207b0e0(int first, int a, int b, int c, int d);

void func_0207b13c(int a, int b, int c, int d) {
    short s = data_021a088c->slot_2280;
    data_021a088c->slot_2280 = 0;
    func_0207b0e0(s, a, b, c, d);
}
