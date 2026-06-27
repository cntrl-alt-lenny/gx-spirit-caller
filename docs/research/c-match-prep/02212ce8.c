/* CAMPAIGN-PREP candidate for func_02212ce8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: out-param unpack b1=((u16)out>>8)&0xff (signed int shift gives asr); single address expr -> double-mla per-player index; :13 id; b0/b1 bound.
 *   risk:       struct-guessed: cf16c stride 0x868 / 0x14 sub-row / +0x30 / :13 id are core.h conventions — confirm against real layout. Codegen (incl. asr, double-mla) byte-verified.
 *   confidence: high
 */
/* func_ov002_02212ce8 (ov002, cls D): query (self,0,&out); unpack out byte/byte;
 * gate; double-mla per-player table index -> :13 id; calls. Always returns 0. */
typedef unsigned short u16;
typedef unsigned int   u32;

struct Ov002Slot13 { u32 id : 13; };

extern char data_ov002_022cf16c[];   /* per-player row table, 0x868 stride */

extern int  func_ov002_0223df38(void *self, int idx, void *out);
extern int  func_ov002_0225764c(void *self, int b0, int b1);
extern void func_ov002_021d6714(int b0, int b1, int c);
extern int  func_ov002_021df708(int b0, int id);
extern int  func_ov002_021e2b1c(u32 n);

int func_ov002_02212ce8(void *self) {
    int out;
    int b0, b1;
    if (func_ov002_0223df38(self, 0, &out) == 0) return 0;
    b0 = out & 0xff;
    b1 = ((u16)out >> 8) & 0xff;
    if (func_ov002_0225764c(self, b0, b1) == 0) return 0;
    func_ov002_021d6714(b0, b1, 1);
    func_ov002_021df708(
        b0,
        ((struct Ov002Slot13 *)((char *)data_ov002_022cf16c
            + (b0 & 1) * 0x868 + b1 * 20 + 0x30))->id);
    func_ov002_021e2b1c(30);
    func_ov002_021d6714(b0, b1, 0);
    return 0;
}
