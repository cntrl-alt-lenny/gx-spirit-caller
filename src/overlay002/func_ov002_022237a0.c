/* func_ov002_022237a0: C-39a variant — sign-check via dead-arg
 * helper-reuse with a u32 bitfield field9 and `rsb` bit-invert.
 *
 * Orig shape (80 B, 20 ARM insns):
 *
 *     push  {r4, lr}
 *     mov   r4, r0
 *     ldrh  r1, [r4, #2]              ; f2 halfword
 *     ldr   r0, [r4, #0x14]           ; f14 dword
 *     lsl   r1, r1, #31
 *     lsr   r2, r1, #31               ; r2 = bit0
 *     lsl   r1, r0, #23
 *     rsb   r0, r2, #1                ; r0 = 1 - bit0 = !bit0
 *     lsr   r1, r1, #23               ; r1 = bits 0-8 of f14
 *     bl    func_ov002_021b9aa8       ; helper1(!bit0, field9)
 *     movs  r1, r0                    ; r1 = n, set flags
 *     bmi   .end                       ; branch if N
 *     ldrh  r0, [r4, #2]
 *     mov   r2, #1                     ; literal 1 (3rd arg)
 *     lsl   r0, r0, #31
 *     lsr   r0, r0, #31                ; r0 = bit0
 *     rsb   r0, r0, #1                 ; r0 = !bit0
 *     bl    func_ov002_021d7970       ; helper2(!bit0, n, 1)
 *   .end:
 *     mov   r0, #0
 *     pop   {r4, pc}
 *
 * Brief 226 C-39a — same dead-arg trick as 021f4cd4 but with a u32
 * bitfield (field9 packed into low 9 bits of a 32-bit word at offset
 * 20) and `1 - bit0` instead of `!bit0`. The `!` operator lowers to a
 * `lsrs; moveq; movne` conditional-move pair; `1 - bit0` lowers to a
 * single `rsb`, matching the orig.
 *
 * Returns 0 (not 1 like other A picks).
 *
 * See `docs/research/brief-226-c39-subclass-sign-check-helper-reuse.md`.
 */

struct Func022237a0F2 {
    unsigned short bit0  : 1;
    unsigned short rest  : 15;
};

struct Func022237a0F14 {
    unsigned int field9 : 9;
    unsigned int rest   : 23;
};

struct Func022237a0Self {
    unsigned short pad0;
    struct Func022237a0F2 f2;
    unsigned char pad4[16];
    struct Func022237a0F14 f14;
};

extern int func_ov002_021b9aa8(unsigned int not_bit, unsigned int field9);
extern void func_ov002_021d7970(unsigned int not_bit, int n, unsigned int one);

int func_ov002_022237a0(struct Func022237a0Self *self) {
    int n = func_ov002_021b9aa8(1 - self->f2.bit0, self->f14.field9);
    if (n >= 0) {
        func_ov002_021d7970(1 - self->f2.bit0, n, 1);
    }
    return 0;
}
