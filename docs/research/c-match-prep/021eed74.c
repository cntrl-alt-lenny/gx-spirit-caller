/* CAMPAIGN-PREP candidate for func_021eed74 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit15 guard via top :1 bitfield; sparse switch -> binary-search compare tree
 *   risk:       the bit15 guard: orig emits ldrh;lsl#16;lsr#31 (32-bit-style top-bit extract). A `:1` MSB bitfield may instead emit ldrh;lsr#15, diverging one shift. struct-guessed/reshape-able (try a signed/wide load to force lsl#16 if lsr#15 appears).
 *   confidence: med
 */
/* func_ov002_021eed74 (ov002, class C). Sparse switch dispatch on self->tag (u16 at +0),
 * gated by the top bit (bit15) of the u16 at +2. Each case tail-calls a handler with self.
 * mwcc lowers the sparse cases to a binary-search compare tree (the bgt/bge/beq cascade,
 * with 0x1753-0xb8=0x169b and 0x1a35+0xe9=0x1b1e folded as sub/add of held literals). */

struct self_t { unsigned short tag; unsigned short _b0 : 1; unsigned short _mid : 14; unsigned short flag15 : 1; };

extern int func_ov002_021e7748(struct self_t *self);
extern int func_ov002_021e8dd4(struct self_t *self);
extern int func_ov002_021ea390(struct self_t *self);
extern int func_ov002_021eb964(struct self_t *self);
extern int func_ov002_021ed604(struct self_t *self);
extern int func_ov002_021f17d4(struct self_t *self);

int func_ov002_021eed74(struct self_t *self) {
    if (self->flag15) {
        switch (self->tag) {
        case 0x14c5: return func_ov002_021e8dd4(self);
        case 0x169b: return func_ov002_021ed604(self);
        case 0x1753: return func_ov002_021eb964(self);
        case 0x1a35: return func_ov002_021f17d4(self);
        case 0x1b1e: return func_ov002_021e7748(self);
        }
    }
    return func_ov002_021ea390(self);
}
