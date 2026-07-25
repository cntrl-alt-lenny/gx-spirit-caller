/* CAMPAIGN-PREP candidate for func_0203a0b4 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     orr operand-order guard; flag accumulate; conditional set bit
 *   risk:       r4 holds accumulator across the two calls (callee-saved) — should match; orrs vs separate cmp ordering stable
 *   confidence: high
 */
/* func_0203a0b4: build a result flag word from two sub-queries.
 *   if ((g->h0 | g->h2) != 0 && func_02039cd8() == 1) r = 1; else r = 0;
 *   if (func_0203c38c() >= 3) { func_0203b8ac(r); r |= 0x80; }
 *   return r;
 * orrs r0,r1,r0 -> first operand g->h0 picks dest (operand order).
 */

typedef struct {
    unsigned short h0;   /* +0x00 */
    unsigned short h2;   /* +0x02 */
} Flags;

extern Flags data_0219c3a0;
extern int  func_02039cd8(void);
extern int  func_0203c38c(void);
extern void func_0203b8ac(int r);

int func_0203a0b4(void) {
    int r = 0;

    if ((data_0219c3a0.h0 | data_0219c3a0.h2) != 0) {
        if (func_02039cd8() == 1) {
            r = 1;
        }
    }
    if (func_0203c38c() >= 3) {
        func_0203b8ac(r);
        r |= 0x80;
    }
    return r;
}
