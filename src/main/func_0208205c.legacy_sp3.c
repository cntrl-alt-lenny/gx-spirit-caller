/* func_0208205c: zero a 0x54-byte struct via Fill32, then store
 * arg1 to f_4 and three globals to f_c / f_14 / f_1c. sp3 signature.
 *
 *     stmdb sp!, {r4, r5, lr}
 *     sub   sp, sp, #0x4
 *     mov   r5, r0
 *     mov   r4, r1
 *     mov   r1, r5
 *     mov   r0, #0x0
 *     mov   r2, #0x54
 *     bl    Fill32
 *     ldr   r0, .L_020820ac          ; &data_021021b4
 *     ldr   r1, .L_020820b0          ; &data_021021b0
 *     ldr   r2, [r0, #0x0]
 *     ldr   r0, .L_020820b4          ; &data_021021ac
 *     str   r2, [r5, #0xc]
 *     ldr   r1, [r1, #0x0]
 *     str   r1, [r5, #0x14]
 *     ldr   r0, [r0, #0x0]
 *     str   r0, [r5, #0x1c]
 *     str   r4, [r5, #0x4]
 *     add   sp, sp, #0x4
 *     ldmia sp!, {r4, r5, pc}
 *  .L_020820ac: .word data_021021b4
 *  .L_020820b0: .word data_021021b0
 *  .L_020820b4: .word data_021021ac
 */

extern void Fill32(int v, void *dst, int size);
extern int data_021021b4;
extern int data_021021b0;
extern int data_021021ac;

typedef struct {
    char _pad0[0x4];
    int  f_4;
    char _pad8[0x4];
    int  f_c;
    char _pad10[0x4];
    int  f_14;
    char _pad18[0x4];
    int  f_1c;
    char _pad20[0x34];   /* total 0x54 */
} state_0208205c_t;

void func_0208205c(state_0208205c_t *p, int arg) {
    Fill32(0, p, 0x54);
    p->f_c = data_021021b4;
    p->f_14 = data_021021b0;
    p->f_1c = data_021021ac;
    p->f_4 = arg;
}
