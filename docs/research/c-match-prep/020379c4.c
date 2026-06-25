/* CAMPAIGN-PREP candidate for func_020379c4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     store-order field clear; void tail call (ldr;bx)
 *   risk:       f0e/f10 share -1 via sub-reuse; mwcc may emit mvn vs sub for -1, or split the two -1 stores differently
 *   confidence: med
 */
/* func_020379c4: clear three halfword fields then tail-call.
 *   strh 0,[r1,#0x2]; strh -1,[r1,#0xe]; strh -1,[r1,#0x10]
 *   ldr ip,=func_02088f94; bx ip   -> tail call
 * Store order +0x2, +0xe, +0x10 must be preserved; -1 reuses the 0.
 */

typedef struct {
    char           _pad_00[0x02];
    short          f02;   /* +0x02 */
    char           _pad_04[0xe - 0x4];
    short          f0e;   /* +0x0e */
    short          f10;   /* +0x10 */
} State;

extern State data_0219b2e0;
extern void func_02088f94(void);

void func_020379c4(void) {
    data_0219b2e0.f02 = 0;
    data_0219b2e0.f0e = -1;
    data_0219b2e0.f10 = -1;
    func_02088f94();
}
