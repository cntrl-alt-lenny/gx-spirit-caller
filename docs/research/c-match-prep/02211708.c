/* CAMPAIGN-PREP candidate for func_02211708 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: phase guard; :1 flag; mla parity*0x868 idx; byte-field RMW into halfword
 *   risk:       byte RMW codegen: the tail decrement of off6 low byte (add #0xff;add #0xff00;<<16;>>16;bic;and;orr;strh) is a sign-juggled -1 then mask -- mwcc may emit a different mask sequence. reshape-able (use (h6&0xff)-1 vs h6-1 form) / struct-guessed.
 *   confidence: low
 */
/* func_ov002_02211708 (ov002, cls D): if *(022ce288+0x5a8)==0x7f fallthrough; ==0x80
 * first calls 021e2b3c(); else (neither) return 0. Then r1=self->off6 byte0; if 0 ->
 * 021e2c5c() return 0. Else 0223def4(self, byte0-1); 021b99b4(self->off2:1, r0) -> ip;
 * if ip>=0: index data_022cf16c[(off2:1 &1)*0x868 + 0x18 + 0x400 + ip*4], pass as r2
 * to 021d7d0c(self,...). Finally decrement self->off6 byte0 field and store back
 * (byte RMW into the halfword at off6, low byte). LIT0=022ce288, LIT1=data_022cf16c,
 * LIT2=0x868. */
struct E6 { unsigned short flag:1; };
extern int   data_ov002_022ce288[];
extern int   data_ov002_022cf16c[];
extern int  func_ov002_021b99b4(int a, int b);
extern int  func_ov002_021d7d0c(int a, int b);
extern int  func_ov002_021e2b3c(void);
extern int  func_ov002_021e2c5c(void);
extern int  func_ov002_0223def4(int a, int b);
int func_ov002_02211708(char *self) {
    int phase = data_ov002_022ce288[0x5a8 / 4];
    unsigned short h6;
    int cnt, ip, r0;
    if (phase == 0x80)
        func_ov002_021e2b3c();
    else if (phase != 0x7f)
        return 0;
    h6 = *(unsigned short *)(self + 6);
    cnt = h6 & 0xff;
    if (cnt == 0) {
        func_ov002_021e2c5c();
        return 0;
    }
    r0 = func_ov002_0223def4((int)self, cnt - 1);
    ip = func_ov002_021b99b4(((struct E6 *)(self + 2))->flag, r0);
    if (ip >= 0) {
        int base = (((struct E6 *)(self + 2))->flag & 1) * 0x868;
        int r2 = (int)((char *)data_ov002_022cf16c + base + 0x18 + 0x400 + ip * 4);
        func_ov002_021d7d0c((int)self, r2);
    }
    h6 = *(unsigned short *)(self + 6);
    *(unsigned short *)(self + 6) = (h6 & ~0xffu) | (((h6 & 0xff) - 1) & 0xff);
    return 0;
}
