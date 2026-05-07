/* func_020466f4: copy `data->p->f_24` to `data->p->f_28`, then write
 * arg to `data->p->f_24`. The `data->p` pointer is reloaded between
 * the copy and the third write.
 *
 *     ldr r1, .L_02046710
 *     ldr r3, [r1, #0x0]
 *     ldr r2, [r3, #0x24]      ; tmp = (*data)->f_24
 *     str r2, [r3, #0x28]      ; (*data)->f_28 = tmp
 *     ldr r1, [r1, #0x0]       ; reload (*data)
 *     str r0, [r1, #0x24]      ; (*data)->f_24 = arg
 *     bx  lr
 *  .L_02046710: .word data_0219daec
 *
 * Caching `data_0219daec` in a local for the first two ops then
 * dereferencing the global directly for the third produces the
 * exact load pattern (one load + reload) — a `volatile` qualifier
 * would also force a reload but creates two unwanted loads.
 */

typedef struct {
    char _pad[0x24];
    int  f_24;
    int  f_28;
} state_0219daec_t;

extern state_0219daec_t *data_0219daec;

void func_020466f4(int arg) {
    state_0219daec_t *p = data_0219daec;
    p->f_28 = p->f_24;
    data_0219daec->f_24 = arg;
}
