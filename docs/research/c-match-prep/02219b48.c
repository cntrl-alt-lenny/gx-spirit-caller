/* CAMPAIGN-PREP candidate for func_02219b48 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit2 gate; cf16c+(b0&1)*0x868+0x30+f5*0x14 slot; 9-bit recon decode; compare self->f6; bare call
 *   risk:       permuter-class: the slot-decode `((slot<<2)>>24<<1)+((slot<<18)>>31)` register-threading is a scheduling coin-flip (proven on sibling 0221a140: mwcc splits the accumulator across two temps vs orig's single-reg chain). struct-guessed: f6=+4 bits6-14, f5 slot index.
 *   confidence: med
 */
typedef unsigned short u16;

struct Self02219b48 {
    u16 id;                           /* +0 */
    u16 b0 : 1; u16 f5 : 5; u16 : 10; /* +2 */
    u16 : 2; u16 b2 : 1; u16 : 3; u16 f6 : 9; /* +4: bit2 gate, bits6-14 field */
};

extern char data_ov002_022cf16c[];
extern void func_ov002_02254efc(void);

int func_ov002_02219b48(struct Self02219b48 *self) {
    unsigned int slot;
    int recon;
    if (self->b2) return 0;
    slot = *(unsigned int *)(data_ov002_022cf16c + (self->b0 & 1) * 0x868 + 0x30 + self->f5 * 0x14);
    recon = ((slot << 2) >> 0x18 << 1) + ((slot << 0x12) >> 0x1f);
    if (self->f6 != recon) return 0;
    func_ov002_02254efc();
    return 0;
}
