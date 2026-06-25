/* CAMPAIGN-PREP candidate for func_0220af00 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     query guard + bit0&1 table gate + derived-arg calls + `!=0` tail
 *   risk:       bit0 must RELOAD on all 3 uses (orig re-ldrh); mul-not-mla; inner return-0 may predicate vs branch
 *   confidence: low
 */
/* func_ov002_0220af00: query guard + per-player table gate + 2 derived calls.
 *   if (func_021ff3bc(self) == 0) return 0;
 *   if (*(int*)(cf17c + (self->b0 & 1)*0x868) == 0) {
 *       int t = func_0223f6c4(self);
 *       if (func_022536e8(self->b0, self->f0, t) == 0) return 0;
 *   }
 *   return func_021c2f24(self->b0, 0x1919) != 0;   (bit0 reloaded each use)
 */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; };
extern char data_ov002_022cf17c[];
extern int func_ov002_021ff3bc(struct Ov002Self *self);
extern int func_ov002_0223f6c4(struct Ov002Self *self);
extern int func_ov002_022536e8(int bit, int hw, int c);
extern int func_ov002_021c2f24(int bit, int tag);

int func_ov002_0220af00(struct Ov002Self *self) {
    if (func_ov002_021ff3bc(self) == 0) return 0;
    if (*(int *)(data_ov002_022cf17c + (self->b0 & 1) * 0x868) == 0) {
        int t = func_ov002_0223f6c4(self);
        if (func_ov002_022536e8(self->b0, self->f0, t) == 0) return 0;
    }
    return func_ov002_021c2f24(self->b0, 0x1919) != 0;
}
