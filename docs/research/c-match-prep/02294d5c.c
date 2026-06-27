/* CAMPAIGN-PREP candidate for func_02294d5c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     opposite-bank mla(1-turn)*0x868 + i*0x14; :13 + halfword AND-guard
 *   risk:       orig folds two-field guard as movs;ldrneh;cmpne (short-circuit && on f30 then f38); 0x9c4 held in r8 reused as both arg and compare. struct-guessed slot layout
 *   confidence: med
 */
typedef struct Entity {
    unsigned short id;
    unsigned short turn : 1;
} Entity;

typedef struct BankSlot {
    unsigned int f30 : 13;
    char _pad0[0x38 - 0x30 - 4];
    unsigned short f38;
    char _pad1[0x14 - (0x38 - 0x30) - 2];
} BankSlot;

typedef struct BankData {
    char _head[0x30];
    BankSlot slots[100];
} BankData;

extern BankData data_ov002_022cf16c[2];
extern int func_ov002_021bb90c(int flag, int arg);
extern int func_ov002_021c84a8(int idx);

int func_ov002_02294d5c(Entity *e) {
    BankSlot *s;
    int i;

    if (func_ov002_021bb90c(e->turn, 0xfbc) == 0)
        return 0;
    for (i = 0; i < 5; i++) {
        s = &data_ov002_022cf16c[(1 - e->turn) & 1].slots[i];
        if (s->f30 && s->f38 != 0) {
            if (func_ov002_021c84a8(i) <= 0x9c4)
                return 1;
        }
    }
    return 0;
}
