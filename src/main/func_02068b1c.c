/* CAMPAIGN-PREP candidate for func_02068b1c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Stack-struct out-param + forwarding call (build local, pass &local twice)
 *   risk:       Stack frame size 0x14 vs the 20-byte out struct must match; mwcc may reorder the two pointer setups; arg types of forwarded call inferred.
 *   confidence: med
 */
/* func_02068b1c: build a 20-byte stack record via
 * func_020a978c(&rec, &data_02101d7c), then forward to
 * func_02068b54(arg0, arg1, &rec). */

typedef struct { char _b[0x14]; } rec_02068b1c_t;

extern unsigned char data_02101d7c[];
extern void func_020a978c(rec_02068b1c_t *out, unsigned char *src);
extern void func_02068b54(void *p0, void *p1, void *rec);

void func_02068b1c(void *p0, void *p1) {
    rec_02068b1c_t rec;
    func_020a978c(&rec, data_02101d7c);
    func_02068b54(p0, p1, &rec);
}
