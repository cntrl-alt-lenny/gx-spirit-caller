/* CAMPAIGN-PREP candidate for func_02229900 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sparse switch(state 0x64/0x78/0x7f/0x80) -> cmp-cascade; fC reload; b0=f2.bit0 re-read per use
 *   risk:       struct-guessed/TRUNCATED: cases 0x64(.L_11c) and default(.L_134) absent from asm -> stubbed and WILL diverge; visible cases faithful. Confirm fC offset 0xC and state-dispatch order.
 *   confidence: low
 */
/* func_ov002_02229900 (ov002, class D, MED) brief 498. UNVERIFIED.
 * !! TRUNCATED ASM: body stops at .L_100 (90 lines). Cases 0x64 (.L_11c) and default (.L_134) absent -> stubbed; WILL diverge.
 * Decode: state=*(int*)(ce288+0x5a8); fC=self->fC; b0=f2.bit0.
 *   0x80: r=0225368c(b0,f0,fC); if(r){021af9d0(b0,6,f0,fC);return 0x7f;} if(fC!=1)return 0; 021ae400(b0,0x15); return 0x78;
 *   0x7f: x=021afb74(); if(fC==1){021d8288(b0,x);return 0x64;} 021d7d0c(self,b0,x); return 0;
 *   0x78: 0226b054(1-b0); return 0x64;  0x64/default: TRUNCATED. */
typedef unsigned short u16;
struct F02229900_F2 { u16 bit0 : 1; u16 rest : 15; };
struct F02229900_Self { u16 f0; struct F02229900_F2 f2; u16 pad4; u16 pad6; u16 pad8; u16 pada; u16 fC; };

extern unsigned char data_ov002_022ce288[];
extern int  func_ov002_0225368c(int b0, int f0, int fC);
extern void func_ov002_021af9d0(int b0, int six, int f0, int fC);
extern void func_ov002_021ae400(int b0, int x15);
extern int  func_ov002_021afb74(void);
extern void func_ov002_021d8288(int b0, int x);
extern void func_ov002_021d7d0c(struct F02229900_Self *self, int b0, int x);
extern void func_ov002_0226b054(int notb0);
extern void func_ov002_021e286c(void);

int func_ov002_02229900(struct F02229900_Self *self) {
    int state = *(int *)(data_ov002_022ce288 + 0x5a8);
    int fC = self->fC;
    switch (state) {
    case 0x80:
        if (func_ov002_0225368c(self->f2.bit0, self->f0, fC) != 0) {
            func_ov002_021af9d0(self->f2.bit0, 6, self->f0, fC);
            return 0x7f;
        }
        if (fC != 1)
            return 0;
        func_ov002_021ae400(self->f2.bit0, 0x15);
        return 0x78;
    case 0x7f: {
        int x = func_ov002_021afb74();
        if (fC == 1) {
            func_ov002_021d8288(self->f2.bit0, x);
            return 0x64;
        }
        func_ov002_021d7d0c(self, self->f2.bit0, x);
        return 0;
    }
    case 0x78:
        func_ov002_0226b054(1 - self->f2.bit0);
        return 0x64;
    case 0x64:
        func_ov002_021e286c();
        return 0;
    }
    return 0;
}
