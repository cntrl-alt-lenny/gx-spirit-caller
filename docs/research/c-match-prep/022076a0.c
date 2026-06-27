/* CAMPAIGN-PREP candidate for func_022076a0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     rsb (1-b0); eor b14^b0; (u16)>>8 asr hi-byte; Slot13.id 13-bit; f6cnt8 bitfield bound
 *   risk:       hi-byte extract needs helper int + (u16)cast then signed >>8 to emit lsl16;lsr16;asr8 (NOT lsr8); if 0223de94 typed u16/short the asr/lsr or extend shifts diverge. struct-guessed (de94 return type, f6 width8 vs ldrb).
 *   confidence: low
 */
/* func_ov002_022076a0: pair predicate + sub-row scan. self=r0, other=r1.
 * Guard: other!=NULL and (1-self.b0)==(other.b14 ^ other.b0). Then loop
 * i<(u8)other.f6: if (de94(other,i) hi-byte)==0xe, look up d0250[def4()].id
 * (13-bit) and 0202e234(id); return 1 if set. b14 p14 w1; id p0 w13. */
typedef unsigned short u16;
struct F2 { u16 bit0:1; u16 :13; u16 b14:1; u16 :1; };
struct S022076a0 { u16 f0; struct F2 f2; u16 f4; u16 f6cnt8:8; };
struct Slot13 { u16 id:13; };
extern char data_ov002_022d0250[];
extern int func_0202e234(unsigned int id);
extern int func_ov002_0223de94(struct S022076a0 *other, int i);
extern int func_ov002_0223def4(struct S022076a0 *other, int i);
int func_ov002_022076a0(struct S022076a0 *self, struct S022076a0 *other) {
    int i;
    if (other == 0) return 0;
    if ((1 - self->f2.bit0) != (other->f2.b14 ^ other->f2.bit0)) return 0;
    for (i = 0; i < (int)other->f6cnt8; i++) {
        if ((((int)(unsigned short)func_ov002_0223de94(other, i) >> 8) & 0xff) == 0xe) {
            unsigned int id = ((struct Slot13 *)(data_ov002_022d0250 + func_ov002_0223def4(other, i) * 4))->id;
            if (func_0202e234(id) != 0) return 1;
        }
    }
    return 0;
}
