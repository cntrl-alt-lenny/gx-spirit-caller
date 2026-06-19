/* func_02001cec: zero a 52-byte state struct then set 4 fields.
 *
 *     push  {r4, r5, r6, lr}
 *     mov   r4, r0; mov r6, r1; mov r5, r2
 *     mov   r1, r4; mov r0, #0; mov r2, #52
 *     bl    Fill32                      ; Fill32(0, p, 52)
 *     lsl   r0, r6, #16
 *     lsr   r1, r0, #16                 ; r1 = (u16)arg1
 *     lsl   r0, r5, #16
 *     str   r1, [r4]                    ; p->a = (u16)arg1
 *     lsr   r0, r0, #16                 ; r0 = (u16)arg2
 *     str   r0, [r4, #0x4]              ; p->b = (u16)arg2
 *     ldr   r0, [r4, #0x24]
 *     bic   r0, r0, #0x1e0000
 *     orr   r0, r0, #0x1e0000           ; bits 17-20 = 0xf
 *     str   r0, [r4, #0x24]
 *     ldr   r0, [r4, #0x1c]
 *     bic   r0, r0, #0xff
 *     orr   r0, r0, #0xff               ; bits 0-7 = 0xff
 *     str   r0, [r4, #0x1c]
 *     pop   {r4, r5, r6, pc}
 *
 * The bic+orr pair on each 4-byte slot is C-22 (adjacent-bitfield)
 * routing — declare each bit window as a separate struct member.
 */

typedef struct {
    unsigned int a;                       /* +0x00 */
    unsigned int b;                       /* +0x04 */
    unsigned char _pad8[0x14];            /* +0x08 .. +0x1b */
    struct {                              /* +0x1c */
        unsigned int low8 : 8;
        unsigned int      : 24;
    };
    unsigned char _pad20[0x4];            /* +0x20 .. +0x23 */
    struct {                              /* +0x24 */
        unsigned int      : 17;
        unsigned int mid4 : 4;
        unsigned int      : 11;
    };
} state_t;

extern void Fill32(int value, void *dest, int size);

void func_02001cec(state_t *p, int a, int b) {
    Fill32(0, p, 52);
    p->a = (unsigned short)a;
    p->b = (unsigned short)b;
    p->mid4 = 0xf;
    p->low8 = 0xff;
}
