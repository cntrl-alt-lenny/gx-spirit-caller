/* func_02007fd8: helper1 + bitfield merge + 2 void helpers.
 *
 *     push {r3, lr}
 *     bl func_02007e70
 *     ldr r1, [pool]; and r0, r0, #7
 *     ldr r2, [r1, #0x14]; bic r2, r2, #7
 *     orr r0, r2, r0; str r0, [r1, #0x14]
 *     bl func_02008008
 *     bl func_02007f3c
 *     pop
 */
struct F02007ff4 {
    char pad[0x14];
    int f14;
};

extern struct F02007ff4 data_02104e5c;
extern int func_02007e70(void);
extern void func_02008008(void);
extern void func_02007f3c(void);

void func_02007fd8(void) {
    data_02104e5c.f14 = (data_02104e5c.f14 & ~7) | (func_02007e70() & 7);
    func_02008008();
    func_02007f3c();
}
