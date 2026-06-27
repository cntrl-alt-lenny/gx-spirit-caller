/* CAMPAIGN-PREP candidate for func_022115cc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: signed-byte extract; smulbb r5*0x14; :13 field; strh 1/0 store-order
 *   risk:       store-order/reg-class: orig sets strh 1, calls, then strh 0 BEFORE the branch (r6 reused as base r1+r8); my if/else duplicates the strh 0 and may diverge in placement. Also smulbb wants r5 signed*0x14. reshape-able (single strh 0 before branch) / struct-guessed.
 *   confidence: low
 */
/* func_ov002_022115cc (ov002, cls D): call 0223df38(self,0,&local) to fetch a packed
 * descriptor into stack; unpack r4=byte0, r5=sbyte (bits[15:8] of low16, sign-ext to
 * byte), r8=(byte0&1)*0x868, r7=r5*0x14 (smulbb). Read *(022cf16c+r8+r7+0x30) :13 ->
 * r6; if 0 return. Read halfword data_022cf1a4[r8 + r7]; if !=0: 0225764c then maybe
 * 021de4d8, return 0. Else (==0): 021d6714(r4,r5,1); 021df708(r4,r6); 021e2b1c(0x1e);
 * set the halfword to 1, 0225764c, clear it to 0, 021de4d8..., 021d6714(r4,r5,0).
 * r9=self(arg0). LIT0=0x868, LIT1=data_022cf16c, LIT2=data_022cf1a4. Store-order on
 * the strh 1 then strh 0 around 0225764c. */
struct Rec16 { unsigned int id:13; };
extern int   data_ov002_022cf16c[];
extern unsigned short data_ov002_022cf1a4[];
extern int  func_ov002_021d6714(int a, int b, int c);
extern int  func_ov002_021de4d8(int a, int b, int c);
extern int  func_ov002_021df708(int a, int b);
extern int  func_ov002_021e2b1c(int a);
extern int  func_ov002_0223df38(int a, int b, void *out);
extern int  func_ov002_0225764c(int a, int b, int c);
int func_ov002_022115cc(int self) {
    unsigned int packed;
    int r4, r5, r8, r7, r6;
    if (func_ov002_0223df38(self, 0, &packed) == 0)
        return 0;
    r4 = packed & 0xff;
    r5 = (signed char)((packed >> 8) & 0xff);
    r8 = (r4 & 1) * 0x868;
    r7 = r5 * 0x14;
    r6 = ((struct Rec16 *)((char *)data_ov002_022cf16c + r8 + r7 + 0x30))->id;
    if (r6 == 0)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + r8 + r7) != 0) {
        if (func_ov002_0225764c(self, r4, r5) != 0)
            func_ov002_021de4d8(self, r4, r5);
        return 0;
    }
    func_ov002_021d6714(r4, r5, 1);
    func_ov002_021df708(r4, r6);
    func_ov002_021e2b1c(0x1e);
    *(unsigned short *)((char *)data_ov002_022cf1a4 + r8 + r7) = 1;
    if (func_ov002_0225764c(self, r4, r5) != 0) {
        *(unsigned short *)((char *)data_ov002_022cf1a4 + r8 + r7) = 0;
        if (func_ov002_021de4d8(self, r4, r5) != 0)
            return 0;
    } else {
        *(unsigned short *)((char *)data_ov002_022cf1a4 + r8 + r7) = 0;
    }
    func_ov002_021d6714(r4, r5, 0);
    return 0;
}
