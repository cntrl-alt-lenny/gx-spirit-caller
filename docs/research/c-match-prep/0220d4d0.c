/* CAMPAIGN-PREP candidate for func_0220d4d0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 :1; (a&1)*0x868 parity-mul cf17c select; self bound r4; tail clone of 0220d2d0
 *   risk:       the literal split (0x868 in _LIT0, cf17c base in _LIT1) means the index is computed then ldr[base,idx]; C form *(int*)((char*)base+(a&1)*0x868) reproduces and;mul;ldr. Low divergence -- reshape-able if mwcc folds the &1 away (a is 1-bit so &1 is redundant but orig emits it).
 *   confidence: med
 */
/* func_ov002_0220d4d0 (ov002, class D, MED) -- batch p_0030.
 * 021ca2b8(f2.a)!=0; parity-mul cf17c[(a&1)*0x868]==0 -> else return 1;
 * if hit==0: r=0223f6c4(self); 022536e8(f2.a, self->f0, r)!=0 else 0; else 1.
 * Same tail as 0220d2d0 minus the first two guards.
 */
typedef unsigned short u16;

typedef struct Entity {
    u16 field0;
    u16 a : 1;
    u16 b : 5;
    u16 c : 6;
    u16   : 4;
} Entity;

extern int  data_ov002_022cf17c[];
extern int  func_ov002_021ca2b8(int x);
extern int  func_ov002_0223f6c4(Entity *self);
extern int  func_ov002_022536e8(int x, int f0, int r);

int func_ov002_0220d4d0(Entity *self)
{
    int r;
    if (func_ov002_021ca2b8(self->a) == 0) return 0;
    if (*(int *)((char *)data_ov002_022cf17c + (self->a & 1) * 0x868) == 0) {
        r = func_ov002_0223f6c4(self);
        if (func_ov002_022536e8(self->a, self->field0, r) == 0) return 0;
    }
    return 1;
}
