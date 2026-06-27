/* CAMPAIGN-PREP candidate for func_020a3d34 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind-vs-reload: orig reloads *data_021a98f8 + re-adds 0x500 per store (no call between); poll do-while; f50d=1
 *   risk:       permuter-class: the 4 u16 resets each reload the base (4 ldr) but mwcc -O4 will CSE *data_021a98f8 to ONE base load with no call between -> 3 ldr missing. Likely needs volatile global or escape to .s.
 *   confidence: low
 */
/* func_020a3d34 (main, class C) — reset four halfword fields, kick a worker,
 * then either poll a transfer to completion (return 0) or bail (return 8); a
 * separate already-busy path also closes out and returns 0.
 *   no incoming args (operates on globals data_021a98f0/f4/f8/fc)
 *
 * asm shape (the four resets each RELOAD *data_021a98f8 and re-add 0x500 with
 * NO intervening call -> bind-vs-reload is the crux; orig does NOT CSE):
 *   data_021a98f8->f528 = 0;   // 0x500+0x28, u16
 *   data_021a98f8->f52a = 0;   // 0x500+0x2a
 *   data_021a98f8->f526 = 0;   // 0x500+0x26
 *   data_021a98f8->f548 = 0;   // 0x500+0x48
 *   func_020a3830(0xa);
 *   if ((*data_021a98fc + 0x1000)->f320 == 0) {
 *       int rc;
 *       do { rc = func_0209f070(*data_021a98f4,
 *                               (*data_021a98f8)->f508,
 *                               (unsigned short)*data_021a98f0); }
 *       while (rc == 4);
 *       if (rc != 2) return 8;
 *       func_0209e8d0((*data_021a98f8)->f508);
 *       (*data_021a98f8)->f50d = 1;
 *       return 0;
 *   } else {
 *       func_0209e8d0((*data_021a98f8)->f508);
 *       (*data_021a98f8)->f50d = 1;
 *       func_020a53e4();
 *       return 0;
 *   }
 *
 * f508 (int) and f50d (byte) are reached by a single ldr/strb (0x508/0x50d
 * fit a 12-bit offset); only the u16 resets force the separate add #0x500.
 */

typedef struct {
    char           _pad000[0x508];
    int            f508;   /* +0x508 */
    char           _pad50c;
    unsigned char  f50d;   /* +0x50d */
    char           _pad50e[0x526 - 0x50e];
    unsigned short f526;   /* +0x526 */
    unsigned short f528;   /* +0x528 */
    unsigned short f52a;   /* +0x52a */
    char           _pad52c[0x548 - 0x52c];
    unsigned short f548;   /* +0x548 */
} a3d34_state;

typedef struct { char _pad[0x1320]; int f320; } a3d34_region; /* (*ptr+0x1000)+0x320 */

extern a3d34_state   *data_021a98f8;
extern a3d34_region  *data_021a98fc;
extern int            data_021a98f4;    /* read by value: *data_021a98f4 */
extern unsigned short data_021a98f0;    /* read by value: (u16)*data_021a98f0 */

extern void func_020a3830(int arg);
extern int  func_0209f070(int a0, int a1, int a2);
extern void func_0209e8d0(int arg);
extern void func_020a53e4(void);

int func_020a3d34(void)
{
    data_021a98f8->f528 = 0;
    data_021a98f8->f52a = 0;
    data_021a98f8->f526 = 0;
    data_021a98f8->f548 = 0;

    func_020a3830(0xa);

    if (data_021a98fc->f320 == 0) {
        int rc;
        do {
            rc = func_0209f070(data_021a98f4,
                               data_021a98f8->f508,
                               (unsigned short)data_021a98f0);
        } while (rc == 4);

        if (rc != 2) return 8;

        func_0209e8d0(data_021a98f8->f508);
        data_021a98f8->f50d = 1;
        return 0;
    } else {
        func_0209e8d0(data_021a98f8->f508);
        data_021a98f8->f50d = 1;
        func_020a53e4();
        return 0;
    }
}
