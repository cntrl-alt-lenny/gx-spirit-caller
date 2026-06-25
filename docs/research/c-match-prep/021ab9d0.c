/* CAMPAIGN-PREP candidate for func_021ab9d0 (ov021, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield bit0 test -> MIN if-assign (moveq/movne) + (x<<16>>16) zero-extend; fetch via func_0207e638; call func_ov020_021aa8f0
 *   risk:       global offsets 0xa98/0x924, the <<31>>31 bit0 extract, and the 0xd8000 const order assumed; original is .s-class reg-alloc, byte-match uncertain
 *   confidence: low
 */
/* func_ov020_021ab9d0: read bit0 of g0->fa98, fetch a handle via
 * func_0207e638(g1->f924, bit ? 1 : 0 zero-extended u16), and dispatch to
 * func_ov020_021aa8f0(a0,a1,handle, 0, 0, -1, 0xd8000, 0).
 *
 *   mov r0,r0,lsl#0x1f ; mov r0,r0,lsr#0x1f ; cmp r0,#1
 *   moveq r1,#1 ; movne r1,#0 ; mov r1,r1<<16>>16
 */

typedef unsigned short u16;

extern char data_ov020_021ae060[];
extern char data_ov020_021ae0a8[];
extern int  func_0207e638(int a0, int a1);
extern void func_ov020_021aa8f0(int a0, int a1, int handle, int a3,
                                int s0, int s1, int s2, int s3);

void func_ov020_021ab9d0(int a0, int a1) {
    int bit;
    int sel;
    int handle;

    bit = (*(unsigned int *)(data_ov020_021ae060 + 0xa98) << 0x1f) >> 0x1f;
    if (bit == 1) {
        sel = 1;
    } else {
        sel = 0;
    }
    handle = func_0207e638(*(int *)(data_ov020_021ae0a8 + 0x924), (u16)sel);
    func_ov020_021aa8f0(a0, a1, handle, 0, 0, -1, 0xd8000, 0);
}
