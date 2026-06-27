/* CAMPAIGN-PREP candidate for func_02204380 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     && guard chain; eor-free row/col split; mla col-parity base + row*0x14 halfword
 *   risk:       the v split: orig does (v<<16>>16>>8)&0xff for row and v&0xff for col from one func_0223de94 return; my shift chain may not reproduce the exact lsl16/lsr16/asr8/and. reshape-able by tuning the sign/shift expr; mla operand-order (lr,r2,ip) may also flip.
 *   confidence: low
 */
#include "types.h"

typedef struct Code_380 {
    u16 a : 1;
    u16 b : 5;
    u16 c : 6;
    u16 d : 2;
    u16 e : 2;
} Code_380; /* at obj+0x2 */

extern int func_ov002_021ff354(void);
extern int func_02031794(u16 id);
extern int func_0202b878(u16 id);
extern int func_ov002_0223de94(void *card, int kind);
extern int func_ov002_021c8940(void);
extern u16 data_ov002_022cf1a4[2][0x868 / 2];

struct Card_380 {
    u16 id;          /* +0x0 */
    u8 pad2[4];
    u16 kind;        /* +0x6 (low byte used) */
};

struct Self_380 {
    u16 pad0;
    Code_380 code;   /* +0x2 */
};

int func_ov002_02204380(struct Self_380 *self, struct Card_380 *card) {
    int v;
    int row;
    int col;
    u16 cell;
    if (func_ov002_021ff354() != 0 && card != 0) {
        if ((card->kind & 0xff) == 1) {
            if (func_02031794(card->id) == 0) {
                if (func_0202b878(card->id) == 0x17) {
                    v = func_ov002_0223de94(card, 0);
                    row = (((int)((s16)(v << 8)) >> 8) >> 8) & 0xff;
                    col = v & 0xff;
                    if (row <= 4) {
                        cell = data_ov002_022cf1a4[col & 1][row * 0x14 / 2];
                        if (cell != 0) {
                            if (func_ov002_021c8940() == 1) {
                                return 2;
                            }
                        }
                    }
                }
            }
        }
    }
    return (self->code.d == 0) ? 1 : 0;
}
