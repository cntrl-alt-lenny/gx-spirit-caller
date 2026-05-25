/* func_02087d10: null-guarded nested setter — writes two fields on
 * `*w->inner` if non-null.
 *
 *     ldr   r3, [r0, #0]
 *     cmp   r3, #0
 *     movne r2, #1
 *     strneh r2, [r3, #0x34]
 *     ldrne r0, [r0, #0]          ; explicit re-deref (not CSE)
 *     strneh r1, [r0, #0x38]
 *     bx    lr
 *
 * Brief 215 shipped this as `.s` because mwcc 2.0 CSE'd the second
 * `*w->inner` load into the first one (collapsing to a single ldr)
 * AND emitted an early-return `bxeq lr` instead of the orig's
 * predicated execution.
 *
 * Brief 216 (this file) found the orig shape reaches under the
 * legacy `mwcc 1.2/sp2p3` tier from this source:
 *
 *   1. `void *` outer field (NOT a typed struct pointer) — forces
 *      char-arithmetic for field access at offsets 0x34 / 0x38,
 *      keeping the explicit offsets the orig has.
 *   2. Re-deref `w->inner` in the second store — mwcc 1.2 does
 *      NOT CSE this when the cached local isn't reused, matching
 *      orig's two-ldr pattern.
 *   3. mwcc 1.2 emits predicated execution (`movne`/`strneh`/
 *      `ldrne`) where mwcc 2.0 emits early-return.
 *
 * Routing: `.legacy.c` -> mwcc 1.2/sp2p3 (Style A epilogue tier).
 * See `docs/research/wall-2-leaf-no-pool-reg-alloc.md` for the
 * variant matrix that pinned this idiom.
 */

struct W {
    void *inner;
};

void func_02087d10(struct W *w, unsigned short v) {
    void *p = w->inner;
    if (p) {
        *(unsigned short *)((char *)p + 0x34) = 1;
        *(unsigned short *)((char *)w->inner + 0x38) = v;
    }
}
