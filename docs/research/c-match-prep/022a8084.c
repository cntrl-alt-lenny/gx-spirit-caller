/* CAMPAIGN-PREP candidate for func_022a8084 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard (idx-1)==count, :N bitfield RMW stores in order, stack-struct store-order kept
 *   risk:       struct-guessed: the sp+4 Loc layout/size and field offsets (f4/f10/f14/f18) are inferred from str displacements; field/store ordering and the 0xc4 record stride need confirming against the real struct.
 *   confidence: low
 */
/* func_ov002_022a8084 (ov002, D) — append a packed-u16 record then construct an
 * actor. r0=obj, r1,r2 = field vals (a:1,b:5; c left 0), r3=index. Guard:
 * (r3-1) must == count at obj+0x5e4, else return. Build local u16 hdr (a=r1,b=r2,
 * c untouched, bit14=0, bit15=0), store to *(u16*)(obj + count*2 + 0x500 + 0xc4);
 * count++ -> obj+0x5e4; *(int*)(obj+0x5e8)=0x10. Then a fixed construct sequence:
 * r4=func_02006c0c(data_cc310); func_0201d47c(&loc); set up loc struct
 * (loc+0x10=0xb980, loc+0x4=r4, loc.f18 low nibble=9, loc+0x14=-1);
 * func_0201e5b8(&loc); func_02006e1c(r4); func_02037208(0x36,-1,0,1).
 * Stack-struct layout (sp+4..) and store-order preserved. */
typedef unsigned short u16;
struct Hdr { u16 a : 1, b : 5, c : 8, e : 1, f : 1; };
struct Loc {                 /* at sp+4, ~0x28 bytes */
    int f0;                  /* +0x4-0x4 */
    void *f4;                /* +0x4 (r4) -> [sp+0x4] */
    char _p[8];
    int f10;                 /* +0x10 = 0xb980 */
    int f14;                 /* +0x14 = -1 (strh -1) */
    u16 f18;                 /* +0x18 low nibble = 9 */
};
extern void *data_ov002_022cc310;
extern void *func_02006c0c(void *p);
extern void func_02006e1c(void *p);
extern void func_0201d47c(struct Loc *l);
extern void func_0201e5b8(struct Loc *l);
extern void func_02037208(int a, int b, int c, int d);

void func_ov002_022a8084(char *obj, int r1, int r2, int idx) {
    struct Loc loc;
    void *r4;
    int count = *(int *)(obj + 0x5e4);
    struct Hdr h;
    if (idx - 1 != count) return;
    *(int *)&h = (int)*(u16 *)(obj + count * 2 + 0x500 + 0xc4); /* anchor; overwritten */
    h.a = r1;
    h.b = r2;
    h.e = 0;
    h.f = 0;
    *(u16 *)(obj + count * 2 + 0x500 + 0xc4) = *(u16 *)&h;
    *(int *)(obj + 0x5e4) = count + 1;
    *(int *)(obj + 0x5e8) = 0x10;
    r4 = func_02006c0c(data_ov002_022cc310);
    func_0201d47c(&loc);
    loc.f10 = 0xb980;
    loc.f4 = r4;
    loc.f18 = (loc.f18 & ~0xf) | 9;
    loc.f14 = -1;
    func_0201e5b8(&loc);
    func_02006e1c(r4);
    func_02037208(0x36, -1, 0, 1);
}
