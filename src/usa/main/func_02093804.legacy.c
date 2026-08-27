/* func_02093804: extract bits[14:8] of b; if == 0x10, set flag and return,
 * else dispatch to func_02093b08. Style A (2-step epilogue).
 *
 *     stmfd sp!, {lr}
 *     sub   sp, sp, #0x4
 *     and   r0, r1, #0x7f00
 *     mov   r0, r0, lsl #0x8
 *     mov   r0, r0, lsr #0x10
 *     cmp   r0, #0x10
 *     ldreq r0, =data_021a6614
 *     moveq r1, #0x1
 *     streqh r1, [r0]
 *     addeq sp, sp, #0x4
 *     ldmeqfd sp!, {lr}
 *     bxeq  lr
 *     bl    func_02093b08
 *     add   sp, sp, #0x4
 *     ldmfd sp!, {lr}
 *     bx    lr
 */

extern short data_021a6614;
extern void func_02093b08(void);

void func_02093804(int a, unsigned int b) {
    if ((((b & 0x7f00) << 8) >> 16) == 0x10) {
        data_021a6614 = 1;
        return;
    }
    func_02093b08();
}
