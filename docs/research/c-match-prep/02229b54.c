/* CAMPAIGN-PREP candidate for func_02229b54 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     nested dense addls-pc switches: outer state-0x7d in 0..3, inner *(u16*)(LIT1+0xb0) in 0..6
 *   risk:       struct-guessed/TRUNCATED: state 0x7d body + default absent; _LIT1/2/3 symbols guessed (data_022d016c vs data_022d0e6c assignment unconfirmed) -> the two 02257750 calls and the inner-switch base WILL likely diverge.
 *   confidence: low
 */
/* func_ov002_02229b54 (ov002, class D, MED) brief 498. UNVERIFIED.
 * !! TRUNCATED (stops at .L_100) + literal pool absent: state 0x7d(.L_100) body unknown -> stub; default(.L_134) -> return 0;
 *    _LIT1/_LIT2/_LIT3 GUESSED from .extern list (only data_022d016c & data_022d0e6c remain after ce288). LIT2 reused 3x; LIT3 once.
 * Outer switch(state=*(int*)(ce288+0x5a8)) [dense addls-pc over state-0x7d in 0..3]:
 *   0x80: 0226b258(b0=f2.bit0, f1=(f2<<26)>>27 {5-bit}); return 0x7f;
 *   0x7f: inner switch(*(u16*)(LIT1+0xb0)) [dense, 0..6]: 0,1->return 0; 2,3->021de408(self,02257750(LIT2)); 4,5,6->if(02257878(LIT2))return 0x7e else 0; default->021de408(self,02257750(LIT3));
 *   0x7e: 021ae400(b0,0x62); 0225935c(b0,f0,LIT2); return 0x7d;  0x7d/default: TRUNCATED. */
typedef unsigned short u16;
struct F02229b54_F2 { u16 bit0 : 1; u16 f1 : 5; u16 rest : 10; };
struct F02229b54_Self { u16 f0; struct F02229b54_F2 f2; };

extern unsigned char data_ov002_022ce288[];
extern unsigned char data_ov002_022d016c[];
extern unsigned char data_ov002_022d0e6c[];
extern void func_ov002_0226b258(int b0, int f1);
extern int  func_ov002_02257750(void *p);
extern int  func_ov002_02257878(void *p);
extern void func_ov002_021de408(struct F02229b54_Self *self, int x);
extern void func_ov002_021ae400(int b0, int x62);
extern void func_ov002_0225935c(int b0, int f0, void *p);
extern void func_ov002_021e96a0(void);

int func_ov002_02229b54(struct F02229b54_Self *self) {
    int state = *(int *)(data_ov002_022ce288 + 0x5a8);
    switch (state) {
    case 0x80:
        func_ov002_0226b258(self->f2.bit0, self->f2.f1);
        return 0x7f;
    case 0x7f:
        switch (*(u16 *)(data_ov002_022d016c + 0xb0)) {
        case 0:
        case 1:
            return 0;
        case 2:
        case 3:
            func_ov002_021de408(self, func_ov002_02257750(data_ov002_022d0e6c));
            return 0;
        case 4:
        case 5:
        case 6:
            if (func_ov002_02257878(data_ov002_022d0e6c) != 0)
                return 0x7e;
            return 0;
        default:
            func_ov002_021de408(self, func_ov002_02257750(data_ov002_022d0e6c));
            return 0;
        }
    case 0x7e:
        func_ov002_021ae400(self->f2.bit0, 0x62);
        func_ov002_0225935c(self->f2.bit0, self->f0, data_ov002_022d0e6c);
        return 0x7d;
    case 0x7d:
        func_ov002_021e96a0();
        return 0;
    }
    return 0;
}
