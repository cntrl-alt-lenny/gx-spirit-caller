/* CAMPAIGN-PREP candidate for func_022425ac (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     jump-table switch; bit0 bitfield; bind hv across 2 calls; (1<<pos)^0xff
 *   risk:       case-2 u16-return byte-split: ((u16)v>>8) may emit lsr not asr#8, and lo/hi arg eval order around r0; permuter-class. Already shipped as reg-alloc-walled .s.
 *   confidence: low
 */
/* func_ov002_022425ac: ov002 step-dispatch state machine (state at
 * data_ov002_022ce288+0x5b8). 4-entry jump table (cmp#3, addls pc). */
typedef unsigned char  u8;
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; };
extern char data_ov002_022ce288[];
extern char data_ov002_022d0e6c[];
extern int  func_ov002_0223fb48(void);
extern u16  func_ov002_0223de94(void *node, int idx);
extern int  func_ov002_021c92ec(int a, int b, int c, int d);
extern void func_ov002_0226b0f0(int a, int b, int c, int d);
extern void func_ov002_0223dad0(int a);
extern void func_ov002_0226b0b0(int a, int b, int c);

int func_ov002_022425ac(struct Ov002Self *self) {
    int v;
    int pos;
    u16 hv;

    switch (*(int *)(data_ov002_022ce288 + 0x5b8)) {
    case 0:
    case 1:
        if (func_ov002_0223fb48() != 0)
            *(int *)(data_ov002_022ce288 + 0x5b8) = 2;
        return 0;
    case 2:
        v = func_ov002_0223de94(self, 0);
        pos = func_ov002_021c92ec(v & 0xff, ((u16)v >> 8) & 0xff, 0, 0);
        func_ov002_0226b0f0(self->b0, self->f0, 1, (1 << pos) ^ 0xff);
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    case 3:
        hv = *(u16 *)(data_ov002_022d0e6c + 0xb2);
        func_ov002_0223dad0(hv);
        func_ov002_0226b0b0(1 - self->b0, 0x171f, hv);
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    }
    return 1;
}
