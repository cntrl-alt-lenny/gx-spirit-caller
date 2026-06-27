/* CAMPAIGN-PREP candidate for func_0223aa68 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: down-counting for-loop (subs/bmi), bitfield-insert RMW store-order preserved per strh, stride 0x18, raw extracts for call args
 *   risk:       reshape-able + struct-guessed: the two RMW (bic+orr lsr) into [s,#4] MUST keep exact store order and the (x<<30>>31)<<2 insert shape; if folded to a plain bitfield assign the bic/orr sequence changes. Confirm 0x18 stride & field bits.
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022ce288[];
extern u8 data_ov002_022ce588[];
extern int func_02031794(int a);
extern int func_ov002_021d8904(int a, int b, int c);
extern int func_ov002_021de598(int a, int b);
extern int func_ov002_0226b13c(int a, int b);

typedef struct {
    u16 f0;
    u16 a1 : 1; u16 a5 : 5; u16 rest2 : 10;   /* h2 */
    u16 b_lo2 : 2; u16 mid : 6; u16 rest4 : 8; /* h4 RMW field at bit1 then bit3 */
} Slot;

int func_ov002_0223aa68(int *self) {
    int n = *(int*)(data_ov002_022ce288 + 0x484);
    int i;
    Slot *s;
    for (i = n - 1; i >= 0; i--) {
        s = (Slot*)(data_ov002_022ce588 + i * 0x18);
        if (func_02031794(s->f0) != 0) continue;
        {
            u16 v = s->f0 /*[s,#4]*/;
            u16 h4 = *(u16*)((char*)s + 4);
            h4 |= 2;
            h4 = (h4 & ~4) | (((h4 << 30) >> 31 & 1) << 2);
            *(u16*)((char*)s + 4) = h4;
            h4 = *(u16*)((char*)s + 4);
            h4 = (h4 & ~8) | (((h4 << 29) >> 31 & 1) << 3);
            *(u16*)((char*)s + 4) = h4;
            (void)v;
        }
        {
            u16 h2 = *(u16*)((char*)s + 2);
            u16 h4 = *(u16*)((char*)s + 4);
            int a0 = (h2 << 31) >> 31 & 1;
            int a5 = (h2 >> 1) & 0x1f;
            int c = (h4 >> 9) & 0x1f;       /* (h4<<17)>>23 */
            func_ov002_021d8904(a0, a5, c);
        }
        {
            u16 h2 = *(u16*)((char*)s + 2);
            int a5 = (h2 >> 1) & 0x1f;
            if (a5 > 0xa) continue;
            func_ov002_021de598((int)self, h2 & 1);
        }
    }
    {
        u16 h2 = *(u16*)((char*)self + 2);
        int cnt = *(int*)(data_ov002_022ce288 + 0x484);
        func_ov002_0226b13c(1 - (h2 & 1), cnt);
    }
    return 0;
}
