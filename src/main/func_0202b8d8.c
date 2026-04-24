/* func_0202b8d8: return entry.w1 bit-field [3:0] (4 bits, LSB).
 *
 * One of a 7-function cluster of bit-field getters around 0x0202b6xx
 * - 0x0202b8xx, each calling func_0202b31c to get the card entry
 * and extracting a different bit-field from entry.w1:
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_0202b31c            ; entry = card_lookup(id)
 *     ldr   r0, [r0, #0x4]            ; w1 = entry->w1
 *     mov   r0, r0, lsl #0x1c         ; lsl 28
 *     mov   r0, r0, lsr #0x1c         ; lsr 28 → bits [3:0]
 *     ldmia sp!, {r3, pc}
 *
 * 6 insns = 0x18 bytes.
 *
 * Bit-field layout of entry.w1 (LSB-first, derived from the cluster):
 *
 *   [ 3: 0] 4 bits — this function (b8d8)
 *   [ 7: 4] 4 bits — func_0202b890
 *   [11: 8] 4 bits — func_0202b8a8
 *   [14:12] 3 bits — func_0202b8c0
 *   [19:15] 5 bits — func_0202b878
 *   [22:20] 3 bits — func_0202b6b4
 *   [27:23] 5 bits — func_0202b6cc
 *   [31:28] 4 bits — (unused)
 */

typedef struct card_entry {
    unsigned int w0;
    unsigned int attr_a : 4;
    unsigned int attr_b : 4;
    unsigned int attr_c : 4;
    unsigned int attr_d : 3;
    unsigned int attr_e : 5;
    unsigned int attr_f : 3;
    unsigned int attr_g : 5;
    unsigned int _pad   : 4;
} card_entry_t;

extern card_entry_t *func_0202b31c(int id);

unsigned int func_0202b8d8(int id) {
    return func_0202b31c(id)->attr_a;
}
