/* CAMPAIGN-PREP candidate for func_022955f0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :13 kind + :1 owner@bit13 bitfields; short-circuit && skip; reload turn (mla per iter)
 *   risk:       orig recomputes mla(turn&1,0x868)+0x30 with i*0x14 induction each iter and reloads turn; if mwcc hoists the bank base out of the loop the address form diverges. struct-guessed slot stride/owner-bit
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022955f0 (ov002, class D, MED tier).
 * Recipe: slot loop i=0..4 over [turn&1].slots[i] (slots at +0x30, stride 0x14); :13 kind + owner:1 at bit13.
 * Process slot iff kind!=0 && turn!=owner -> short-circuit movs;movne;cmpne;beq.
 * Slot/bank layout from sibling 02294c70 (BankData{_head[0x30]; slots stride0x14; word0 kind:13}).
 */
typedef struct Entity {
    unsigned short id;
    unsigned short turn : 1;
} Entity;

typedef struct Slot {
    unsigned int kind : 13;
    unsigned int owner : 1;
    char _pad[0x14 - 4];
} Slot;

typedef struct BankData {
    char _head[0x30];
    Slot slots[100];
} BankData;

extern BankData data_ov002_022cf16c[2];
extern int func_ov002_022575c8(Entity *e, int turn, int i);

int func_ov002_022955f0(Entity *e) {
    int i;
    for (i = 0; i < 5; i++) {
        Slot *s = &data_ov002_022cf16c[e->turn & 1].slots[i];
        if (s->kind != 0 && (unsigned int)e->turn != s->owner) {
            if (func_ov002_022575c8(e, e->turn, i) != 0)
                return 1;
        }
    }
    return 0;
}
