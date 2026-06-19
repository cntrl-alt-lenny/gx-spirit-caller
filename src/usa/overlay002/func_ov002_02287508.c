/* func_ov002_02287508: returns 1 iff `data_ov002_022d008c.f_cf8 > 1` (unsigned).
 *
 *     ldr r0, .L_02287630
 *     ldr r0, [r0, #0xcf8]
 *     cmp r0, #0x1
 *     movhi r0, #0x1     ; higher (unsigned >)
 *     movls r0, #0x0
 *     bx  lr
 */

typedef struct {
    char         _pad[0xcf8];
    unsigned int f_cf8;
} state_022d016c_t;

extern state_022d016c_t data_ov002_022d008c;

int func_ov002_02287508(void) {
    return data_ov002_022d008c.f_cf8 > 1;
}
