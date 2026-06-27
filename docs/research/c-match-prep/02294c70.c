/* CAMPAIGN-PREP candidate for func_02294c70 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     inline turn*0x868 + i*0x14 (slots at +0x30); :13 bitfield guard; reload turn
 *   risk:       orig recomputes mla flag,0x868 + i*0x14 each iter with #0x30 ldr-imm; if mwcc hoists the bank base out of loop the address form diverges. struct-guessed slot stride/offset
 *   confidence: med
 */
typedef struct Entity {
    unsigned short id;
    unsigned short turn : 1;
} Entity;

typedef struct BankSlot {
    unsigned int f30 : 13;
    char _pad[0x14 - 4];
} BankSlot;

typedef struct BankData {
    char _head[0x30];
    BankSlot slots[100];
} BankData;

extern BankData data_ov002_022cf16c[2];
extern int *func_ov002_021afb74(void);
extern int func_ov002_022806a4(int id, int zero);
extern int func_0202b8a8(int field13);
extern int func_ov002_021c84e0(int idx);

int func_ov002_02294c70(Entity *e) {
    int limit;
    int i;

    if (func_ov002_022806a4(e->id, 0) < 0)
        return 0;
    limit = func_0202b8a8((*func_ov002_021afb74() << 0x13) >> 0x13);
    for (i = 0; i < 5; i++) {
        if (data_ov002_022cf16c[e->turn & 1].slots[i].f30) {
            if (func_ov002_021c84e0(i) >= limit)
                return 0;
        }
    }
    return 1;
}
