/* func_ov006_021b2668: helper1 + cond helper2 on data.f8 + return 1.
 *
 *     push {r3, lr}; bl func_0202111c
 *     ldr r0, [pool]; ldr r0, [r0, #8]
 *     cmp r0, #0; beq L_skip
 *     bl func_0200ddc4
 *     L_skip: mov r0, #1; pop
 *
 * Sibling family: 9 picks across ov006 + ov021 with identical shape.
 */
struct F021b2668Pool { char pad[8]; int f8; };
extern struct F021b2668Pool data_ov006_021cf140;
extern void func_0202111c(void);
extern void func_0200ddc4(void);

int func_ov006_021b2668(void) {
    func_0202111c();
    if (data_ov006_021cf140.f8 != 0) {
        func_0200ddc4();
    }
    return 1;
}
