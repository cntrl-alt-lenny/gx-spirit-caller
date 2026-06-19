/* func_ov002_02211718: call func_ov002_021e277c with bit 16 of *(u32*)p,
 * return 0.
 *
 *     push  {r3, lr}
 *     ldrh  r0, [r0, #2]    ; r0 = p->halfword_2
 *     lsl   r0, r0, #31     ; }
 *     lsr   r0, r0, #31     ; } = bitfield extract bit 0 of halfword_2
 *     bl    func_ov002_021e277c
 *     mov   r0, #0
 *     pop   {r3, pc}
 *
 * The lsl/lsr idiom comes from bitfield access — `s.bit_0` where bit_0
 * is `unsigned int bit_0 : 1`. mwcc 2.0/sp1p5 emits `(x & 1)` as a
 * single `and` instruction; only bitfield access produces the
 * 2-instruction lsl/lsr extract.
 */

typedef struct {
    unsigned short pad0;
    unsigned short bit0 : 1;
} T;

extern void func_ov002_021e277c(int x);

int func_ov002_02211718(T *p) {
    func_ov002_021e277c(p->bit0);
    return 0;
}
