/* CAMPAIGN-PREP candidate for func_0202c01c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     leaf init: two helper calls, store results, reload global
 *   risk:       global reload after each call must reproduce; arg constants 4/0 and store offsets 0x18/0x1c
 *   confidence: high
 */
/* func_0202c01c: func_0202c158(); then store two func_02006bf0 results to
 * (*data_0219a85c)->f_18 and ->f_1c, reloading the global each time. */

extern void  func_0202c158(void);
extern void *func_02006bf0(void *p, int n, int m);
extern char  data_020c6a14[];
extern char  data_020c6a28[];

typedef struct Ctx0202c070 {
    char  _pad_00[0x18];
    void *f_18;          /* +0x18 */
    void *f_1c;          /* +0x1c */
} Ctx0202c070;

extern Ctx0202c070 *data_0219a85c;

void func_0202c01c(void) {
    func_0202c158();
    data_0219a85c->f_18 = func_02006bf0(data_020c6a14, 4, 0);
    data_0219a85c->f_1c = func_02006bf0(data_020c6a28, 4, 0);
}
