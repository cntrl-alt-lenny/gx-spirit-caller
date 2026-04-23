/* func_0203c5e4: first medium-tier match — interpolation-setup helper.
 *
 * Disassembly (build/eur/asm/_dsd_gap@main_8.s):
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0                  ; cache obj pointer in callee-saved
 *     mov   r3, r1, lsl #0x8        ; target_q24_8 = target << 8
 *     str   r3, [r4, #0x4]          ; obj->target = target_q24_8
 *     strh  r2, [r4, #0xa]          ; obj->frames_left = frames
 *     cmp   r2, #0x0
 *     ldmeqia sp!, {r4, pc}         ; early return if frames == 0
 *     ldr   r0, [r4, #0x0]          ; r0 = obj->current
 *     mov   r1, r2                   ; r1 = frames
 *     sub   r0, r3, r0               ; r0 = target_q24_8 - current (delta, Q24.8)
 *     blx   Div                      ; r0 = delta / frames
 *     cmp   r0, #0x0
 *     moveq r0, #0x1                 ; at-least-one step
 *     strh  r0, [r4, #0x8]           ; obj->step_incr = r0
 *     ldmia sp!, {r4, pc}
 *
 * 15 ARM instructions, 0x3c bytes.
 *
 * Sets up a per-frame linear-interpolation ramp on a small "anim"
 * struct:
 *
 *     struct anim_linear {
 *         int                current;        // +0x0  (Q24.8 fixed-point)
 *         int                target;         // +0x4  (Q24.8)
 *         unsigned short     step_incr;      // +0x8  per-frame delta
 *         unsigned short     frames_left;    // +0xa
 *         int                _reserved;      // +0xc  (seen as stride padding
 *                                            //        in func_02037c54's
 *                                            //        0x10-byte table-stride;
 *                                            //        not touched by any of
 *                                            //        the three siblings)
 *     };
 *
 * Caller supplies a new `target` (scalar, integer units) and a number
 * of `frames` over which to reach it. The function stores the target
 * as Q24.8 (shifted left by 8), records the frame count, and computes
 * the per-frame step increment via the BIOS `Div` SWI. `step_incr`
 * clamps to at-least-1 so the ramp makes forward progress even for
 * tiny deltas.
 *
 * Three siblings share this shape:
 *
 *   func_0203c5e4 (this file, 0x3c) — direct call on a struct pointer.
 *   func_0203c5a4 (0x40)            — same logic on a struct embedded
 *                                     at offset 0xa0 inside a larger
 *                                     outer object, with a NULL-check.
 *   func_02037c54 (0x4c)            — indexed-table variant (table
 *                                     base `data_0219b3d0`, stride
 *                                     0x10), with a `frames -> max(1)`
 *                                     clamp instead of an early-return.
 *
 * The `blx Div` is an ARM → Thumb interworking call. `Div` is a
 * Thumb SWI thunk (brief 013's `swi 0x9`). mwcc compiles this as
 * `bl Div` at the .o level; mwldarm rewrites it to `blx` at link
 * time once it sees `Div`'s symbol marked Thumb.
 */

extern int Div(int num, int denom);

typedef struct {
    int current;                /* +0x0  Q24.8 */
    int target;                 /* +0x4  Q24.8 */
    unsigned short step_incr;   /* +0x8  per-frame step */
    unsigned short frames_left; /* +0xa  count-down */
    int _reserved;              /* +0xc  pads struct to 0x10 stride */
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
