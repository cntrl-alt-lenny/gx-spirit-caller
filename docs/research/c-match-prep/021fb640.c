/* CAMPAIGN-PREP candidate for func_021fb640 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order self/arg1 r7/r6; packed-result byte-unpack lo/mid/hi16; bit0 bitfield; if-eq r==1 not ternary
 *   risk:       permuter-class: the packed-return unpack uses 5 regs (r1/r3/r2/r4/r5) in a fixed colouring; mwcc -O4 will likely allocate lo/mid/hi16 differently (mov-shift rotation), several near-miss lines.
 *   confidence: low
 */
/* func_ov002_021fb640 (ov002, class C) — byte-unpack from call result + guard chain.
 * Flow: require 021ff3bc(self); 021b947c(self->f14.id9); unpack packed result into
 * lo-byte / mid-byte / hi16; require mid-byte==0xe; then a 9-bit field of +0x14 indexes
 * a u16 table (cf... at 022d0250) ->13-bit-> 0202e234; bit0(+2)->021c33e4(.,lo,hi16);
 * then 021f4a84/021f4a4c. */
typedef unsigned short u16;
typedef unsigned int   u32;

extern u16  data_ov002_022d0250[];
extern int  func_0202e234(int v13);
extern unsigned int func_ov002_021b947c(int id9);
extern int  func_ov002_021c33e4(unsigned int bit0, int lo, int hi16);
extern int  func_ov002_021f4a4c(void *self, int arg1);
extern int  func_ov002_021f4a84(void *self, int arg1);
extern int  func_ov002_021ff3bc(void *self);

struct F021fb640_F2 { u16 b0 : 1; u16 rest : 15; };
struct F021fb640_Self {
    u16 pad0;
    struct F021fb640_F2 f2;
    u16 pad4[8];
    u32 f14_id9 : 9;   /* +0x14, word, low 9 bits used as (x<<23)>>23 */
};

int func_ov002_021fb640(struct F021fb640_Self *self, int arg1) {
    unsigned int v;
    int lo, mid, hi16, r;
    if (func_ov002_021ff3bc(self) == 0) return -1;
    v = func_ov002_021b947c(self->f14_id9);
    lo   = v & 0xff;
    mid  = (v >> 8) & 0xff;
    hi16 = (v >> 16) & 0xffff;
    if (mid != 0xe) return -1;
    if (func_0202e234((unsigned)(data_ov002_022d0250[self->f14_id9 * 2] << 19) >> 19) == 0) return -1;
    if (func_ov002_021c33e4(self->f2.b0, lo, hi16) == 0) return -1;
    r = func_ov002_021f4a84(self, arg1);
    if (r == 1) func_ov002_021f4a4c(self, arg1);
    return r;
}
