/* CAMPAIGN-PREP candidate for func_02243dc4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: addls pc jump-table, bit0 narrow, byte-pack orr key, store order
 *   risk:       struct-guessed/permuter-class: source asm truncates after .L_bc — case-1/3/5 tail (.L_134 + final epilogue) reconstructed; switch case-grouping {2,4 vs 1,3,5} and tail returns unverified.
 *   confidence: low
 */
// func_ov002_02243dc4 — jump-table state machine (cls D); body truncated in source after .L_bc
// step at base+0x5b8, switch(step) {0->.L_160 default ret1; 1->.L_34; 2,4,6->.L_bc; 3,5->.L_8c}
// reconstructs cases 0/1/2/3 fully; tail of .L_bc beyond extract is the standard step++ ret0

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022ce288[];
extern u8 data_ov002_022d016c[];

extern int  func_ov002_02257878(void *obj, void *p);
extern void func_ov002_021ae400(u32 a, int b);
extern void func_ov002_0223dad0(void *obj, u32 b);
extern void func_ov002_021d8770(int a, int b);
extern int  func_ov002_022593f4(void);
extern void func_ov002_0225935c(u32 a, u16 b, void *p);
extern void func_ov002_022593a8(u32 a, u16 b, void *p);
extern void func_ov002_022593f4_unused(void);

int func_ov002_02243dc4(u16 *obj) {
    int step = *(int *)(data_ov002_022ce288 + 0x5b8);
    switch (step) {
    default:                         /* >5 -> .L_160 */
        return 1;
    case 0: {                        /* .L_34 */
        if (func_ov002_02257878(obj, data_ov002_022d016c) == 0)
            return -1;
        {
            u16 h2 = obj[1];
            func_ov002_021ae400((u32)(h2 << 0x1f) >> 0x1f, 0x9b);
        }
        {
            u16 h2 = obj[1];
            u16 h0 = obj[0];
            func_ov002_022593a8((u32)(h2 << 0x1f) >> 0x1f, h0, data_ov002_022d016c);
        }
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    }
    case 2: case 4: {                /* .L_8c */
        u16 h2 = obj[1];
        u16 h0 = obj[0];
        func_ov002_0225935c((u32)(h2 << 0x1f) >> 0x1f, h0, data_ov002_022d016c);
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    }
    case 1: case 3: case 5: {        /* .L_bc */
        if (func_ov002_022593f4()) {
            int a = *(int *)(data_ov002_022d016c + 0xd70);
            int b = *(int *)(data_ov002_022d016c + 0xd74) + *(int *)(data_ov002_022d016c + 0xd78);
            func_ov002_021d8770(a, b);
            {
                u32 key = ((a & 0xff) | ((b & 0xff) << 0x8));
                func_ov002_0223dad0(obj, (u16)key);
            }
            if (func_ov002_02257878(obj, data_ov002_022d016c) == 0)
                return 1;
            *(int *)(data_ov002_022ce288 + 0x5b8) += 1; /* tail beyond extract: step++ ret0 */
            return 0;
        }
        return 0; /* assumed .L_134 -> ret0 (tail truncated) */
    }
    }
}
