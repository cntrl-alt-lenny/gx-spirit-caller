/* CAMPAIGN-PREP candidate for func_0228c460 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C: count=t+1-f(p); 2 guards; loop1 id->022813f8; loop2 id!=0&&f6==0&&021be4a0, tail word0<=021c8470
 *   risk:       loop2 walks two ptrs (slot.id@+0x30, slot.f6@+0x36) and holds 1-player/player-base-word0/const1 across; r4/r5 reused player->ptr, count->counter. mwcc alloc will rotate. permuter-class, .s escape likely.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0228c460 (ov002, class C, MED tier) — brief 0113.
 * UNVERIFIED + ITERATION-EXPECTED. The hardest in the batch (heavy reg-reuse, dual induction).
 * block data_022cf16c stride 0x868: word0 (int@0), slot[] at +0x30 stride 0x14 (id:13 @0, f6 u16 @6).
 *   recipe:     Class C: count = t+1-021bbf50(p); two early-return guards; loop1 j=0..4 (id->022813f8); loop2 k=0..4 (id!=0 && f6==0 && 021be4a0) tail word0<=021c8470
 *   risk:       loop2 walks TWO pointers (slot[k].id at +0x30 and slot[k].f6 at +0x36) plus holds 1-player(r6), player-base word0(r7) and const1(r9) across; r5/r4 are reused for player/count then ptr/counter. mwcc reg-allocation almost certainly rotates. permuter-class (escape to .s likely).
 *   confidence: low
 */
typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
typedef struct { u32 id : 13; u32 : 19; u16 _pad4; u16 f6; } Ov2Slot; /* stride 0x14; f6 @ +6 */
typedef struct { int word0; u8 _pad04[0x2c]; Ov2Slot slot[100]; } Ov2Field; /* stride 0x868, slot @ +0x30 */

extern Ov2Field data_ov002_022cf16c[];
extern int func_ov002_021bc0d4(int a, int b, int c);
extern int func_ov002_021bbf50(int player);
extern int func_ov002_02259f98(int player);
extern int func_ov002_022813f8(int id);
extern int func_ov002_021be4a0(int player, int k, int one);
extern int func_ov002_021c8470(int player, int k);

int func_ov002_0228c460(int player) {
    int t, count, j, k;
    t = func_ov002_021bc0d4(1 - player, 1, 1);
    count = t + 1 - func_ov002_021bbf50(player);
    if (func_ov002_02259f98(1 - player) == 0) return 0;
    if (count <= 0) return 0;
    for (j = 0; j < 5; j++) {
        if (func_ov002_022813f8(data_ov002_022cf16c[player & 1].slot[j].id) != 0) return 0;
    }
    for (k = 0; k < 5; k++) {
        if (data_ov002_022cf16c[(1 - player) & 1].slot[k].id == 0) continue;
        if (data_ov002_022cf16c[(1 - player) & 1].slot[k].f6 != 0) continue;
        if (func_ov002_021be4a0(1 - player, k, 1) == 0) continue;
        if (data_ov002_022cf16c[player & 1].word0 <= func_ov002_021c8470(1 - player, k)) return 1;
    }
    return 0;
}
