/* CAMPAIGN-PREP candidate for func_0222a3e0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload ce288 each use; f6.hi :8; flag-bit tst 1<<shift; d0250 SlotU16.id; :8 decrement
 *   risk:       the high-half guard: orig `movs r0,...,lsr#16; bmi` (never-taken via lsr) but a signed test needs asr. (short)(v>>16) emits asr#16 -> 1-insn diverge from the lsr. permuter-class (codegen-finicky guard). Also 1<<b0 vs orig mov#1,lsl r0 order.
 *   confidence: low
 */
/* func_ov002_0222a3e0: state handler. ce288+0x5a8 state (RELOADED each use, orig
 * re-ldr's _LIT0). 0x80 -> zero 0x5ac then fall; 0x7f -> fall; else return 0.
 * Body: if f6.hi==0 -> two flag-bit tests (1<<b0 / 1<<(1-b0)) gating 021e286c;
 * else 0223def4(self,hi-1), 021b947c unpack, guard, 021d7268, d0250 slot id ->
 * 0202e2c8; if 0, 0x5ac |= 1<<lo. Always decrement f6.hi (:8 insert) ret 0x7f.
 * NOTE: the high-half guard is `movs r0,...lsr#16; bmi` which is structurally a
 * (short)(v>>16)<0 test but orig uses lsr not asr (see risk). */
typedef unsigned short u16;
struct S { u16 f0; u16 b0 : 1; u16 : 15; u16 pad4; struct { u16 lo : 8; u16 hi : 8; } f6; };
struct SlotU16 { u16 id : 13; };
extern char data_ov002_022ce288[];
extern char data_ov002_022d0250[];
extern int  func_0202e2c8(int id);
extern unsigned int func_ov002_021b947c(void);
extern int  func_ov002_021d7268(int lo, int idx, int one);
extern void func_ov002_021e286c(void);
extern int  func_ov002_0223def4(struct S *self, int idx);

int func_ov002_0222a3e0(struct S *self) {
    int hi;
    int idx;
    unsigned int v;
    int lo;
    if (*(int *)(data_ov002_022ce288 + 0x5a8) != 0x7f) {
        if (*(int *)(data_ov002_022ce288 + 0x5a8) != 0x80) return 0;
        *(int *)(data_ov002_022ce288 + 0x5ac) = 0;
    }
    hi = self->f6.hi;
    if (hi == 0) {
        if (*(int *)(data_ov002_022ce288 + 0x5ac) & (1 << self->b0))
            func_ov002_021e286c();
        if (*(int *)(data_ov002_022ce288 + 0x5ac) & (1 << (1 - self->b0)))
            func_ov002_021e286c();
        return 0x7f;
    }
    idx = func_ov002_0223def4(self, hi - 1);
    v = func_ov002_021b947c();
    lo = v & 0xff;
    if ((int)(short)(v >> 16) >= 0) {
        func_ov002_021d7268(lo, idx, 1);
        if (func_0202e2c8(((struct SlotU16 *)(data_ov002_022d0250 + idx * 4))->id) == 0)
            *(int *)(data_ov002_022ce288 + 0x5ac) |= 1 << lo;
    }
    self->f6.hi = self->f6.hi - 1;
    return 0x7f;
}
