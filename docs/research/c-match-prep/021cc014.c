/* CAMPAIGN-PREP candidate for func_021cc014 (ov004, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: nibble :3 bitfield + store-order frame + msg(58,-1,0,1) sub-not-fold
 *   risk:       permuter-class: outgoing-arg stack-store scheduling + r0 carried from the .L_98 join (b500+0x54 store then func_02037208 args) — frame field order/decl reshuffle unlikely to recover; already ships as .s.
 *   confidence: low
 */
/* func_ov004_021cc014: ov004 state-init branch. If func_0201d030()==4 take the
 * early func_0201d07c()/return-1 arm; else marshal a 6-tag string buffer
 * (nibble bitfield from data_02104f4c+0xa3c), copy two name strings, push a
 * config via func_02020d00, advance state, clear three b500 fields, fall to
 * the shared func_02037208(58,-1,0,1) tail.  Class D: nibble bitfield +
 * store-order marshalling. */
extern char data_021040ac[];
extern char data_02104c7a[];
extern char data_02104f4c[];
extern char data_02105989[];
extern char data_ov004_0220b500[];
extern int  func_0201d030(void);
extern void func_0201d07c(void);
extern void func_0201d134(void);
extern void func_02020d00(void *buf, int one, void *arg3);
extern void func_02037208(int a, int b, int c, int d);
extern void func_020aadf8(void *dst, void *src);

typedef struct { unsigned char bf : 3; } b500_a3c_t;

int func_ov004_021cc014(void) {
    char *b = data_ov004_0220b500;
    int state;
    /* outgoing-arg frame: sp[0]=6, sp[4]=field-a64, sp[8]=signed byte b00.cc,
     * sp[9..]=two copied strings */
    struct {
        int  tag;        /* sp[0]  = 6           */
        int  f4;         /* sp[4]  = b500.a64    */
        signed char b8;  /* sp[8]  = (s8)b500[0xbcc]? */
        char name0;      /* sp[9]  */
        char pad[0x17];
    } frame;

    if (func_0201d030() == 4) {
        func_0201d07c();
        return 1;
    }
    frame.tag = 6;
    /* nibble: b500[0xa3c] & 7 stored back to b500[0xbcc] (lsl#1d;lsr#1d => :3) */
    *(unsigned char *)(b + 0xbcc) = ((b500_a3c_t *)(b + 0xa3c))->bf;
    frame.b8 = *(signed char *)(b + 0xb00 + 0xcc);
    func_020aadf8(data_02104c7a, data_02105989);
    func_020aadf8(&frame.name0, data_02104c7a);
    frame.f4 = *(int *)(b + 0xa64);
    func_02020d00(&frame, 1, data_02104f4c);
    func_0201d134();
    *(int *)(b + 0x74) = 0;
    *(int *)(b + 0x7c) = 0;
    *(int *)(b + 0x78) = 0;
    state = 2;
    *(int *)(b + 0x54) = state;
    func_02037208(58, -1, 0, 1);
    return state; /* r0 reused as the func_02037208 arg path; see risk */
}
