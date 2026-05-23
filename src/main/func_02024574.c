/* E-12 stub for brief 198 permuter wave — find-first-free-slot.
 *
 * Brief 200 codegen sweep (5-pick plateau analysis) identifies
 * this as P-11 (mwcc 2.0/sp1p5 reg-allocator divergence). See
 * `docs/research/first-wave-wall-reg-alloc-plateau.md` for the
 * full diagnosis. Permuter ran 3 variants to score 480 plateau;
 * `volatile`-qualified coercion attempt (brief 200 Part 3) shifted
 * the shape but did not byte-match. Wall is **permanent under
 * current mwcc-agnostic source iteration tools**.
 *
 *     push  {r4, r5, r6, lr}
 *     ldr   r1, [pc, #96]            ; r1 = &data_0219a8ec[0] addr
 *     mov   r4, r0                    ; r4 = arg x
 *     ldr   r5, [r1, #4]              ; r5 = count
 *     ldr   r1, [pc, #88]             ; r1 = &data_0219a8ec[0] AGAIN
 *                                     ;     (SAME pool value — 2 pool words)
 *     cmp   r5, #0
 *     mov   r3, #0
 *     ble   .L_skip
 *     ldr   r2, [r1]                  ; r2 = data_0219a8ec.array
 *   .Lloop:
 *     ldr   r0, [r2]                   ; r0 = slot[0] (the .first field)
 *     cmp   r0, #0
 *     beq   .L_skip
 *     add   r3, r3, #1
 *     cmp   r3, r5
 *     add   r2, r2, #364               ; advance by stride
 *     blt   .Lloop
 *   .L_skip:
 *     cmp   r3, r5
 *     mov   r0, #0
 *     popge {r4, r5, r6, pc}            ; predicated return 0
 *     mov   r2, #364
 *     mul   r5, r3, r2                  ; r5 = i * stride
 *     ldr   r6, [r1]                    ; r6 = base (3rd r1-deref!)
 *     add   r1, r6, r5                  ; r1 = base + offset = Fill32 dest
 *     bl    Fill32
 *     str   r4, [r6, r5]                ; *(base+offset) = x
 *     add   r0, r6, r5                  ; return base+offset
 *     pop   {r4, r5, r6, pc}
 *
 * Pool: 2 .word data_0219a8ec — same value, distinct pool words.
 *
 * E-13 / E-14 are byte-isomorphic clones (different stride: 0xe0,
 * 0x19c; different pool ptr: 0x0219a924, 0x0219a92c).
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
