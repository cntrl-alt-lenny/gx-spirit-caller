/* CAMPAIGN-PREP candidate for func_021b3ca8 (ov017, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     state switch; tst-bit key chain; inc/wrap cursor via if-assign (movgt/movmi); sound calls
 *   risk:       struct-guessed + INCOMPLETE: batch asm is truncated at .L_8d8 (no epilogue, ~40% of the 0x1c4 body missing: .L_924/.L_98c/.L_8fc bodies and pool). Cannot byte-match until full asm is fetched. All struct offsets and the f02037208 arg pattern (0x38, sub r1=#-1) are inferred. Reshape-able once complete; treat as scaffold.
 *   confidence: low
 */
/* func_ov017_021b3ca8 (ov017, class C) — menu/input state dispatcher.
 * WARNING: the asm in the batch is TRUNCATED (ends mid-body at .L_8d8
 * with no epilogue / no .L_924 / .L_98c / .L_8fc / .L_8c8 fall-through and
 * no literal pool); size is 0x1c4 = 452B. The C below models only the
 * VISIBLE control flow and WILL be incomplete.
 *
 * Visible logic:
 *  - g = &data_02104f4c (_LIT0). if g->_8 != 0 -> run f021b7ba0(g); if it
 *    returns nonzero: f021b7b5c(g); data_..._a78 = 0; f021b34c4(self);
 *    return 0 (the inner 'else' just returns 0).
 *  - else switch on self->_4: 0 -> keypad block; 1 -> (.L_924, unseen);
 *    default -> (.L_98c, unseen).
 *  - keypad block: kp = &data_02104bac (_LIT2). if kp->_52 != 0:
 *      keys = kp->_54;
 *      if (keys & 0x10) { self->_c=(self->_c+1>4)?0:self->_c+1;
 *                         f02037208(0x38,-1,0,1); }
 *      else if (keys & 0x20) { self->_c=(--self->_c<0)?4:self->_c;
 *                              f02037208(0x38,-1,0,1); }
 *      else if (keys & 0x1) { f021b3e6c(); return; }
 *      else if (keys & 0x2) { ...sound 0x42,-1...(truncated) }
 */
extern int  func_ov017_021b7ba0(void *g);
extern void func_ov017_021b7b5c(void *g);
extern void func_ov017_021b34c4(void *self);
extern void func_ov017_021b3e6c(void);
extern void func_02037208(int a, int b, int c, int d);

typedef struct { unsigned char _pad[0x8]; int _8; } Global;   /* +0x8 */
extern Global data_02104f4c;

typedef struct { unsigned char _pad[0xa7c]; } Big;            /* _a78 written */
extern Big data_ov017_021b8610;

typedef struct {                                             /* keypad regs */
    unsigned char _pad[0x52];
    unsigned short trig;   /* +0x52 */
    unsigned short held;   /* +0x54 */
} Keypad;
extern Keypad data_02104bac;

typedef struct {
    unsigned char _pad0[0x4];
    int state;            /* +0x4 */
    unsigned char _pad8[0x4];
    int cursor;           /* +0xc */
} Self;

int func_ov017_021b3ca8(Self *self) {
    Global *g = &data_02104f4c;

    if (g->_8 != 0) {
        if (func_ov017_021b7ba0(g) != 0) {
            func_ov017_021b7b5c(&data_02104f4c);
            *(int *)((char *)&data_ov017_021b8610 + 0xa78) = 0;
            func_ov017_021b34c4(self);
        }
        return 0;
    }

    if (self->state == 0) {
        Keypad *kp = &data_02104bac;
        if (kp->trig != 0) {
            unsigned short keys = kp->held;
            if (keys & 0x10) {
                if (++self->cursor > 4) self->cursor = 0;
                func_02037208(0x38, -1, 0, 1);
            } else if (keys & 0x20) {
                if (--self->cursor < 0) self->cursor = 4;
                func_02037208(0x38, -1, 0, 1);
            } else if (keys & 0x1) {
                func_ov017_021b3e6c();
                return /* r0 set by callee path */ 0;
            } else if (keys & 0x2) {
                /* TRUNCATED: sound id 0x42, then fall to .L_98c */
            }
        }
        /* fallthrough .L_98c (unseen) */
    } else if (self->state == 1) {
        /* .L_924 (unseen) */
    } else {
        /* .L_98c (unseen) */
    }
    return 0;
}
