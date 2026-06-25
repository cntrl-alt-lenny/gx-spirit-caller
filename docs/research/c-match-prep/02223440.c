/* CAMPAIGN-PREP candidate for func_02223440 (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-tail-call; bitfield :1/:5; bind new-f4 local; asym-shift extract
 *   risk:       f4 store-then-reuse may reload; 02216f3c arity guessed; struct offsets/widths inferred
 *   confidence: low
 */
/* func_ov002_02223440: guard on outer->fc; if holder==0 tail-call
 * 02216f3c, else set holder->f4 bit2 (orr #4) and fire two multi-field
 * calls (021d8904 with f2.b0/f2.f1 + the modified-f4 9-bit field; 021de598
 * with outer + f2.b0/f2.f1), return 0. */
typedef unsigned short u16;

struct F02223440_F2 { u16 b0 : 1; u16 f1 : 5; u16 rest : 10; };
struct F02223440_Holder { u16 f0; struct F02223440_F2 f2; u16 f4; };
struct F02223440_Outer { u16 pad0[6]; u16 fc; };

extern int  func_ov002_021d8904(unsigned int b0, unsigned int f1, unsigned int field);
extern int  func_ov002_021de598(void *outer, unsigned int b0, unsigned int f1);
extern int  func_ov002_02216f3c(void *outer);

int func_ov002_02223440(struct F02223440_Outer *outer, struct F02223440_Holder *h) {
    u16 v;
    if (outer->fc == 0) return 0;
    if (h == 0) return func_ov002_02216f3c(outer);
    v = h->f4 | 4;
    h->f4 = v;
    func_ov002_021d8904(h->f2.b0, h->f2.f1, (unsigned)((unsigned)v << 17) >> 23);
    func_ov002_021de598(outer, h->f2.b0, h->f2.f1);
    return 0;
}
