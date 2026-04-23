/* func_0203c5e4: first medium-tier match — interpolation setup.
 *
 *     stmdb sp!, {r4, lr}
 *     mov r4, r0                    ; cache obj pointer in callee-saved
 *     mov r3, r1, lsl #0x8          ; target_q24_8 = target << 8
 *     str r3, [r4, #0x4]            ; obj->target = target_q24_8
 *     strh r2, [r4, #0xa]           ; obj->frames_left = frames (u16)
 *     cmp r2, #0x0
 *     ldmeqia sp!, {r4, pc}         ; early-return if frames == 0
 *     ldr r0, [r4, #0x0]            ; r0 = obj->current
 *     mov r1, r2                    ; r1 = frames
 *     sub r0, r3, r0                ; r0 = target - current (delta, Q24.8)
 *     blx Div                       ; r0 = delta / frames
 *     cmp r0, #0x0
 *     moveq r0, #0x1                ; at-least-one step
 *     strh r0, [r4, #0x8]           ; obj->step_incr = r0
 *     ldmia sp!, {r4, pc}
 *
 * Sets up a per-frame linear-interpolation ramp: given a current
 * value at offset 0x0, store a new target at offset 0x4 (left-shifted
 * 8 bits — classic Q24.8 fixed-point), record the number of frames,
 * and compute the step increment via the BIOS Div SWI. Two siblings
 * (func_0203c5a4 and func_02037c54) share this shape, differing
 * only by offset layout or array-index arithmetic. This is first.
 *
 * The Div call is an ARM→Thumb interworking call — the linker
 * rewrites the `bl Div` to `blx Div` because Div (brief 013's
 * `swi 0x9` thunk) is a Thumb symbol.
 */

extern int Div(int num, int denom);

typedef struct {
    int current;                    /* +0x0, Q24.8 */
    int target;                     /* +0x4, Q24.8 */
    unsigned short step_incr;       /* +0x8 */
    unsigned short frames_left;     /* +0xa */
} anim_linear_t;

void func_0203c5e4(anim_linear_t *obj, int target, unsigned short frames) {
    int target_q24_8 = target << 8;
    int step;

    obj->target = target_q24_8;
    obj->frames_left = frames;
    if (frames == 0) return;

    step = Div(target_q24_8 - obj->current, frames);
    if (step == 0) step = 1;
    obj->step_incr = step;
}
