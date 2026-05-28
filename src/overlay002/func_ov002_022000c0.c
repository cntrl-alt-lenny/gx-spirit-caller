/* func_ov002_022000c0: global-check + helper-tail.
 *
 *     push {r3, lr}
 *     ldr r2, [pool]; ldr r2, [r2, #0xcf8]
 *     cmp r2, #2; movne r0, #0; popne
 *     bl func_ov002_021ff320
 *     pop
 *
 * gotcha 7: 2-arg pass-through forces pool addr to r2.
 */
struct F022000c0Pool {
    char pad[0xcf8];
    int fcf8;
};

extern struct F022000c0Pool data_ov002_022d016c;
extern int func_ov002_021ff320(void *self, int arg);

int func_ov002_022000c0(void *self, int arg) {
    if (data_ov002_022d016c.fcf8 != 2) return 0;
    return func_ov002_021ff320(self, arg);
}
