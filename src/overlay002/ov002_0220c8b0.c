/* func_ov002_0220c8b0: returns 1 iff `f_1c + f_884` of
 * `data_ov002_022cf16c` is non-zero.
 *
 *     ldr r0, .L_0220c8cc
 *     ldr r1, [r0, #0x1c]
 *     ldr r0, [r0, #0x884]
 *     adds r0, r1, r0          ; flags-setting add
 *     movne r0, #0x1
 *     moveq r0, #0x0
 *     bx  lr
 *
 * mwcc folds the "add then test for non-zero" into `adds` (flag-setting
 * variant) and a predicated mov pair.
 */

typedef struct {
    char _pad_1c[0x1c];
    int  f_1c;
    char _pad_884[0x884 - 0x1c - 4];
    int  f_884;
} state_022cf16c_t;

extern state_022cf16c_t data_ov002_022cf16c;

int func_ov002_0220c8b0(void) {
    return (data_ov002_022cf16c.f_1c + data_ov002_022cf16c.f_884) != 0;
}
