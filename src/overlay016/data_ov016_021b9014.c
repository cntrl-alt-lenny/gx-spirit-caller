/* data_ov016_021b9014 (12 bytes, 4-aligned): one "touch cell" record --
 * Rect{x,y,w,h} hit-box at offsets 0/2/4/5 (u16,u16,u8,u8 -- identical layout
 * to docs/research/types/Rect.md, confirmed directly by both readers' own
 * hit-test callees func_ov016_021b287c.s/func_ov016_021b28f4.s:
 *   `ldrh r1,[r4]; ldrh r1,[r4,#0x2]; ldrb r0,[r4,#0x4]; ldrb r0,[r4,#0x5]`)
 * + render cell dims cellW/cellH at offsets 6/8, confirmed by the MATCHED
 * src/overlay016/func_ov016_021b3498.c: `void
 * func_ov016_021b3498(void *arg0,int arg1,int arg2,unsigned short *arg3)`
 * does `coords[0]=arg3[0]<<12; coords[1]=arg3[1]<<12; ...
 * func_0201e964(2,obj.unk44,coords,0,0,0,arg3[4],arg3[3],0,0,0,0);` which is
 * ov016_core.h's documented `func_0201e964(layer,obj.unk44,&coords,0,0,0,
 * cellH,cellW,0,0,0,0)` recipe -> cellH=arg3[4]=offset8, cellW=arg3[3]=offset6.
 * Trailing offset 10 (attr) is unread by either confirmed reader here; same
 * tail slot as docs/research/types/HitRect.md's documented `attr` field.
 * Consumers (2, per census):
 *  - src/overlay016/func_ov016_021b2d4c.s:88 (`ldr r7, .L_021b2f60`) --
 *    hit-test via func_ov016_021b287c, then draw via func_ov016_021b3498.
 *    (config/eur/arm9/overlays/ov016/relocs.txt:123,
 *      from:0x021b2f60 kind:load to:0x021b9014 module:overlay(16)).
 *  - src/overlay016/func_ov016_021b3174.s:85 (`ldr r0, _LIT3`) -- hit-test
 *    via func_ov016_021b28f4 only (the "3rd MMIO-shuffle" per ov016_core.h,
 *    itself still un-matched/parked).
 *    (config/eur/arm9/overlays/ov016/relocs.txt:164,
 *      from:0x021b32e4 kind:load to:0x021b9014 module:overlay(16)).
 * Section: .data start:0x021b8f80 end:0x021b9740 -- inside, so NOT const.
 */
typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char  w;
    unsigned char  h;
    unsigned short cellW;
    unsigned short cellH;
    unsigned short attr;
} Ov016TouchCell;

Ov016TouchCell data_ov016_021b9014 = { 18, 107, 220, 21, 2, 2, 0 };
