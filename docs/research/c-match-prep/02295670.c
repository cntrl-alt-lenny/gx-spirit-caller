/* CAMPAIGN-PREP candidate for func_02295670 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :13 kind guard; per-iter '/2' accumulate; opposite-bank score; (u16)t>>8 byte-unpack
 *   risk:       struct mismatch: I named BankData.score but defined _head[0x30]+slots with no score member -> WON'T COMPILE. struct-guessed: add 'int score' alias at +0 (union/_head[0] cast). also acc/i loop reg-alloc + post-blx b0/b1 rotation. permuter-class tail
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_02295670 (ov002, class D, MED tier).
 * Recipe: loop i=0..10 acc += f021c8470(turn,i)/2 when [turn&1].slots[i].kind!=0; then opposite-bank score guard;
 * then f0227d660(turn,0) -> byte-unpack b0=t&0xff, b1=((u16)t>>8)&0xff -> f021c8470(b0,b1)>=1000.
 * Slot/bank from 02294c70; unpack idiom from sibling 02237434.
 */
typedef unsigned short u16;
typedef struct Entity {
    unsigned short id;
    unsigned short turn : 1;
} Entity;

typedef struct Slot {
    unsigned int kind : 13;
    char _pad[0x14 - 4];
} Slot;

typedef struct BankData {
    char _head[0x30];
    Slot slots[100];
} BankData;

extern BankData data_ov002_022cf16c[2];
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_0227d660(int side, int z);

int func_ov002_02295670(Entity *e) {
    int acc = 0;
    int i;
    int t;
    int b0, b1;
    for (i = 0; i < 11; i++) {
        if (data_ov002_022cf16c[e->turn & 1].slots[i].kind != 0)
            acc += func_ov002_021c8470(e->turn, i) / 2;
    }
    if (data_ov002_022cf16c[(1 - e->turn) & 1].score <= acc)
        return 1;
    t = func_ov002_0227d660(e->turn, 0);
    if (t < 0)
        return 0;
    b0 = t & 0xff;
    b1 = ((u16)t >> 8) & 0xff;
    if (func_ov002_021c8470(b0, b1) >= 0x3e8)
        return 1;
    return 0;
}
