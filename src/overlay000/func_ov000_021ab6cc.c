/* func_ov000_021ab6cc: byte-low-zero check on a struct field.
 *
 * Orig shape (28 bytes, 7 ARM insns, no internal pool):
 *
 *     ldr   r0, .L_pool
 *     ldr   r0, [r0, #0x58]
 *     mov   r0, r0, lsl #0x18         ; lsl 24 (no S)
 *     movs  r0, r0, lsr #0x18         ; lsr 24 (with S = zero-flag)
 *     moveq r0, #0x1                  ; 1 if low byte == 0
 *     movne r0, #0x0
 *     bx    lr
 *
 * Brief 214's matrix found this shape ("Shape B") reachable in
 * principle but didn't ship a worked example — and brief 217's
 * empirical re-test on the actual picks (`func_ov000_021ab6cc`,
 * `_021af5c0`) failed: a direct `(unsigned)x << 24 >> 24` cast
 * collapses to `ands r0, r0, #0xff` (1 instruction) under both
 * 1.2 and 2.0 — the mwcc peephole fires regardless of tier.
 *
 * Brief 218 (this file) found that the **bitfield** recipe reaches
 * orig under the default mwcc 2.0/sp1p5 tier. mwcc emits the
 * explicit `lsl #24 / lsrs #24` extraction sequence for an
 * `unsigned int low8 : 8` bitfield read because the bitfield
 * read goes through a different code path than the integer-
 * AND peephole.
 *
 * Variant matrix on 2.0/sp1p5:
 *   - `(unsigned)x << 24 >> 24 == 0`  → `ands #0xff` (5 insn, 20 B)
 *   - `(uint8_t)x == 0`                → `ldrb` (5 insn, 20 B)
 *   - explicit shifts via locals       → `ands #0xff`
 *   - `volatile` shift result           → stack frame, 13+ insns
 *   - **bitfield low8 == 0**            → `lsl #24; lsrs #24` MATCH
 *
 * See `docs/research/bit-test-0-or-1-idiom.md` § Shape B (bitfield
 * recipe) for the full variant matrix and the C-37 wall taxonomy
 * link.
 */

struct LowByteStruct {
    unsigned int low8 : 8;
    unsigned int upper : 24;
};

extern struct LowByteStruct data_ov000_021c7530[];

int func_ov000_021ab6cc(void) {
    return data_ov000_021c7530[0x58 / 4].low8 == 0;
}
