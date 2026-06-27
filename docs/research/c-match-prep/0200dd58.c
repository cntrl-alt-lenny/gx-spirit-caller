/* CAMPAIGN-PREP candidate for func_0200dd58 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :4 bitfield@bit21 increment->lsl7;lsr28; blx callback; Fill32(0,obj,0x284) arg-order
 *   risk:       reshape-able/struct-guessed: bitfield increment must re-extract via lsl#7;lsr#28 not `and`; mwcc may cache `count` across the cmp instead of reloading [0x60] -> bind-vs-reload flip. cb@0x58 inferred
 *   confidence: med
 */
/* func_0200dd58 @ 0x0200dd58 (main, class D)
 * Increment a 4-bit bitfield at bit 21 of field 0x60 (mask 0x01E00000),
 * then if the new value > 2 run a teardown: two helper calls, an optional
 * indirect callback (fn at 0x58 with arg at 0x5c), then Fill32(0, obj, 0x284).
 *
 *   bf = ((*0x60) >> 21) & 0xF;  bf = bf + 1;  write back;
 *   if (bf <= 2) return;
 *   func_020109a8();
 *   func_02010a98(obj);
 *   if (obj->cb) obj->cb(obj->cb_arg);     // ldr r0,[r4,#0x5c]; blx r1
 *   Fill32(0, obj, 0x284);
 *
 * The (x<<7)>>28 extract + (y<<28)>>7 insert pair => a :4 bitfield at bit 21.
 * Use a bitfield struct so mwcc emits lsl#7;lsr#28 (a plain mask gives `and`).
 */

typedef void (*Cb0200dd58)(int arg);

struct Obj0200dd58 {
    char _pad0[0x58];
    Cb0200dd58 cb;          /* 0x58 */
    int        cb_arg;      /* 0x5c */
    /* 0x60 packed: bits [20:0] low, [24:21] = 4-bit counter, [31:25] high */
    unsigned int low   : 21;   /* 0x60, bits 0..20  */
    unsigned int count : 4;    /* 0x60, bits 21..24 */
    unsigned int high  : 7;    /* 0x60, bits 25..31 */
};

extern void Fill32(int value, void *dest, int size);
extern void func_020109a8(void);
extern void func_02010a98(struct Obj0200dd58 *obj);

void func_0200dd58(struct Obj0200dd58 *obj)
{
    obj->count = obj->count + 1;
    if (obj->count <= 2) {
        return;
    }
    func_020109a8();
    func_02010a98(obj);
    if (obj->cb != 0) {
        obj->cb(obj->cb_arg);
    }
    Fill32(0, obj, 0x284);
}
