/* CAMPAIGN-PREP candidate for func_02292454 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted loop 0..5, :1 bitfield args, early-return bool
 *   risk:       loop reg-alloc on counter r4 may flip; ldrh re-loaded each use as orig shows; helper sigs guessed
 *   confidence: med
 */
/* func_ov002_02292454: for i in 0..5: if helper1(bit0,i){ n=helper2(bit0,i); if helper3(f0,n) return 1; } return 0. */

struct F02292454_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F02292454_Self { unsigned short f0; struct F02292454_F2 f2; };

extern int func_ov002_022575c8(struct F02292454_Self *self, unsigned int bit0, int i);
extern int func_ov002_021c84e0(unsigned int bit0, int i);
extern int func_ov002_022536e8(unsigned int bit0, unsigned int f0, int n);

int func_ov002_02292454(struct F02292454_Self *self) {
    int i;
    for (i = 0; i < 5; i++) {
        if (func_ov002_022575c8(self, self->f2.bit0, i)) {
            int n = func_ov002_021c84e0(self->f2.bit0, i);
            if (func_ov002_022536e8(self->f2.bit0, self->f0, n))
                return 1;
        }
    }
    return 0;
}
