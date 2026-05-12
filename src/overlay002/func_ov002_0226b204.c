/* func_ov002_0226b204: masked-halfword tail-call.
 *
 *     ldr   r2, .L_0226b224           ; data_022d016c
 *     mov   r1, r0, lsl #0x10
 *     ldr   r0, [r2, #0xcec]
 *     mov   r2, r1, lsr #0x10
 *     ldr   ip, .L_0226b228           ; func_ov002_0226acf8
 *     mov   r1, #0x14
 *     mov   r3, #0x0
 *     bx    ip
 */

typedef struct {
    char         _pad0[0xcec];
    int          f_cec;
} state_ov002_0226b204_t;

extern state_ov002_0226b204_t data_ov002_022d016c;
extern int func_ov002_0226acf8(int p, int x, unsigned int q, int z);

int func_ov002_0226b204(unsigned int arg) {
    return func_ov002_0226acf8(data_ov002_022d016c.f_cec, 0x14, arg & 0xffffu, 0);
}
