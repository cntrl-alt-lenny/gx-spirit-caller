/* CAMPAIGN-PREP candidate for func_022818a4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     single count load (bind); u16 table index; inner :13 compare; unsigned bounds; return j
 *   risk:       orig pre-seeds inner counter from a held r3=0 (mov r0,r3) and reuses the reg — mwcc may pick a different inner-counter reg; that is permuter-class. count-bind and +0x120 stride are reshape-safe
 *   confidence: med
 */
/* func_ov002_022818a4 (ov002, cls C) — nested scan, bitfield compare.
 * Per-player row cf16c+(player&1)*0x868; count=row[+0xc] (loaded once). For
 * outer i in 0..0x18: want=cb9a8[i] (u16); inner j over count slots at +0x120
 * (stride4), return j if want==slot.id (:13). No match -> -1. */
extern char data_ov002_022cf16c[];
extern unsigned short data_ov002_022cb9a8[];

struct Ov002Slot { unsigned int id : 13; };

int func_ov002_022818a4(int player) {
    char *row = data_ov002_022cf16c + (player & 1) * 0x868;
    unsigned int count = *(unsigned int *)(row + 0xc);
    int i;
    int j;
    for (i = 0; i < 0x19; i++) {
        unsigned short want = data_ov002_022cb9a8[i];
        for (j = 0; (unsigned)j < count; j++) {
            if (want == ((struct Ov002Slot *)(row + 0x120 + j * 4))->id)
                return j;
        }
    }
    return -1;
}
