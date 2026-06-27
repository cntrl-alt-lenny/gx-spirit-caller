/* CAMPAIGN-PREP candidate for func_02287774 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     loop scan; in-loop mla base; slot :13 + halfword && ; >0 ret
 *   risk:       none material — VERIFIED byte-exact. b0 read once/iter shared as index(&1)+call arg; mla recomputed in-loop; ldrneh predication for &&.
 *   confidence: high
 */
typedef unsigned short u16;
typedef unsigned int   u32;
struct Self { u16 f0; u16 b0 : 1; u16 rest : 15; };
struct Ov002Slot { u32 id : 13; };

extern char data_ov002_022cf16c[];
extern int  func_ov002_021bd5f4(int b0, int i);

int func_ov002_02287774(struct Self *self) {
    int i;
    for (i = 0; i < 5; i++) {
        char *row = data_ov002_022cf16c + (self->b0 & 1) * 0x868 + i * 0x14;
        if (((struct Ov002Slot *)(row + 0x30))->id != 0 &&
            *(u16 *)(row + 0x38) != 0) {
            if (func_ov002_021bd5f4(self->b0, i) > 0) return 1;
        }
    }
    return 0;
}
