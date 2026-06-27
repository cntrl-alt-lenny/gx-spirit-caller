/* CAMPAIGN-PREP candidate for func_021f4ed0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :2/:1/:5/:9 bitfields on self header; cf1a4 mul-index; arg-packs all match; verdict via owner/slot/id unpack
 *   risk:       func_021b947c packed-return unpack: orig uses and#0xff / lsl16;lsr16;asr8;and#0xff / lsr16 (a struct w/ signed-char field) — my int+shifts give asr-vs-lsr + diff regs; plus orig puts kind==2 body at the tail. struct-guessed + permuter-class.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_021f4ed0 (ov002, class D) — MED tier.
 * BUILD-CHECKED (mwcc 2.0/sp1p5 -O4,p -interworking) — CLOSE but not exact:
 * the cf1a4 lookup, the e2d94/d5b80/df62c call arg-packs, the .L_d0/.L_fc tail
 * df62c blocks, and the kind==2 guard all match. RESIDUE: (1) the func_021b947c
 * packed-return unpack diverges — orig uses `and #0xff` / `lsl#16;lsr#16;asr#8;
 * and#0xff` / `lsr#16` (a struct-with-signed-char-field bitcast); my `int`+shifts
 * give asr-vs-lsr and a different reg order; (2) orig places the kind==2 body at
 * the TAIL (cold), mwcc inlines it. Both are permuter/struct-guessed class.
 * 392B, deep nested liveness, 5 calls. self held r4.
 * Bitfields on self->f2 (u16 @+2): kind = bits12..13 (:2), parity = bit0 (:1),
 * slot = bits1..5 (:5); self->f4 (u16 @+4): field9 = bits6..14 (:9).
 * Flow: if kind==2 -> df62c(parity,slot,field9); return 1.
 *  else r = func_021b947c(field9); the packed return is split owner=r&0xff,
 *  slot2=(r>>8)&0xff (asr in orig -> signed-char field?), id=(r>>16)&0xffff.
 *  if owner!=parity || slot2!=slot -> mismatch path (.L_fc).
 *  if id!=0xffff && cf1a4[(parity&1)*0x868+slot*0x14] != 0 ->
 *     e2d94(parity,slot,5,1); d5b80(parity,slot,0x1174,1).
 *  then df62c(parity,slot,field9); return 1.
 *  mismatch path: if self->f0==0x1a90 && func_022577dc(self) ->
 *     df62c(...); return 1; else return -1.
 */
typedef unsigned short u16;

struct Ov002Self {
    u16 f0;             /* +0 (== 0x1a90 test) */
    u16 parity : 1;     /* +2 bit0  */
    u16 slot   : 5;     /* +2 bits1..5 */
    u16 _b6    : 6;     /* +2 bits6..11 */
    u16 kind   : 2;     /* +2 bits12..13 */
    u16 _b14   : 2;     /* +2 bits14..15 */
    u16 _f4a   : 6;     /* +4 bits0..5 */
    u16 field9 : 9;     /* +4 bits6..14 */
    u16 _f4b   : 1;     /* +4 bit15 */
};

extern char data_ov002_022cf1a4[];
extern int  func_ov002_021b947c(int field9);          /* returns packed owner|slot<<8|id<<16 */
extern int  func_ov002_021d5b80(int parity, int slot, int c, int d);
extern int  func_ov002_021df62c(int parity, int slot, int field9);
extern int  func_ov002_021e2d94(int parity, int slot, int c, int d);
extern int  func_ov002_022577dc(struct Ov002Self *self);

int func_ov002_021f4ed0(struct Ov002Self *self) {
    int r, owner, slot2, id;

    if (self->kind == 2) {
        func_ov002_021df62c(self->parity, self->slot, self->field9);
        return 1;
    }

    r = func_ov002_021b947c(self->field9);
    owner = r & 0xff;
    slot2 = (r >> 8) & 0xff;
    id = (r >> 0x10) & 0xffff;

    if (owner == self->parity && slot2 == self->slot) {
        if (id != 0xffff &&
            *(u16 *)(data_ov002_022cf1a4 + (self->parity & 1) * 0x868 +
                     self->slot * 0x14) != 0) {
            func_ov002_021e2d94(self->parity, self->slot, 5, 1);
            func_ov002_021d5b80(self->parity, self->slot, 0x1174, 1);
        }
        func_ov002_021df62c(self->parity, self->slot, self->field9);
        return 1;
    }

    if (self->f0 == 0x1a90 && func_ov002_022577dc(self) != 0) {
        func_ov002_021df62c(self->parity, self->slot, self->field9);
        return 1;
    }
    return -1;
}
