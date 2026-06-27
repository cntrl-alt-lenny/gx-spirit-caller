/* CAMPAIGN-PREP candidate for func_0221fcbc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch on ce288+0x5a8; bit0 :1; flag-table index; d016c offset state reads
 *   risk:       ASM TRUNCATED inside case 0x7d (cut after 021c8470); the 0x7d tail and pool ids _LIT1/_LIT2/_LIT3 are inferred -> incomplete. struct-guessed (truncation, not a codegen issue).
 *   confidence: low
 */
/* func_ov002_0221fcbc: ov002 state dispatch (cls D). State at ce288+0x5a8 ->
 * sub#0x7d;cmp#3;addls pc table over 0x7d-0x80. WARNING: the batch asm is
 * TRUNCATED inside the 0x7d case (.L_c0) right after 021c8470 + a trailing
 * ldrh [r4,#2]; the remainder of case 0x7d and any tail are ABSENT. This TU
 * encodes the visible cases (0x80,0x7f,0x7e) and the visible prefix of 0x7d
 * and is a SCAFFOLD; fill 0x7d from the full disasm before a byte match.
 * _LIT0=ce288(+0x5a8), _LIT1=cd744 cfg, _LIT2=cd744 flag table, _LIT3=d016c. */
typedef unsigned short u16;
struct Self { u16 f0; u16 b0 : 1; };
extern char data_ov002_022cd744[];
extern char data_ov002_022ce288[];
extern char data_ov002_022d016c[];
extern int  func_ov002_021ae484(int a);
extern int  func_ov002_021c8470(int a, int b);
extern int  func_ov002_021de4b0(int a, int b, int c);
extern void func_ov002_021e2b3c(void);
extern int  func_ov002_022101c4(void);
extern int  func_ov002_02257878(int a, char *cfg);
extern int  func_ov002_022593a8(int a, int b, char *cfg);
extern int  func_ov002_022593f4(void);
int func_ov002_0221fcbc(struct Self *self) {
    int state = *(int *)(data_ov002_022ce288 + 0x5a8);
    switch (state) {
    case 0x80:
        func_ov002_022101c4();
        return 0x7f;
    case 0x7f:
        if (func_ov002_02257878(0, data_ov002_022cd744) == 0)
            return 0;
        if (*(int *)(data_ov002_022cd744 + (self->b0) * 4) == 1)
            *(int *)(data_ov002_022d016c + 0xd44) = 1;
        else
            func_ov002_021ae484(0x68);
        return 0x7e;
    case 0x7e:
        if (*(int *)(data_ov002_022d016c + 0xd44) == 0)
            return 0;
        func_ov002_022593a8(self->b0, self->f0, data_ov002_022cd744);
        return 0x7d;
    case 0x7d:
        if (func_ov002_022593f4() == 0)
            return 0x7f;
        func_ov002_021e2b3c();
        func_ov002_021de4b0((int)self,
            *(int *)(data_ov002_022d016c + 0xd70),
            *(int *)(data_ov002_022d016c + 0xd74) +
            *(int *)(data_ov002_022d016c + 0xd78));
        func_ov002_021c8470(*(int *)(data_ov002_022d016c + 0xd70),
            *(int *)(data_ov002_022d016c + 0xd74) +
            *(int *)(data_ov002_022d016c + 0xd78));
        /* TRUNCATED: rest of 0x7d (uses ldrh [self,#2]) absent from batch. */
        return 0x7d;
    }
    return 0;
}
