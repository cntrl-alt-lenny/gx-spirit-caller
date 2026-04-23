/* func_020386f4: medium-tier — cousin of the PR #115 interpolation
 * family (func_0203c5e4 + siblings), with richer return semantics.
 *
 * Disassembly (build/eur/asm/_dsd_gap@main_8.s):
 *
 *     stmdb sp!, {r3, r4, r5, lr}
 *     mov   r5, r0                     ; cache obj in callee-saved
 *     mov   r3, r1, lsl #0x8           ; target_q24_8 = target << 8
 *     str   r3, [r5, #0x4]             ; obj->target = target_q24_8
 *     cmp   r2, #0x0
 *     strh  r2, [r5, #0xa]             ; obj->frames_left = frames (unconditional)
 *     streq r3, [r5, #0x0]             ; if frames == 0: obj->current = target
 *     moveq r0, #0x0                   ; ... and return 0
 *     ldmeqia sp!, {r3, r4, r5, pc}
 *     ldr   r0, [r5, #0x0]             ; current
 *     mov   r1, r2                      ; frames
 *     sub   r4, r3, r0                  ; delta (kept in r4 for sign test below)
 *     mov   r0, r4
 *     blx   Div                         ; r0 = delta / frames
 *     cmp   r0, #0x0
 *     bne   .L_02038740                 ; step non-zero: skip clamp
 *     mov   r0, #0x1                    ; step = 1 (default)
 *     cmp   r4, #0x0
 *     sublt r0, r0, #0x2                ; if delta < 0: step = 1 - 2 = -1
 *   .L_02038740:
 *     strh  r0, [r5, #0x8]              ; obj->step_incr = step
 *     mov   r0, #0x1                    ; return 1 (ramp started)
 *     ldmia sp!, {r3, r4, r5, pc}
 *
 * 22 ARM instructions, 0x58 bytes. Same `anim_linear_t` shape as
 * PR #115's trio, but returns int (0 = snapped-already, 1 = ramp
 * computed) and knows about **signed** deltas — when Div rounds a
 * tiny negative delta to 0, the clamp goes to -1 rather than +1.
 *
 * The step-sign-aware clamp is what distinguishes this from
 * func_0203c5e4's step-is-always-positive clamp: here the ramp can
 * run in either direction, and the smallest meaningful step shares
 * the sign of delta.
 *
 * The unconditional `strh r2, [r5, #0xa]` after `cmp r2, #0` is
 * mwcc's schedule: the store doesn't set flags, so the pending
 * EQ-condition from the cmp survives to the streq / moveq / ldmeqia
 * three-in-a-row early-return path.
 */

extern int Div(int num, int denom);

typedef struct {
    int current;
    int target;
    unsigned short step_incr;
    unsigned short frames_left;
    int _reserved;
} anim_linear_t;

int func_020386f4(anim_linear_t *obj, int target, unsigned short frames) {
    int target_q24_8 = target << 8;
    int delta, step;

    obj->target = target_q24_8;
    obj->frames_left = frames;
    if (frames == 0) {
        obj->current = target_q24_8;
        return 0;
    }

    delta = target_q24_8 - obj->current;
    step = Div(delta, frames);
    if (step == 0) {
        step = 1;
        if (delta < 0) step -= 2;
    }
    obj->step_incr = step;
    return 1;
}
