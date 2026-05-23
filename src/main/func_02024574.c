/* E-12 stub for brief 198 permuter wave — find-first-free-slot.
 *
 *     push  {r4, r5, r6, lr}
 *     ldr   r1, =data_0219a8ec
 *     mov   r4, r0
 *     ldr   r5, [r1, #4]              ; count
 *     ldr   r1, =data_0219a8ec        ; (same ptr, second load)
 *     cmp   r5, #0
 *     mov   r3, #0
 *     ble   .L_skip
 *     ldr   r2, [r1]                  ; r2 = base
 *   .Lloop:
 *     ldr   r0, [r2]
 *     cmp   r0, #0
 *     beq   .L_found
 *     add   r3, #1; cmp r3, r5; add r2, r2, #364; blt .Lloop
 *   .L_skip:
 *     cmp   r3, r5
 *     mov   r0, #0
 *     popge {r4, r5, r6, pc}
 *     mov   r2, #364
 *     mul   r5, r3, r2
 *     ldr   r6, [r1]
 *     add   r1, r6, r5
 *     bl    Fill32
 *     str   r4, [r6, r5]
 *     add   r0, r6, r5
 *     pop   {r4, r5, r6, pc}
 *
 * Stride 364 — sizeof(slot_t).
 */

typedef struct {
    int first;
    unsigned char _pad[360];
} slot_t;

typedef struct {
    slot_t *array;
    int count;
} ctx_t;

extern ctx_t data_0219a8ec;
extern void Fill32(int value, void *dest, int size);

slot_t *func_02024574(int x) {
    int count = data_0219a8ec.count;
    int i;
    for (i = 0; i < count; i++) {
        if (data_0219a8ec.array[i].first == 0) break;
    }
    if (i >= count) {
        return (void *)0;
    }
    {
        slot_t *result = &data_0219a8ec.array[i];
        Fill32(0, result, sizeof(slot_t));
        result->first = x;
        return result;
    }
}
