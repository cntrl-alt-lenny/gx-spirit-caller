/* CAMPAIGN-PREP candidate for func_02209868 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early gates; rsb 1-bit0; bind cf16c base across counted do-while loop
 *   risk:       reshape-able/struct-guessed: d016c[0xcf8/4=0x3e6] index and the bls=unsigned loop bound at +0xc are inferred; rsb r0,r0,#1 => 1-bit0. mvn r2,#0 => -1 arg. Confirm 0xcf8 byte offset on real global.
 *   confidence: med
 */
/* func_ov002_02209868: gate func_ov002_021ff320(self); if global d016c[0xcf8]
 * set, require func_ov002_021bae7c(1-bit0,0x178b,-1)==0; then counted scan of
 * player (bit0)'s cf178-sized cf16c table forwarding (f0,i) to 022536e8. */
typedef unsigned short u16;

struct F02209868_F2 { u16 bit0 : 1; u16 rest : 15; };
struct F02209868_Self { u16 f0; struct F02209868_F2 f2; };

extern char data_ov002_022cf16c[];
extern int data_ov002_022cf178[];
extern int data_ov002_022d016c[];
extern int func_ov002_021ff320(struct F02209868_Self *self);
extern int func_ov002_021bae7c(int player, int code, int arg);
extern int func_ov002_022536e8(unsigned int bit0, unsigned int f0, unsigned int i);

int func_ov002_02209868(struct F02209868_Self *self) {
    int i;
    char *base;
    if (func_ov002_021ff320(self) == 0) return 0;
    if (data_ov002_022d016c[0x3e6] != 0) {
        if (func_ov002_021bae7c(1 - self->f2.bit0, 0x178b, -1) != 0) return 0;
    }
    if (*(int *)((char *)data_ov002_022cf178 + (self->f2.bit0 & 1) * 0x868) == 0)
        return 0;
    base = data_ov002_022cf16c + (self->f2.bit0 & 1) * 0x868;
    i = 0;
    do {
        if (func_ov002_022536e8(self->f2.bit0, self->f0, i) != 0) return 1;
        i++;
    } while ((unsigned int)i < (unsigned int)*(int *)(base + (self->f2.bit0 & 1) * 0x868 + 0xc));
    return 0;
}
