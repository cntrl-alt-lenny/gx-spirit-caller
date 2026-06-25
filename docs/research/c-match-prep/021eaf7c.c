/* CAMPAIGN-PREP candidate for func_021eaf7c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C+D: halfword table (cf1a4) checked BEFORE the field30 bitfield (orig order); short-circuit && on data_cd3f4.f0/f1c; obj->f0 as 3rd arg
 *   risk:       orig reads cf1a4 (ldrh, _LIT1) then cf16c field30 (_LIT2) — table-before-bitfield. mwcc may swap to bitfield-first. Also the f0==slot && f1c==index uses ldreq/cmpeq chain. reshape-able (order stmts) + struct-guessed (cd3f4 offsets).
 *   confidence: low
 */
typedef unsigned short u16;
typedef unsigned int u32;

struct CardEnt30 { u32 _pad[12]; u32 flags : 13; };

struct Obj02 { u16 f0; u16 f2; };
struct Ctx3f4 { int f0; int _pad[6]; int f1c; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern struct Ctx3f4 data_ov002_022cd3f4;
extern int func_ov002_021c1a2c(int slot, int index, int kind);
extern int func_ov002_021c1e44(int a, int slot, int index);
extern int func_ov002_021c1ef0(int a, int slot, int index);

int func_ov002_021eaf7c(struct Obj02 *obj, int slot, int index)
{
    int half;
    int row;
    struct CardEnt30 *e;

    if (index >= 5)
        return 0;
    if (slot == (obj->f2 & 1))
        return 0;

    half = (slot & 1) * 0x868;
    row = index * 0x14;
    if (*(u16 *)(data_ov002_022cf1a4 + half + row) == 0)
        return 0;
    e = (struct CardEnt30 *)(data_ov002_022cf16c + half + row);
    if (e->flags == 0)
        return 0;

    if (func_ov002_021c1ef0(obj, slot, index) == 0)
        return 0;
    if (data_ov002_022cd3f4.f0 == slot && data_ov002_022cd3f4.f1c == index)
        return 0;

    if (func_ov002_021c1a2c(slot, index, obj->f0) == 0)
        return 0;
    if (func_ov002_021c1e44(obj, slot, index) == 0)
        return 1;
    return 0;
}
