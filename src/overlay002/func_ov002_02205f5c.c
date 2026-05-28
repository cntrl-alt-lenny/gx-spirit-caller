/* func_ov002_02205f5c: global-check + helper-tail.
 *
 *     push {r3, lr}
 *     ldr r2, [pool]; ldr r2, [r2, #0xcf8]
 *     cmp r2, #3; movne r0, #0; popne
 *     bl func_ov002_021ff3bc
 *     pop
 *
 * gotcha 7: 2-arg pass-through forces pool addr to r2 (not r1).
 */
struct F02205f5cPool {
    char pad[0xcf8];
    int fcf8;
};

extern struct F02205f5cPool data_ov002_022d016c;
extern int func_ov002_021ff3bc(void *self, int arg);

int func_ov002_02205f5c(void *self, int arg) {
    if (data_ov002_022d016c.fcf8 != 3) return 0;
    return func_ov002_021ff3bc(self, arg);
}
