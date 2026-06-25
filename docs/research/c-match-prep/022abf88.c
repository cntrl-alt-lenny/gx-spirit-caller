/* CAMPAIGN-PREP candidate for func_022abf88 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Switch defeats ==-chain fusion; cmp-chain accessor + tail-call
 *   risk:       Struct offsets f68/f70 guessed from asm; confirm against real struct. Sibling 022abfc0 validates the switch shape.
 *   confidence: high
 */
/* func_ov002_022abf88: cmp-chain table-lookup accessor. n = -self->f4;
 * if n in {0x4b,0x4c,0x4d} use table at +0x70, else use table at +0x68
 * and post-process via func_ov002_021afbd4. Use the SWITCH form so mwcc
 * does NOT fuse the ==-chain into a range check (sibling 022abfc0 proved
 * the switch keeps the 3 explicit cmpne's byte-identical).
 *
 *     push  {r3, lr}
 *     ldr   r2, [r0, #0x4]
 *     rsb   r2, r2, #0x0
 *     cmp   r2, #0x4b ; cmpne r2,#0x4c ; cmpne r2,#0x4d
 *     bne   .L_bcc
 *     ldr   r0, [r0, #0x70]
 *     ldr   r0, [r0, r1, lsl #0x2]      ; self->f70[idx]
 *     pop   {r3, pc}
 *  .L_bcc:
 *     ldr   r0, [r0, #0x68]
 *     ldr   r0, [r0, r1, lsl #0x2]      ; self->f68[idx]
 *     bl    func_ov002_021afbd4
 *     pop   {r3, pc}
 */

struct S022abf88 {
    char  _pad4[4];
    int   f4;
    char  _pad8[0x60];
    int  *f68;        /* +0x68 */
    char  _pad6c[4];
    int  *f70;        /* +0x70 */
};

extern int func_ov002_021afbd4(int v);

int func_ov002_022abf88(struct S022abf88 *self, int idx) {
    int n = -self->f4;
    switch (n) {
    case 0x4b:
    case 0x4c:
    case 0x4d:
        return self->f70[idx];
    }
    return func_ov002_021afbd4(self->f68[idx]);
}
