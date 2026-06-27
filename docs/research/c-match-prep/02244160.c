/* CAMPAIGN-PREP candidate for func_02244160 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: addls pc jump-table, bit0 narrow, fn-ptr args, step++/-- branches
 *   risk:       struct-guessed: data_022d016c +0xd70/0xd74/0xd78 are int fields inferred; arg order of 0223dcc0(b,a) follows asm r1=ld70,r2=ld74+ld78 — confirm signature.
 *   confidence: med
 */
// func_ov002_02244160 — jump-table state machine (cls D)
// step at base+0x5b8: switch(step){0->.L_2c;1->.L_b4;2->.L_70;3->.L_b4; default(>3)->ret1}
// (table: .L_10c,.L_2c,.L_b4,.L_70,.L_b4) -> case3 shares .L_b4 with case1
// bit0 narrow from obj+0x2; .L_b4 does step++ on success, step-- on failure (022593f4==0)

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022ce288[];
extern u8 data_ov002_022d016c[];
extern void func_ov002_021f208c(void);
extern void func_ov002_021f27b4(void);

extern void func_ov002_021ae400(u32 a, int b);
extern void func_ov002_0225935c(u32 a, u16 b, void *fn);
extern int  func_ov002_022593f4(void);
extern void func_ov002_0223dcc0(u16 *obj, int a, int b);

int func_ov002_02244160(u16 *obj) {
    int step = *(int *)(data_ov002_022ce288 + 0x5b8);
    switch (step) {
    default:
        return 1;                       /* .L_10c */
    case 0: {                           /* .L_2c */
        u16 h2 = obj[1];
        func_ov002_021ae400((u32)(h2 << 0x1f) >> 0x1f, 0x7c);
        {
            u16 h2b = obj[1];
            u16 h0  = obj[0];
            func_ov002_0225935c((u32)(h2b << 0x1f) >> 0x1f, h0, (void *)func_ov002_021f27b4);
        }
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    }
    case 2: {                           /* .L_70 */
        u16 h2 = obj[1];
        func_ov002_021ae400((u32)(h2 << 0x1f) >> 0x1f, 0x64);
        {
            u16 h2b = obj[1];
            u16 h0  = obj[0];
            func_ov002_0225935c((u32)(h2b << 0x1f) >> 0x1f, h0, (void *)func_ov002_021f208c);
        }
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    }
    case 1: case 3: {                   /* .L_b4 */
        if (func_ov002_022593f4()) {
            int b = *(int *)(data_ov002_022d016c + 0xd74) + *(int *)(data_ov002_022d016c + 0xd78);
            int a = *(int *)(data_ov002_022d016c + 0xd70);
            func_ov002_0223dcc0(obj, b, a);
            *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
            return 0;
        }
        *(int *)(data_ov002_022ce288 + 0x5b8) -= 1;   /* .L_f4 */
        return 0;
    }
    }
}
