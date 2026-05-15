/* func_0202cda4: 3-field non-zero AND chain. Returns 1 if all 3 fields
 * are non-zero, else 0. Predicated cmp chain + predicated final return
 * (mwcc default, NOT the C-1r hybrid).
 *
 *     ldr   r0, .L_0202ce20           ; data_0219ac68
 *     ldr   r1, [r0, #0x0]
 *     cmp   r1, #0x0
 *     ldrne r1, [r0, #0x24]
 *     cmpne r1, #0x0
 *     ldrne r0, [r0, #0x18]
 *     cmpne r0, #0x0
 *     movne r0, #0x1
 *     moveq r0, #0x0
 *     bx    lr
 */

typedef struct {
    int          f_0;
    char         _pad0[0x14];
    int          f_18;
    char         _pad1[0x8];
    int          f_24;
} state_0202cdf8_t;

extern state_0202cdf8_t data_0219ac68;

int func_0202cda4(void) {
    return data_0219ac68.f_0 != 0 && data_0219ac68.f_24 != 0 && data_0219ac68.f_18 != 0;
}
