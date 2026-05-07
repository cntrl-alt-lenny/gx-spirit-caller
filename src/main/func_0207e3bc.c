/* func_0207e3bc: bound-checked indexed load — if `idx < p->h_0` then
 * return `*(int *)(p->p_4 + idx*16)`; else return 0.
 *
 *     ldrh  r2, [r0, #0x0]
 *     cmp   r2, r1
 *     ldrhi r0, [r0, #0x4]              ; only if h_0 > idx
 *     addhi r0, r0, r1, lsl #0x4         ; idx*16
 *     movls r0, #0x0
 *     bx    lr
 *
 * `ldrhi` + `addhi` only fire when bound check passes. `movls #0`
 * fires on the failure branch.
 */

typedef struct {
    unsigned short  h_0;
    char           _pad[0x2];
    char           *p_4;
} state_arr_t;

int func_0207e3bc(state_arr_t *p, unsigned int idx) {
    if (p->h_0 > idx) {
        return (int)(p->p_4 + idx * 16);
    }
    return 0;
}
