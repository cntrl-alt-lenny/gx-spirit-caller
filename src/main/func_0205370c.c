/* func_0205370c: load 2 fields of *r0, return them as long-long via r0/r1.
 *
 *     ldr r1, [r0, #0x8]        ; high half = p->f_8
 *     ldr r0, [r0, #0x4]        ; low half = p->f_4
 *     orr r1, r1, #0x0           ; no-op OR (volatile read?)
 *     orr r0, r0, #0x0           ; no-op OR
 *     bx  lr
 *
 * The `orr` with #0 instructions are mwcc's emit when the load result
 * passes through `volatile` — preserves the load via a redundant ALU
 * op. Returns a `long long` (low/high in r0/r1).
 */

typedef struct {
    char              _pad[0x4];
    volatile unsigned int f_4;
    volatile unsigned int f_8;
} state_v_t;

unsigned long long func_0205370c(state_v_t *p) {
    unsigned int hi = p->f_8;
    unsigned int lo = p->f_4;
    return ((unsigned long long)hi << 32) | lo;
}
