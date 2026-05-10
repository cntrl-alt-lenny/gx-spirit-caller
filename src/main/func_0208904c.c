/* func_0208904c: copy two adjacent fields from `*data_021a5800`
 * (deref-then-pair-read) to caller's out struct. Brief 022's
 * historic miss; brief 050's cluster rescan flagged this as the
 * single C-2 unblock from the func_020071a4 cluster.
 *
 *     ldr r1, .L_02089068
 *     ldr r1, [r1, #0x0]                  ; p = *data
 *     ldr r2, [r1, #0x7c]                  ; r2 = p->f_7c
 *     ldr r1, [r1, #0x80]                  ; r1 = p->f_80
 *     str r2, [r0, #0x0]
 *     str r1, [r0, #0x4]
 *     bx  lr
 *  .L_02089068: .word data_021a5800
 *
 * **C-2 trick**: cache `p` to a local before the two reads, so
 * mwcc emits a single `&data_021a5800` materialisation followed
 * by both ops via the same pointer register.
 */

extern char *data_021a5800;

typedef struct {
    int a;
    int b;
} pair_0208904c_t;

void func_0208904c(pair_0208904c_t *out) {
    /* Copy as a struct so mwcc emits ldr-ldr-str-str (load both
     * fields before storing) — matches target's order. */
    *out = *(pair_0208904c_t *)((char *)data_021a5800 + 0x7c);
}
