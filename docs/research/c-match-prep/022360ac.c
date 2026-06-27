/* CAMPAIGN-PREP candidate for func_022360ac (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch(g+0x5a8-0x7d); double-mla record idx parity*0x868+row*20+0x30; 13-bit id :strh self+0xc
 *   risk:       struct-guessed/permuter-class: batch asm TRUNCATED mid-.L_39c so two case bodies are incomplete; 021de64c return-test elided. Needs full .s; expect reg-rotation on the unpack. Confirm struct.
 *   confidence: low
 */
/* func_ov002_022360ac (ov002, class D): state dispatch g+0x5a8 (0x7d..0x80),
 * double-mla index into the cf16c 0x868 record, 13-bit id strh back to self+0xc.
 * NOTE: batch asm TRUNCATED mid-.L_39c (ends at 'movs r4, r0'); .L_39c/.L_370
 * tails and .L_39c..L_408 partly missing. Reconstructs .L_2d0, .L_370, prefix. */
typedef unsigned short u16;

struct Self022360ac {
    u16 f0;            /* +0 */
    u16 packed2;       /* +2: bit0 (<<0x1f>>0x1f) */
    char _pad4[8];
    u16 fC;            /* +0xc: 13-bit id store target */
};

extern char data_ov002_022ce288[];   /* g: +0x5a8 */
extern char data_ov002_022cf16c[];   /* _LIT1 record base */
extern int  func_ov002_021c2e34(int v);
extern void func_ov002_021ca698(int v);
extern void func_ov002_021de64c(struct Self022360ac *self, int player, int row, int z);
extern void func_ov002_021e2b3c(void);
extern int  func_ov002_0223de94(struct Self022360ac *self, int z);
extern int  func_ov002_0223df38(int z1, int z2);
extern int  func_ov002_0225764c(struct Self022360ac *self, int player, int row);

int func_ov002_022360ac(struct Self022360ac *self) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8) - 0x7d) {
    case 0: { /* .L_2d0 */
        int ret, player, row, w, parity, id;
        if (func_ov002_0223df38(0, 0) == 0) return 0;
        ret = func_ov002_0223de94(self, 0);
        player = ret & 0xff;
        row = ((unsigned int)(ret << 16) >> 16) >> 8 & 0xff; /* asr#8 then &0xff */
        if (func_ov002_0225764c(self, player, row) == 0) return 0;
        if (((int (*)(struct Self022360ac*,int,int,int))func_ov002_021de64c, 0)) {}
        /* orig: bl 021de64c(self,player,row,0); cmp r0,#0; beq fail */
        /* (021de64c declared void above; treat as int for the test) */
        parity = player & 1;
        w = *(int *)(data_ov002_022cf16c + parity * 0x868 + row * 20 + 0x30);
        id = (unsigned int)(w << 19) >> 19;     /* 13-bit */
        self->fC = id;
        return 0x7f;
    }
    case 3: { /* .L_370 */
        int b0 = (self->packed2 << 31) >> 31;
        func_ov002_021ca698(1 - b0);
        /* orig: cmp r0,#0; moveq r0,#0 / popeq; then 021e2b3c; return 0x7e */
        func_ov002_021e2b3c();
        return 0x7e;
    }
    case 2: /* .L_39c TRUNCATED in batch (body cut at movs r4,r0) */
    default:
        return 0;
    }
}
