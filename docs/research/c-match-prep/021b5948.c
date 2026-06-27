/* CAMPAIGN-PREP candidate for func_021b5948 (ov019, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed /2 (sign>>31+asr); nested bounds && for lazy ldrge; store-order cmd pack; bind base
 *   risk:       permuter-class: the lazy ldrge/cond-exec bounds chain (nested-&& vs flat 4-term &&) drives branch shape and may not match; stack-slot order for a/b also struct-guessed.
 *   confidence: low
 */
/* func_ov019_021b5948 (ov019, class D): y = (0xc0 - obj[0x14])/2 - 8 (signed
 * div-by-2 via add sign>>31; asr#1). base = obj[0x18] + y. If obj[4]==1 &&
 * obj[0]==1: probe a hit window (coords via func_02006110), then pack a 6-byte
 * command block and dispatch (func_02005dac handle -> func_020944a4).
 *
 * Stack frame 0x10 = 6-byte cmd (lowest) + two coord ints. coord a=[sp+0xc],
 * b=[sp+0x8]; func_02006110(&a,&b). cmd.w = ((base-2)&0xff)|0xc0614000;
 * cmd.h = (sel|0x1400) with sel 0x338 or (probe!=0 && hit) 0x340. */

extern int  func_02005dac(int a, int b, void *blk);
extern void func_02006110(int *outA, int *outB);
extern int  func_020061ac(void);
extern void func_020944a4(void *blk, int handle, int n);

struct cmd_021b5948 {
    int w;
    unsigned short h;
};

int func_ov019_021b5948(int *obj) {
    struct cmd_021b5948 cmd;
    int a, b;
    int y;
    int base;
    int hit;
    int sel;
    int handle;

    y = (0xc0 - obj[5]) / 2 - 8;     /* obj[0x14] = obj[5] */
    base = obj[6] + y;               /* obj[0x18] = obj[6] */

    if (obj[1] == 1 && obj[0] == 1) {
        hit = 0;
        func_02006110(&a, &b);
        if (a >= 0x68 && b >= base + 5) {
            if (a < 0x98 && b < base + 5 + 0x12)
                hit = 1;
        }
        sel = 0x338;
        if (func_020061ac() != 0 && hit != 0)
            sel = 0x340;

        cmd.w = ((base - 2) & 0xff) | 0xc0614000;
        cmd.h = (unsigned short)(sel | 0x1400);
        handle = func_02005dac(2, 0, &cmd);
        func_020944a4(&cmd, handle, 6);
    }
    return 1;
}
