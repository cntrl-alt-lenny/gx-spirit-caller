/* func_020386fc: medium-tier — short-struct variant of func_020386a4.
 *
 * Disassembly (build/eur/asm/_dsd_gap@main_8.s):
 *
 *     stmdb sp!, {r3, r4, r5, lr}
 *     mov   r3, r1, lsl #0x8            ; r3 = target << 8 (32-bit, kept for delta)
 *     mov   r1, r3, lsl #0x10           ;
 *     mov   r5, r0                       ; cache obj
 *     mov   r0, r1, asr #0x10           ; r0 = (short)(target << 8) — sign-extend idiom
 *     strh  r0, [r5, #0x2]              ; obj->target = truncated short
 *     strh  r2, [r5, #0x6]              ; obj->frames_left = frames
 *     cmp   r2, #0x0
 *     streqh r0, [r5, #0x0]             ; if frames == 0: obj->current = target
 *     moveq r0, #0x0
 *     ldmeqia sp!, {r3, r4, r5, pc}
 *     ldrsh r0, [r5, #0x0]              ; r0 = sign_extend(obj->current)
 *     mov   r1, r2
 *     sub   r4, r3, r0                  ; delta = target_q8_8(32-bit) - current
 *     mov   r0, r4
 *     blx   Div
 *     cmp   r0, #0x0
 *     bne   .L_020387a0
 *     mov   r0, #0x1
 *     cmp   r4, #0x0
 *     sublt r0, r0, #0x2                ; signed clamp: -1 for negative delta
 *   .L_020387a0:
 *     strh  r0, [r5, #0x4]              ; obj->step_incr = step
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, r4, r5, pc}
 *
 * 24 ARM instructions, 0x60 bytes. Same semantics as func_020386a4,
 * but operating on an 8-byte all-halfword struct:
 *
 *     struct anim_linear_short {
 *         short          current;      // +0  Q8.8 signed
 *         short          target;       // +2  Q8.8 signed
 *         short          step_incr;    // +4
 *         unsigned short frames_left;  // +6
 *     };
 *
 * The shift-by-16-then-asr-by-16 dance materialises `(short)(target
 * << 8)` for the **stored** value — truncating to the struct's u16
 * field. But the delta math uses the full 32-bit `target << 8` kept
 * in r3 across the store, preserving accuracy before the Div call.
 * That's why we need a local `int target_q8_8` rather than storing
 * `obj->target` and reading it back: the write loses the top bits,
 * the 32-bit value still held in r3 has them.
 *
 * The signed-clamp tail (same as func_020386a4) makes sense here
 * too — this struct tracks a signed value so `step_incr` can be
 * negative.
 */

extern int Div(int num, int denom);

typedef struct {
    short          current;      /* +0  Q8.8 signed */
    short          target;       /* +2  Q8.8 signed */
    short          step_incr;    /* +4 */
    unsigned short frames_left;  /* +6 */
} anim_linear_short_t;

int func_020386fc(anim_linear_short_t *obj, int target, unsigned short frames) {
    int target_q8_8 = target << 8;
    int delta, step;

    obj->target = (short)target_q8_8;
    obj->frames_left = frames;
    if (frames == 0) {
        obj->current = (short)target_q8_8;
        return 0;
    }

    delta = target_q8_8 - obj->current;
    step = Div(delta, frames);
    if (step == 0) {
        step = 1;
        if (delta < 0) step -= 2;
    }
    obj->step_incr = (short)step;
    return 1;
}
