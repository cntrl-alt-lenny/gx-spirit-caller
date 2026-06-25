/* CAMPAIGN-PREP candidate for func_02088f94 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard early-return + arg branch + tail call; bind global
 *   risk:       struct offsets 0x3c/0x4c guessed from asm; could differ if real struct layout differs
 *   confidence: high
 */
/* func_02088f94 — guard chain (two globals) + arg branch + two tail bodies.
 * Holds &data_021a524c in one reg (bind); fields forced by asm offsets. */

typedef struct {
    int  f0;            /* 0x00 */
    int  f4;            /* 0x04 */
    char _pad08[0x34];  /* 0x08..0x3b */
    int  f3c;           /* 0x3c  (address taken) */
    char _pad40[0x0c];  /* 0x40..0x4b */
    int  f4c;           /* 0x4c */
} S_02088f94;

extern S_02088f94 data_021a524c;
extern void func_02088874(void);
extern void func_0208b0a4(void *p, int v);

void func_02088f94(int arg) {
    if (data_021a524c.f0 == 0) return;
    if (data_021a524c.f4 != 0) return;
    if (arg == 0) {
        func_02088874();
        return;
    }
    func_0208b0a4(&data_021a524c.f3c, 0);
    data_021a524c.f4c = 1;
}
