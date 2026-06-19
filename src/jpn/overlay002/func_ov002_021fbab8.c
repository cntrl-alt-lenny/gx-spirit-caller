/* func_ov002_021fbab8: short-circuit-or-call (W-F / C-14
 * unblock). If `p->f_14` is non-zero, return 1; otherwise
 * tail-call helper. The cmp scratch lands on r2 because the
 * 2-arg pass-through keeps `x` live in r1.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r2, [r0, #0x14]               ; ← r2, not r1
 *     cmp   r2, #0x0
 *     movne r0, #0x1
 *     ldmneia sp!, {r3, pc}
 *     bl    func_ov002_021f4994
 *     ldmia sp!, {r3, pc}
 *
 * C-14 trick: 2-arg signature with `x` flowing through r1 to
 * the helper at the call site. mwcc must keep r1 live for the
 * bl, so it picks r2 as the cmp scratch.
 */

extern int func_ov002_021f4994(void *p, int x);

typedef struct {
    char _pad[0x14];
    int  f_14;
} state_ov002_021fbba8_t;

int func_ov002_021fbab8(state_ov002_021fbba8_t *p, int x) {
    if (p->f_14 != 0) return 1;
    return func_ov002_021f4994(p, x);
}
