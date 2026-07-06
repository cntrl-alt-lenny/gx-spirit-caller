/* func_ov010_021b2824 (brief 535, B4): touch-rect hit-test drives a
 * 2-bit mode/state transition ladder, then conditionally fires a
 * callback and tail-calls func_ov010_021b26d8. Byte-identical to
 * func_ov015_021b2824 (only the overlay-local callee symbol differs).
 *
 * Key reshape levers:
 *  - savedRng/px/py must be declared in that exact order (px,py
 *    hoisted to function scope, not nested in the if-block) to match
 *    the compiler's stack-slot allocation order.
 *  - `ret` must be declared before `fired` (and `fired = ret`, not a
 *    fresh literal) — this keeps BOTH zero-initialized values in
 *    registers (r4/r5) instead of letting the compiler fold the
 *    provably-dead `ret` accumulator into an immediate at the return.
 *  - `ret = ret + call(); return ret;` (two statements) is required —
 *    `return ret + call();` folds the same way.
 */
typedef struct {
    char pad0[8];              /* 0x0-0x7 */
    int mode;                  /* 0x8 */
    int state;                 /* 0xc */
    int trigger;                /* 0x10 */
    void (*callback)(int);      /* 0x14 */
    int target;                  /* 0x18 */
    short rectX;                  /* 0x1c */
    short rectY;                   /* 0x1e */
    unsigned short rectW;            /* 0x20 */
    unsigned short rectH;             /* 0x22 */
} Widget;

extern void func_020060f4(int *outX, int *outY);
extern unsigned int func_02006148(void);
extern unsigned int func_02006178(void);
extern unsigned short func_0207eb40(void *rng);
extern int func_ov010_021b26d8(Widget *self, int arg2, int *outparam, int flag);

int func_ov010_021b2824(Widget *self, void *rngArg, int arg2)
{
    int px, py;
    int savedRng = func_0207eb40(rngArg);
    int ret = 0;
    int fired = ret;

    if (func_02006178()) {
        func_020060f4(&px, &py);
        if (px >= self->rectX && px <= self->rectX + self->rectW &&
            py >= self->rectY && py <= self->rectY + self->rectH) {
            if (self->state == 0) {
                if (func_02006148()) self->trigger = 1;
            } else {
                self->trigger = 1;
            }
        }
    }

    switch (self->mode) {
    case 0:
        if (self->trigger == 1) {
            if (self->state == 0 && self->target == 2) fired = 1;
            self->state = 1;
        } else {
            if (self->state == 1) {
                if (self->target == 1) fired = 1;
                self->state = 2;
            } else {
                self->state = 0;
            }
        }
        break;
    case 1:
        if (self->trigger == 1) {
            if (self->state == 0) {
                if (self->target == 2) fired = 1;
                self->state = 3;
            } else if (self->state == 1) {
                if (self->target == 2) fired = 1;
                self->state = 2;
            }
        } else {
            if (self->state == 3) {
                if (self->target == 1) fired = 1;
                self->state = 1;
            } else if (self->state == 2) {
                if (self->target == 1) fired = 1;
                self->state = 0;
            }
        }
        break;
    default:
        break;
    }

    if (fired == 1 && self->target > 0) {
        self->callback(self->state);
    }
    self->trigger = 0;
    ret = ret + func_ov010_021b26d8(self, arg2, &savedRng, 0);
    return ret;
}
