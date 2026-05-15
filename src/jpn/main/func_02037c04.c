/* func_02037c04: sibling of func_0203c594 — same interpolation setup,
 * but selects the anim struct by integer index into a global table
 * (`data_0219b2f0`, 0x10 bytes per entry), and clamps a zero-frame
 * caller to 1 frame rather than returning early.
 *
 * Disassembly (build/eur/asm/_dsd_gap@main_8.s):
 *
 *     stmdb sp!, {r4, lr}
 *     ldr   r3, .L_02037c9c         ; r3 = &data_0219b2f0[0]
 *     cmp   r2, #0x0                ; compare arg frames
 *     add   r4, r3, r0, lsl #0x4    ; r4 = &data_0219b2f0[index]
 *     mov   r3, r1, lsl #0x8        ; r3 = target_q24_8
 *     moveq r2, #0x1                ; frames == 0 ? -> 1
 *     str   r3, [r4, #0x4]          ; entry->target
 *     strh  r2, [r4, #0xa]          ; entry->frames_left (clamped)
 *     cmp   r2, #0x0                ; dead re-check (r2 is now nonzero)
 *     ldmeqia sp!, {r4, pc}         ; — unreachable branch
 *     ldr   r0, [r4, #0x0]          ; entry->current
 *     mov   r1, r2
 *     sub   r0, r3, r0
 *     blx   Div
 *     cmp   r0, #0x0
 *     moveq r0, #0x1
 *     strh  r0, [r4, #0x8]          ; entry->step_incr
 *     ldmia sp!, {r4, pc}
 *     .L_02037c9c: .word data_0219b2f0
 *
 * 18 ARM instructions + 1 literal-pool word, 0x4c bytes.
 *
 * Differences from func_0203c594:
 *   (1) Takes an integer `index` instead of a pointer. `entry` is
 *       computed as `data_0219b2f0 + index * 0x10` — hence the need
 *       for the 0x10-byte struct stride in anim_linear_t.
 *   (2) The zero-frames case becomes `frames = 1` (clamp) instead of
 *       early-return. The compiler still emits an early-return check
 *       after the clamp, even though that branch is unreachable —
 *       mwcc at -O4 doesn't prove post-conditional-move nonzero-ness.
 *       The dead branch is real in the baserom, so the C source has
 *       to produce it.
 *
 * See func_0203c594.c for the shared template walkthrough.
 */

extern int Div(int num, int denom);

typedef struct {
    int current;
    int target;
    unsigned short step_incr;
    unsigned short frames_left;
    int _reserved;
} anim_linear_t;

extern anim_linear_t data_0219b2f0[];

void func_02037c04(int index, int target, unsigned short frames) {
    anim_linear_t *entry = &data_0219b2f0[index];
    int target_q24_8;
    int step;

    if (frames == 0) frames = 1;
    target_q24_8 = target << 8;
    entry->target = target_q24_8;
    entry->frames_left = frames;
    if (frames == 0) return;        /* unreachable; retained to match baserom */

    step = Div(target_q24_8 - entry->current, frames);
    if (step == 0) step = 1;
    entry->step_incr = step;
}
