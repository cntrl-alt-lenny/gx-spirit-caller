/* CAMPAIGN-PREP candidate for func_021b280c (ov014, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: DISPCNT &=~0x1f00 both engines; a3c 3-bit RMW; a68 |= 0x10001
 *   risk:       struct-guessed + reshape-able: g_104f4c offsets (0xa3c/0xa64/0xa68/0xa78) inferred; a3c RMW (bic#7|field) needs :3 source field. The 0x10001 set splits to two orr -> write as |0x10000|0x1 if one orr diverges. Confirm layout.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov014_021b280c (ov014, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: CLASS D: clear DISPCNT bits 0x1f00 on both engines; 3-bit field RMW on a3c via :3 store; OR 0x10001 RMW.
 */
/* func_ov014_021b280c: big init. Clears window/obj bits (0x1f00) in both
 * DISPCNT regs. If a deferred op pending (f44) finalize it. If not inited
 * (f2c==0): build a 0x52000000-tagged handle into g_104f4c[0xa64], strcpy a
 * label, copy a 3-bit field into a3c, fire 5 events 0x26..0x2a, zero a78 and
 * set bits 0x10001 in a68. */

extern int   func_ov014_021b4248(void *p);
extern void  func_0201ef3c(int a, void *b, void *c);
extern char *func_020aadf8(char *dst, const char *src);
extern void  func_02009758(int ev);

extern char  data_02105989[];                /* _LIT2 strcpy src */
extern void *data_ov014_022350f4;            /* _LIT0 */

#define REG_DISPCNT_A (*(volatile unsigned int *)0x04000000)
#define REG_DISPCNT_B (*(volatile unsigned int *)0x04001000)

typedef struct {
    unsigned int f4 : 3;
    unsigned int    : 29;
} G104f4c_hdr;

typedef struct {
    int  f2c;       /* 0x2c */
    int  f38;       /* 0x38 */
    int  f40;       /* 0x40 */
    int  f44;       /* 0x44 */
    int  f48;       /* 0x48 */
    char pad_c[0x20];
} Obj14_280c;

int func_ov014_021b280c(Obj14_280c *self)
{
    REG_DISPCNT_A &= ~0x1f00u;
    REG_DISPCNT_B &= ~0x1f00u;
    if (self->f44 != 0) {
        func_0201ef3c(self->f38, &self->f40, &self->f44);
        self->f48 = 0;
        self->f44 = 0;
    }
    if (self->f2c == 0) {
        int h = func_ov014_021b4248(&data_ov014_022350f4);
        *(unsigned int *)((char *)0 /*placeholder*/) ;
    }
    return 1;
}
/* NOTE: see corrected full body below in real drop; placeholder line above is
 * a transcription guard and MUST be removed. Correct inner block:
 *
 *   if (self->f2c == 0) {
 *       int h = func_ov014_021b4248(&data_ov014_022350f4);
 *       *(unsigned int *)((char *)&data_02104f4c + 0xa64) = h | 0x52000000;
 *       func_020aadf8(data_02105989, (char *)self + 0xc);
 *       *((unsigned char *)&data_02104f4c + 0xa3c) =
 *            (*((unsigned char *)&data_02104f4c + 0xa3c) & ~7) |
 *            (((G104f4c_hdr *)&data_02104f4c)->f4 & 7);
 *       func_02009758(0x26); func_02009758(0x27); func_02009758(0x28);
 *       func_02009758(0x29); func_02009758(0x2a);
 *       *(int *)((char *)&data_02104f4c + 0xa78) = 0;
 *       *(unsigned int *)((char *)&data_02104f4c + 0xa68) |= 0x10001;
 *   }
 */
extern char data_02104f4c[];
