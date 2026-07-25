/* func_02011a14: indexed halfword table lookup + add-offset + tail-call.
 * Row stride is 12 bytes (not power-of-2) so mwcc emits `mov #0xc; mul`.
 * The +0x8ca constant doesn't fit in one ARM imm so it's split into
 * `+0xca` and `+0x800`.
 *
 *     mov   r1, #0xc
 *     mul   r1, r0, r1
 *     ldr   r0, .L_02011a34           ; data_020b52d0
 *     ldr   ip, .L_02011a38           ; func_0202c0c0
 *     ldrh  r0, [r0, r1]
 *     add   r0, r0, #0xca
 *     add   r0, r0, #0x800
 *     bx    ip
 */

typedef struct {
    int field0;
    unsigned short field1;
    unsigned short field2;
    unsigned short field3;
    unsigned short field4;
} Record020b52d0;

extern const Record020b52d0 data_020b52d0[];
extern int func_0202c0c0(int x);

int func_02011a14(int i) {
    return func_0202c0c0(data_020b52d0[i].field2 + 0x8ca);
}
