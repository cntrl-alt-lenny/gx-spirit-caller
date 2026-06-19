/* func_ov002_02243658: short-circuit-or-call on halfword field
 * (W-F / C-14 unblock). Predicated `moveq + ldmeqia` early-
 * return-1 when p->h_c == 0. Same C-14 2-arg pass-through trick
 * forces the cmp scratch onto r2.
 *
 *     stmdb sp!, {r3, lr}
 *     ldrh  r2, [r0, #0xc]
 *     cmp   r2, #0x0
 *     moveq r0, #0x1
 *     ldmeqia sp!, {r3, pc}
 *     bl    func_ov002_0223f59c
 *     ldmia sp!, {r3, pc}
 */

extern int func_ov002_0223f59c(void *p, int x);

typedef struct {
    char           _pad[0xc];
    unsigned short h_c;
} state_ov002_02243740_t;

int func_ov002_02243658(state_ov002_02243740_t *p, int x) {
    if (p->h_c == 0) return 1;
    return func_ov002_0223f59c(p, x);
}
