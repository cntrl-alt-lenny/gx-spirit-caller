/* func_ov002_02204184: returns 1 iff `data_ov002_022d008c.f_cf8 <= 3` (unsigned).
 *
 *     ldr r0, .L_0220428c
 *     ldr r0, [r0, #0xcf8]
 *     cmp r0, #0x3
 *     movls r0, #0x1     ; lower-or-same (unsigned <=)
 *     movhi r0, #0x0
 *     bx  lr
 */

typedef struct {
    char         _pad[0xcf8];
    unsigned int f_cf8;
} state_022d016c_t;

extern state_022d016c_t data_ov002_022d008c;

int func_ov002_02204184(void) {
    return data_ov002_022d008c.f_cf8 <= 3;
}
