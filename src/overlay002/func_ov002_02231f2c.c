/* func_ov002_02231f2c: bit-0 extract + literal-31 arg + helper + return 0.
 *
 * Orig shape (32 bytes, 8 ARM insns, no internal pool):
 *
 *     push  {r3, lr}
 *     ldrh  r0, [r0, #2]                ; r0 = halfword at struct offset 2
 *     mov   r1, #31                      ; r1 = literal 31 (constant arg)
 *     lsl   r0, r0, #31                  ; bit 0 -> bit 31
 *     lsr   r0, r0, #31                  ; back to bit 0
 *     bl    func_ov002_021d8840          ; helper(bit0, 31)
 *     mov   r0, #0                       ; return 0
 *     pop   {r3, pc}
 *
 * Brief 222 worked example for C-39 (non-leaf C-37 bitfield
 * recipe). See `func_ov002_0223fd10.c` for the recipe rationale
 * and `docs/research/brief-222-c39-non-leaf-bitfield.md` for the
 * variant matrix.
 *
 * Note: the literal-31 second argument is the bit-position
 * constant — the caller is dispatching a generic
 * "set/clear/query bit N" operation across many functions
 * (this is one of several siblings that pass a different bit
 * position to the same helper).
 */

struct Func02231f2cSelf {
    unsigned short pad0;
    unsigned short bit0  : 1;
    unsigned short rest  : 15;
};

extern int func_ov002_021d8840(unsigned int bit, unsigned int bit_pos);

int func_ov002_02231f2c(struct Func02231f2cSelf *self) {
    func_ov002_021d8840(self->bit0, 31);
    return 0;
}
