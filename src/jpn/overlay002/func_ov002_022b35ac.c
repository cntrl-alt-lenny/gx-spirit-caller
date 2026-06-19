/* func_ov002_022b35ac: indexed-ldr + cond helper + indexed-str.
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r0
 *     mov   r4, r1
 *     add   r3, r5, r4, lsl #2
 *     ldr   r3, [r3, #52]
 *     cmp   r2, r3
 *     beq   .skip
 *     bl    helper(self, idx, arg2)
 *   .skip:
 *     add   r0, r5, r4, lsl #2
 *     mov   r1, #60
 *     str   r1, [r0, #60]
 *     pop
 *
 * Brief 244 pattern 10. Recipe: gotcha 7 — 3-arg helper
 * (self, idx, arg2) keeps r0-r2 "live" for the call, forcing the
 * indexed-temp to r3 instead of reusing r0.
 */
struct FuncOv002022b36f0Self {
    char pad[52];
    int tbl_a[64];
};

extern void func_ov002_022b3184(struct FuncOv002022b36f0Self *self, int idx, int arg2);

void func_ov002_022b35ac(struct FuncOv002022b36f0Self *self, int idx, int arg2) {
    if (arg2 != self->tbl_a[idx]) {
        func_ov002_022b3184(self, idx, arg2);
    }
    *(int *)((char *)self + idx * 4 + 60) = 60;
}
