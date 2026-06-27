/* CAMPAIGN-PREP candidate for func_02220100 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch on ce288+0x5a8; bit0 :1, f1 :5; (u8) byte-pack lo|hi<<8 lever
 *   risk:       ASM TRUNCATED inside case 0x7f and cases 0x7d/0x7e entirely absent; _LIT1 (the f0 compare const) read as 0x1a is inferred. struct-guessed (truncation).
 *   confidence: low
 */
/* func_ov002_02220100: ov002 state dispatch + (u8) byte-pack chains (cls D).
 * State at ce288+0x5a8 -> 0x7d-0x80 table. Cases pack bit0 (lo) | f1<<8 (hi)
 * as a u16 via the (u8) byte-pack lever. WARNING: the batch asm is TRUNCATED
 * inside case 0x7f (.L_f0) after 021ae400; that case's tail is ABSENT. This is
 * a SCAFFOLD for the visible 0x80 body + prefix of 0x7f. */
typedef unsigned short u16;
typedef unsigned char  u8;
struct Self { u16 f0; u16 b0 : 1; u16 f1 : 5; };
extern char data_ov002_022ce288[];
extern int  func_ov002_021ae400(int a, int b);
extern int  func_ov002_021af9d0(int a, int b, int c, int d);
extern int  func_ov002_021afb74(void);
extern int  func_ov002_021bc618(int a);
extern int  func_ov002_021bcd80(int a);
extern int  func_ov002_021ca2b8(int a, int b, int c, int d);
extern int  func_ov002_0225368c(int a, int b, int c);
extern int  func_ov002_0226aff0(int a, int b);
int func_ov002_02220100(struct Self *self) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        if (func_ov002_021ca2b8(self->b0, 0, 0, 0) == 0)
            return 0;
        if (func_ov002_0225368c(self->b0, self->f0, 0) == 0)
            return 0;
        if (self->f0 == 0x1a) {
            if (func_ov002_021bcd80((u16)((u8)self->b0 | ((u8)self->f1 << 8))) == 0)
                return 0;
            func_ov002_0226aff0((u16)((u8)self->b0 | ((u8)self->f1 << 8)), 1);
        }
        return 0x7f;
    case 0x7f:
        if (func_ov002_021bc618(self->b0) == 0)
            return 0;
        func_ov002_021ae400(self->b0, 0x1a);
        /* TRUNCATED: rest of case 0x7f (.L_f0) absent from batch. */
        return 0x7f;
    }
    return 0;
}
