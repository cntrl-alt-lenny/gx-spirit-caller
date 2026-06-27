/* CAMPAIGN-PREP candidate for func_02229dcc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch on :13 field returning 0x800 when an f8 bit clears; obj=*(ce288+0x48c); mla (player&1)*0x868+0x120+idx*4
 *   risk:       reshape-able/permuter-class: orig hand-builds the pivot cascade off 0x161e (sub r1,#0xed / add #0x38/#0x67/#0x68). mwcc may emit absolute case-consts or a different bsearch split -> the +/-magic add chain likely won't reproduce verbatim; may need .s.
 *   confidence: low
 */
/* func_ov002_02229dcc (ov002, class D, MED) brief 498. UNVERIFIED.
 * No-call sparse cmp cascade -> switch on a 13-bit field; each matched value returns 0x800 iff a distinct f8 bit is CLEAR.
 * Decode: obj=*(Obj**)(ce288+0x48c); if(player!=obj->f2.bit0 || kind!=0xb) return 0;  // r0=player,r1=kind
 *   row=*(int*)(cf16c+(player&1)*0x868+0x120+idx*4);  // r2=idx
 *   field=(row<<19)>>19;  // 13-bit
 *   orig pivots on 0x161e (blt/bgt/beq) == mwcc balanced-bsearch for sparse switch. Values (_LIT3 0x161e +/- magic) & f8 bit:
 *     0x1531(-0xed)->bit0; 0x161e->bit1; 0x1656(+0x38)->bit2; 0x1685(+0x67)->bit3; 0x1686(+0x68)->bit4.
 *   case V: return (f8&bit)==0 ? 0x800 : 0; default: 0; */
typedef unsigned short u16;
struct F02229dcc_F2 { u16 bit0 : 1; u16 rest : 15; };
struct F02229dcc_Obj { u16 f0; struct F02229dcc_F2 f2; u16 pad4; u16 f6; u16 f8; };

extern unsigned char data_ov002_022ce288[];
extern unsigned char data_ov002_022cf16c[];

int func_ov002_02229dcc(int player, int kind, int idx) {
    struct F02229dcc_Obj *obj = *(struct F02229dcc_Obj **)(data_ov002_022ce288 + 0x48c);
    int row;
    int field;
    if (player != obj->f2.bit0 || kind != 0xb)
        return 0;
    row = *(int *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x120 + idx * 4);
    field = (int)(((unsigned)row << 0x13) >> 0x13);
    switch (field) {
    case 0x1531: if ((obj->f8 & 0x1) == 0) return 0x800; break;
    case 0x161e: if ((obj->f8 & 0x2) == 0) return 0x800; break;
    case 0x1656: if ((obj->f8 & 0x4) == 0) return 0x800; break;
    case 0x1685: if ((obj->f8 & 0x8) == 0) return 0x800; break;
    case 0x1686: if ((obj->f8 & 0x10) == 0) return 0x800; break;
    }
    return 0;
}
