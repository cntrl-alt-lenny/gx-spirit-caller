/* func_020327c0: null-check + helper + null-write, large struct offset (0xea8).
 *
 *     push  {r4, lr}
 *     mov   r4, r0
 *     ldr   r1, [r4, #0xea8]
 *     cmp   r1, #0
 *     popeq {r4, pc}
 *     bl    helper
 *     mov   r0, #0
 *     str   r0, [r4, #0xea8]
 *     pop   {r4, pc}
 *
 * Brief 241 C-42 sub-shape (struct-large-offset). The 0xea8 (3752 B)
 * fits in ARM's 12-bit ldr/str immediate (max 4095) — a single
 * `ldr r1, [r4, #0xea8]` matches, no split add+ldr needed.
 *
 * Recipe gotcha: with the natural form `if (self->p == 0) return;`,
 * mwcc allocates the field load to **r0** and reuses it for the
 * cmp. Orig has it in r1 — so the helper signature `helper(self)`
 * (taking self as arg) keeps r0 live across the cmp, forcing the
 * field load to r1.
 */
struct Func020327c0Self {
    char pad[3752];
    void *p;
};

extern void func_02032e6c(struct Func020327c0Self *self);

void func_020327c0(struct Func020327c0Self *self) {
    if (self->p == 0) return;
    func_02032e6c(self);
    self->p = 0;
}
