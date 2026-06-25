/* CAMPAIGN-PREP candidate for func_0220b31c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     arg/kind guards; f14 packed bitfields; mla entry; movne/moveq -1 select; twin calls
 *   risk:       permuter-class: the moveq/mvnne pair building c2 (=field or -1) and the re-extraction of the same w fields before each call is a reg-rotation; mwcc may CSE the shifts differently. Also struct-guessed on w field positions.
 *   confidence: low
 */
/* func_ov002_0220b31c (ov002, class C/D, MED) -- batch p_0086.
 * arg1!=0 -> return 0; kind in {0x1f,0x20,0x21}; w=self->f14 (32-bit packed).
 * b = (w>>20)&1 ; c = (w>>18)&0xf ; entry=*(int*)(cf16c+0x30 + b*0x868 + c*0x14) low13 !=0 guard;
 * sel = (w>>23)&0x1ff -> id16=*(u16*)(d0250 + sel*2) low13 -> k=021... wait: 0202b878(id16 low13);
 * call1: c1 = b? ((w>>18)&0xf) : -1 ; 021bbbc0(0, k, c1); if !=0 return 1;
 * call2: if ((w>>20)&1)==1 c2=((w>>18)&0xf) else -1 ; 021bbbc0(1, k, c2); return (!=0).
 */
typedef unsigned short u16;
typedef unsigned char  u8;

struct Self0220b31c {
    u16 f0;
    struct { u16 p : 1; u16 _m : 5; u16 kind : 6; u16 _t : 4; } f2; /* +0x2 */
    u8  _pad4[0x10];
    unsigned int w;                                                /* +0x14 packed */
};

extern u8 data_ov002_022cf16c[];  /* field base, stride 0x868 */
extern u8 data_ov002_022d0250[];  /* u16 lut */
extern int func_0202b878(int id);
extern int func_ov002_021bbbc0(int which, int k, int c);

int func_ov002_0220b31c(struct Self0220b31c *self, int arg1) {
    int kind;
    unsigned int w;
    int b, c;
    int entry;
    int sel, id16, k;
    int c2;
    if (arg1 != 0) return 0;
    kind = self->f2.kind;
    if (kind != 0x1f && kind != 0x20 && kind != 0x21) return 0;
    w = self->w;
    b = (w << 22) >> 31;        /* bit9 */
    c = (w << 18) >> 28;        /* bits10..13 */
    entry = *(int *)(data_ov002_022cf16c + 0x30 + (b & 1) * 0x868 + c * 0x14);
    entry = (entry << 19) >> 19;
    if (entry == 0) return 0;
    sel = (w << 23) >> 21;      /* bits9.. as halfword index */
    id16 = *(u16 *)(data_ov002_022d0250 + sel);
    k = (id16 << 19) >> 19;
    k = func_0202b878(k);
    c2 = b ? ((w << 18) >> 28) : -1;
    if (func_ov002_021bbbc0(0, k, c2) != 0) return 1;
    c2 = (((w << 22) >> 31) == 1) ? ((w << 18) >> 28) : -1;
    if (func_ov002_021bbbc0(1, k, c2) != 0) return 1;
    return 0;
}
