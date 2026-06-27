/* CAMPAIGN-PREP candidate for func_021b7ba0 (ov017, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class-D /2 and /8 signed via plain '/' (constant divisor); state switch; store-order MMIO (best-effort, asm truncated)
 *   risk:       TRUNCATED asm: cases 2/default and tails of 1/.L_f8 + literal pool (_LIT1 mask/_LIT2 MMIO addr) are MISSING -- struct-guessed offsets and unknown MMIO consts; needs full .s to match.
 *   confidence: low
 */
/* func_ov017_021b7ba0: ***ASM TRUNCATED in batch*** (size=524, only ~first 80 insns
 * given; cases .L_180/.L_1f4 and the tail of .L_b4/.L_f8 + literal pool are missing).
 * Skeleton from the VISIBLE prologue + dispatch + case0 (which is complete):
 *   p = arg0; centre = (0xc0 - p->f14)/2 - 8 ; off = p->f14 + (0xc0-p->f14)/2 - 8
 *   h = *(u16*)(data_02104bac + 0x54)
 *   switch(p->f4){0,1,2,default}
 *   case0: n=++p->f1c; MMIO[ip]=mask&((p->f14 - (off*n)/8)<<16); MMIO[ip+4]= ...f1c;
 *          if(p->f1c>=8) p->f4=1;
 * The /2 and /8 are signed shift-divides (class D). Divisor is constant -> plain '/'. */

extern char data_02104bac[];
extern void func_02006148(void *a, void *b, int c, int d);
extern void func_0200617c(void);
extern void func_02037208(int a, int b, int c, int d);

typedef struct {
    int f0;
    int f4;
    char _pad8[0xc];
    int f14;
    char _pad18[0x4];
    int f1c;
} St_021b7ba0;

int func_ov017_021b7ba0(St_021b7ba0 *p) {
    int centre = (0xc0 - p->f14) / 2 - 8;
    int off    = p->f14 + (0xc0 - p->f14) / 2 - 8;
    int h = *(unsigned short *)(data_02104bac + 0x54);
    switch (p->f4) {
    case 0: {
        int n = p->f1c + 1;
        p->f1c = n;
        *(int *)0x04000050 = 0xffff0000 & ((p->f14 - (off * n) / 8) << 16);
        *(int *)0x04000054 = 0xffff0000 & ((p->f14 - (off * p->f1c) / 8) << 16);
        if (p->f1c >= 8) p->f4 = 1;
        break;
    }
    case 1:
        if (p->f0 != 0) {
            if (h == 0) {
                if (p->f0 == 1) { /* .L_f8: point-fetch + clamp -- TRUNCATED */ }
            } else if (p->f0 == 1 && (h & 3)) {
                p->f4 = 2;
                func_02037208(0x3a, -1, 0, 1);
            }
        }
        break;
    case 2:  /* .L_180 -- TRUNCATED */
        break;
    default: /* .L_1f4 */
        break;
    }
    (void)centre;
    return 1;
}
