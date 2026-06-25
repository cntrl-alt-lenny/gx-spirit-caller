/* CAMPAIGN-PREP candidate for func_02029c80 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield :1 (lsl;lsr), if/else dispatch, tail-call groups
 *   risk:       struct offsets/padding guessed; bit2 position and the 2x2 branch nesting order may flip on objdiff
 *   confidence: med
 */
/* func_02029c80: bitfield-test (bit2 of u16 @0x19a) gates a tmp source
 * (f84 vs f90), masks bit0 -> flag; calls func_02092904(a1,a3); then a
 * 2x2 dispatch on (s16 @0x18c != 0) x flag. Returns 1. */

extern void func_02092904(void *a, int c);
extern void func_0208f458(void);
extern void func_0208f3e4(void *a, void *b, int c);
extern void func_0208f38c(void);
extern void func_0208ff1c(void *a, void *b, int c);
extern void func_0208f284(void);
extern void func_0208f210(void *a, void *b, int c);
extern void func_0208f1c4(void);
extern void func_0208feb4(void *a, void *b, int c);

typedef struct Obj02029c80 {
    char            _pad_00[0x84];
    unsigned int    f_84;          /* +0x84 */
    char            _pad_88[0x90 - 0x88];
    unsigned int    f_90;          /* +0x90 */
    char            _pad_94[0x18c - 0x94];
    short           f_18c;         /* +0x18c (s16) */
    char            _pad_18e[0x19a - 0x18e];
    unsigned short  b0 : 2;        /* +0x19a bits .. */
    unsigned short  bit2 : 1;      /* bit 2 -> lsl#29;lsr#31 */
    unsigned short  b3 : 13;
} Obj02029c80;

int func_02029c80(Obj02029c80 *self, void *a1, void *a2, int a3) {
    unsigned int tmp;
    int flag;

    if (self->bit2)
        tmp = self->f_84;
    else
        tmp = self->f_90;
    flag = tmp & 1;

    func_02092904(a1, a3);

    if (self->f_18c != 0) {
        if (flag) {
            func_0208f284();
            func_0208f210(a1, a2, a3);
            func_0208f1c4();
        } else {
            func_0208feb4(a1, a2, a3);
        }
    } else {
        if (flag) {
            func_0208f458();
            func_0208f3e4(a1, a2, a3);
            func_0208f38c();
        } else {
            func_0208ff1c(a1, a2, a3);
        }
    }
    return 1;
}
