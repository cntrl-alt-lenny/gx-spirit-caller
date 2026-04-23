/* func_0203c5a4: sibling of func_0203c5e4 — same interpolation setup,
 * but operating on an anim struct embedded at offset 0xa0 inside a
 * larger outer object, with a NULL-pointer check up front.
 *
 * Disassembly (build/eur/asm/_dsd_gap@main_8.s):
 *
 *     stmdb sp!, {r4, lr}
 *     movs  r4, r0                   ; r4 = outer; flags = (r0 == 0?)
 *     ldmeqia sp!, {r4, pc}          ; early return if outer == NULL
 *     mov   r3, r1, lsl #0x8
 *     str   r3, [r4, #0xa4]          ; outer->anim.target
 *     strh  r2, [r4, #0xaa]          ; outer->anim.frames_left
 *     cmp   r2, #0x0
 *     ldmeqia sp!, {r4, pc}          ; early return if frames == 0
 *     ldr   r0, [r4, #0xa0]          ; r0 = outer->anim.current
 *     mov   r1, r2
 *     sub   r0, r3, r0
 *     blx   Div
 *     cmp   r0, #0x0
 *     moveq r0, #0x1
 *     strh  r0, [r4, #0xa8]          ; outer->anim.step_incr
 *     ldmia sp!, {r4, pc}
 *
 * 16 ARM instructions, 0x40 bytes.
 *
 * Differences from func_0203c5e4: the `movs r4, r0` combines the
 * pointer-cache with a NULL-check (returns early if the outer object
 * is null); the four struct accesses use offsets 0xa0/0xa4/0xa8/0xaa
 * instead of 0/4/8/a because the `anim_linear` sub-struct lives at
 * offset 0xa0 within the outer object.
 *
 * See func_0203c5e4.c for the shared template walkthrough.
 *
 * The large-offset accesses (0xa0+) use a struct typedef to force
 * mwcc's base-plus-offset codegen — the brief-006 literal-pool
 * folding workaround from ov015_021b3f80 applies here too, though
 * more indirectly because 0xa0 still fits in ARM's 12-bit immediate
 * range (0xfff) so both styles would in theory work. The typedef
 * form is cleaner and matches how the real source almost certainly
 * declared this field.
 */

extern int Div(int num, int denom);

typedef struct {
    int current;
    int target;
    unsigned short step_incr;
    unsigned short frames_left;
    int _reserved;
} anim_linear_t;

typedef struct {
    char _pad_00[0xa0];
    anim_linear_t anim;         /* +0xa0 */
} anim_outer_a0_t;

void func_0203c5a4(anim_outer_a0_t *outer, int target, unsigned short frames) {
    int target_q24_8;
    int step;

    if (outer == 0) return;

    target_q24_8 = target << 8;
    outer->anim.target = target_q24_8;
    outer->anim.frames_left = frames;
    if (frames == 0) return;

    step = Div(target_q24_8 - outer->anim.current, frames);
    if (step == 0) step = 1;
    outer->anim.step_incr = step;
}
