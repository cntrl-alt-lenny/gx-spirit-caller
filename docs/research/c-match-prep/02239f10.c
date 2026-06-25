/* CAMPAIGN-PREP candidate for func_02239f10 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     0223de94 bit0/field split; Ov002Slot.id bitfield; int /2; b0&1 stride
 *   risk:       the 0x868/0x14 mla index addressing (base+(b0&1)*0x868+field*20+48 then ldr+0x30) may emit two mla vs orig's literal-pool 0x868+0x14; struct-guessed (Ov002Slot.id at +48 of 0x14 row, ground-truthed in header but the +0x30 base offset is inferred).
 *   confidence: med
 */
/* func_ov002_02239f10: validate (0223df38), decode (bit0,field) via 0223de94,
 * re-guard (0225764c), index the per-player 0x14 sub-row to read a 13-bit slot
 * id, halve a 0202b8f0 result (signed /2), tick, then conditionally invoke
 * 021df818 with the inverted self.b0. Returns 0. Class C: decl-order + mla index. */
#include "ov002_core.h"
extern int  func_ov002_0223df38(void *a, int b, int c);
extern u16  func_ov002_0223de94(void *node, int idx);
extern int  func_ov002_0225764c(void *self, int player, int slot);
extern int  func_0202b8f0(int v);
extern void func_ov002_021e2b3c(void);
extern int  func_ov002_0220e518(void *a);
extern void func_ov002_021df818(void *a, int b, int c);
extern void func_ov002_021e2c5c(void);

struct Ov002SlotRow { struct Ov002Slot s; };

int func_ov002_02239f10(void *arg0) {
    int v, b0, field, id, half;
    char *base;
    struct Ov002Slot *slot;
    if (func_ov002_0223df38(arg0, 0, 0) == 0) return 0;
    v = func_ov002_0223de94(arg0, 0);
    b0 = v & 0xff;
    field = ((u16)v >> 8) & 0xff;
    if (func_ov002_0225764c(arg0, b0, field) == 0) return 0;
    base = data_ov002_022cf16c + (b0 & 1) * 0x868;
    slot = (struct Ov002Slot *)(base + field * 20 + 48);
    id = slot->id;
    half = func_0202b8f0(id) / 2;
    func_ov002_021e2b3c();
    if (func_ov002_0220e518(arg0) != 0) {
        func_ov002_021df818(arg0, 1 - ((struct Ov002Self *)arg0)->b0, half);
    }
    func_ov002_021e2c5c();
    return 0;
}
