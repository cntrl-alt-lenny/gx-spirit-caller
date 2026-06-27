/* CAMPAIGN-PREP candidate for func_022476e8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: id:13 bitfield holder (lsl#19;lsr#19); do-while ring walk w/ ++node (ldr[r6,#4]!); mla base (arg0&1)*0x868+cf16c+0x120; reload slot each iter; reload self for callback
 *   risk:       permuter-class: counted/pointer-walk loop with several held bases (r4 slot base, r6 node, r8 self) — mwcc -O4 reg-alloc/induction-var choices on the ring walk likely diverge; loop bodies are the ov002 reg-wall tier.
 *   confidence: low
 */
/* func_ov002_022476e8 — guard (arg0==self.b0 && arg1==11), then walk the
 * cacc0 node ring (id:13, terminated by id==0); on a slot-id match invoke a
 * callback and return 0x800. */
typedef unsigned short u16;

struct SlotE8 { unsigned int id : 13; };

extern char data_ov002_022ce288[];          /* self ptr @ +0x48c */
extern struct SlotE8 data_ov002_022cacc0[]; /* node ring */
extern char data_ov002_022cf16c[];          /* per-player table */
extern int  func_ov002_022477e8(void *self, int i);

struct SelfE8 { u16 f0; u16 b0 : 1; };

int func_ov002_022476e8(int arg0, int arg1, int arg2) {
    struct SlotE8 *node;
    struct SlotE8 *slot;
    int i;
    void *self = *(void **)(data_ov002_022ce288 + 0x48c);
    if (arg0 != ((struct SelfE8 *)self)->b0 || arg1 != 0xb)
        return 0;
    node = data_ov002_022cacc0;
    if (node->id == 0)
        return 0;
    slot = (struct SlotE8 *)(data_ov002_022cf16c + (arg0 & 1) * 0x868 + 0x120);
    i = 0;
    do {
        if (node->id == slot[arg2].id) {
            if (func_ov002_022477e8(*(void **)(data_ov002_022ce288 + 0x48c), i) != 0)
                return 0x800;
        }
        ++i;
        ++node;
    } while (node->id != 0);
    return 0;
}
