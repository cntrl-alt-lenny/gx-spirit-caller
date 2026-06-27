/* CAMPAIGN-PREP candidate for func_022a4874 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ordered MMIO/struct store-order RMW; :2 extract from 02104f4c; parity(adds..ror) const-pair select; final field insert
 *   risk:       permuter-class+struct-guessed: 0x60 stack frame of GX local structs + many call-arg sequencings; the `adds r0,r1,r0,ror#0x1f` parity is hand-tuned codegen unlikely from plain C, and most call signatures/return-threading are inferred. Already .s; treat as escape-to-.s.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_022a4874 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. long linear init/setup; ships-as-.s.
 *   recipe: ordered MMIO/struct RMW (store-order), :2 bitfield extract from data_02104f4c,
 *           parity-of-2bit (adds...ror) selecting two const pairs, signed /2, final MMIO field insert.
 */
extern int  data_02104f4c[];                     /* [+0x4] holds the :2 field */
extern char data_ov002_022cbe10[];               /* table indexed by f4 */
extern char data_ov002_022cbf50[];
extern void func_02006c0c(void *p, int a, int b);
extern void func_02006e1c(int h);
extern void func_0201d47c(void *p);
extern void func_0201e5b8(void *p);
extern void func_02037208(int a, int b, int c, int d);
extern void func_0208b0f0(void *p, int a, int b);
extern int  func_0208c8b0(int a);
extern void func_0208df94(void);
extern void func_0208e318(int a, int b, int c, int d, int e);
extern void func_0208e334(int a, void *p, int b, int c, int d, int e);
extern void func_02091554(void *p, int a, int b);
extern void func_02094504(int a, int b, int c);

typedef struct { int f0; int f4; } ObjA48;

#define REG_100E (*(volatile unsigned short *)0x0400100e)
#define REG_1000 (*(volatile unsigned int   *)0x04001000)

void func_ov002_022a4874(ObjA48 *s) {
    /* note: large stack frame of GX/OAM-style local structs (sp+0x18, sp+0x40, sp+0x8) */
    unsigned char fr[0x60];
    int twob, par, a, b;
    int dummy;

    func_0208c8b0(5);
    REG_100E &= ~3;
    REG_100E = (REG_100E & 0x43) | 0x318 | 0x5c00;
    func_0208df94();
    func_02094504(0, /*ret of df94*/ 0, 0x800);

    /* build OAM template at fr+0x40 from table[s->f4] */
    func_02091554((void *)(fr + 0x40),
                  *(int *)(data_ov002_022cbe10 + s->f4 * 4),
                  (int)(long)data_ov002_022cbf50);
    func_0201d47c((void *)(fr + 0x18));
    *(int *)(fr + 0x18) = 0; func_02006c0c((void *)(fr + 0x40), 4, 0); /* str r0,[sp+18] */
    *(int *)(fr + 0x20) = 0;
    *(int *)(fr + 0x24) = 0;
    *(unsigned short *)(fr + 0x2c) = (*(unsigned short *)(fr + 0x2c) & ~0xf) | 8;
    *(unsigned short *)(fr + 0x28) = 0x200;
    *(unsigned short *)(fr + 0x2c) = *(unsigned short *)(fr + 0x2c) | 0x10;
    *(int *)(fr + 0x30) = (*(int *)(fr + 0x30) & ~0x1c000) | 0x1c000;
    func_0201e5b8((void *)(fr + 0x18));
    func_02006e1c(*(int *)(fr + 0x18));

    if (s->f4 == 3)
        func_02037208(0x87, 0x87 - 0x88, 0, 1);

    /* 2-bit field from data_02104f4c[1]: (g>>3)&3 (lsl#0x1b,lsr#0x1e) */
    twob = (data_02104f4c[1] << 0x1b) >> 0x1e;       /* unsigned :2 -> but used signed below */
    par  = twob & 1;                                  /* parity / low bit */
    a = par ? 0xc : -0xc;                             /* mvnne r4,#0xb / moveq r4,#0xc */
    b = par ? 0x58 : 0x48;
    func_0208b0f0((void *)(fr + 0x8), 0xc00, 0xc00);
    *(int *)(fr + 0x0)  = -a;
    *(int *)(fr + 0x4)  = -b;
    func_0208e334(0x04001030, (void *)(fr + 0x8), 0x80, 0x10, 0, 0);
    *(int *)(fr + 0x0)  = 0x10;
    func_0208e318(0x04001050, 8, 0x3f, 0, 0x10);

    /* final MMIO insert: REG_1000 field [12:8] = (old[12:8]) ... orr #8 */
    REG_1000 = (REG_1000 & ~0x1f00) | ((((REG_1000 & 0x1f00) >> 8) | 8) << 8);
    (void)twob; (void)dummy;
}
