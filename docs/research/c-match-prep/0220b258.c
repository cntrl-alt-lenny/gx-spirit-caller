/* CAMPAIGN-PREP candidate for func_0220b258 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     kind guard; 1-p via rsb; reuse p*0x868 + idx*0x14; two u16 alias derefs
 *   risk:       struct-guessed/reshape-able: G's reload pattern (orig ldr [r0],[r0,#4],[r0,#8] off one base in r0) means G must be a single bound pointer; if mwcc reloads the cd3f4 literal per field, 3 ldr diverge. Confirm cf1a2 vs cf1a4 offsets.
 *   confidence: low
 */
/* func_ov002_0220b258 (ov002, class C, MED) -- batch p_0086.
 * kind==0x12 guard; self->f14 != 0 guard; G(cd3f4): G->a == (1-p) require, G->b == p require, G->busy==0 require;
 * idx=G->slot; e1=*(u16*)(cf1a4 + p*0x868 + idx*0x14); if e1==0 return 0;
 * e2=*(u16*)(cf1a2 + p*0x868 + idx*0x14); return e2 != 0.
 * Bind base3=idx*0x14; offD=p*0x868 reused.
 */
typedef unsigned short u16;
typedef unsigned char  u8;

struct Self0220b258 {
    u16 f0;
    struct { u16 p : 1; u16 _m : 5; u16 kind : 6; u16 _t : 4; } f2; /* +0x2 */
    u8  _pad4[0x10];
    int f14;                                                       /* +0x14 */
};
struct G0220b258 { int a; int b; int busy; u8 _c[0x14]; int slot; }; /* +0,+4,+8,+0x20 */

extern struct G0220b258 data_ov002_022cd3f4;
extern u8 data_ov002_022cf1a4[]; /* alias, stride 0x868, sub 0x14 */
extern u8 data_ov002_022cf1a2[]; /* alias, stride 0x868, sub 0x14 */

int func_ov002_0220b258(struct Self0220b258 *self) {
    int p;
    int idx;
    int off, sub;
    if (self->f2.kind != 0x12) return 0;
    if (self->f14 == 0) return 0;
    p = self->f2.p;
    if (data_ov002_022cd3f4.a != 1 - p) return 0;
    if (data_ov002_022cd3f4.b != p) return 0;
    if (data_ov002_022cd3f4.busy != 0) return 0;
    idx = data_ov002_022cd3f4.slot;
    off = (p & 1) * 0x868;
    sub = idx * 0x14;
    if (*(u16 *)(data_ov002_022cf1a4 + off + sub) == 0) return 0;
    return *(u16 *)(data_ov002_022cf1a2 + off + sub) != 0;
}
