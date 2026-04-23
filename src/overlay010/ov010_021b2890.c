/* func_ov010_021b2890: 4-halfword setter at offsets 0x1c..0x22.
 *
 *     strh r1, [r0, #0x1c]
 *     strh r2, [r0, #0x1e]
 *     ldrh r1, [sp, #0x0]          ; 5th arg from stack
 *     strh r3, [r0, #0x20]
 *     strh r1, [r0, #0x22]
 *     bx   lr
 *
 * Takes a struct pointer plus four halfword values (four regs would
 * fit but ARM only has r0..r3 for args — the 4th value comes via
 * stack). Note mwcc interleaves the stack-arg load between the 2nd
 * and 3rd stores to hide the `ldrh` latency.
 */

void func_ov010_021b2890(void *obj, unsigned short a, unsigned short b,
                          unsigned short c, unsigned short d) {
    *(unsigned short *)((char *)obj + 0x1c) = a;
    *(unsigned short *)((char *)obj + 0x1e) = b;
    *(unsigned short *)((char *)obj + 0x20) = c;
    *(unsigned short *)((char *)obj + 0x22) = d;
}
