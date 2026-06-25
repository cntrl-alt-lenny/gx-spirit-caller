/* CAMPAIGN-PREP candidate for func_02273ad4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield extract (:7 at bit8) + bit1 guard + dispatch switch
 *   risk:       the (x>>8)&0x7f field must compile to lsl#9;lsr#17; a plain mask gives and — confirm bitfield placement
 *   confidence: med
 */
/* func_ov002_02273ad4: if bit1 of +0x16 set return 1; else extract a 7-bit id
 * from +0 (lsl#9;lsr#17), classify via func_0202b878, dispatch.
 *
 *   ldrh r1,[r0,#0x16]; lsl#30; lsrs#31     ; bit1 of u16@0x16
 *   movne r0,#1; popne                       ; -> return 1
 *   ldr  r0,[r0]; lsl#9; lsr#17              ; (x>>8)&0x7f  (7-bit field at bit8)
 *   bl   func_0202b878
 *   cmp #9; bne .L; bl func_ov002_02272a24; pop
 *   bl func_ov002_02271ab4; pop
 */
typedef unsigned int u32;
typedef unsigned short u16;
struct S0 { u32 id8 : 8; u32 id7 : 7; u32 rest : 17; };           /* @0x00 */
struct S16 { u16 b0 : 1; u16 b1 : 1; u16 rest : 14; };            /* @0x16 */
extern char data_ov002_022cd300[];
extern int func_0202b878(int v);
extern int func_ov002_02272a24(void);
extern int func_ov002_02271ab4(void);

int func_ov002_02273ad4(void) {
    if (((struct S16 *)(data_ov002_022cd300 + 0x16))->b1)
        return 1;
    if (func_0202b878(((struct S0 *)data_ov002_022cd300)->id7) == 9)
        return func_ov002_02272a24();
    return func_ov002_02271ab4();
}
