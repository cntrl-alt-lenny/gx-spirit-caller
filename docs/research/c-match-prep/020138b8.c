/* CAMPAIGN-PREP candidate for func_020138b8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :3 bitfield (lsl;lsr) reused 3x; counted u16-table loop; base reuse
 *   risk:       struct-guessed: Cfg field4 :3 bitfield and Tbl count@+0/tbl@+0xc layout inferred; loop literal-pool reload of data_02105a68 base may bind/diverge — reshape-able by splitting count vs tbl reads.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_020138b8 (main, class C/D) — prep batch p_0004.
 * UNVERIFIED build-free draft. Drop into src/, run ninja+objdiff, tweak per risk.
 *   recipe: init sequence; :3 bitfield read (lsl#1d;lsr#1d) of cfg+4 reused 3x; counted halfword loop
 */
/* func_020138b8: stack-local 0x3c block init'd by func_0202adf8(&buf). Three times reads
 * cfg(data_02104f4c)->field4 low-3-bits (lsl#0x1d;lsr#0x1d => unsigned :3 bitfield) and feeds it
 * to func_0202ae1c / func_0202c070 / stores it as byte to cfg[0xb00]. Misc init calls. Then loops
 * i=0..count-1 (count = *(u32*)data_02105a68) calling func_0202ba94(tbl[i] /*u16 at base+0xc+i*2*/, 1).
 * data_02105a68 base reused for both the count load [.] and the halfword table. */
extern void func_0202adf8(void *buf);
extern void func_0202ae1c(int v);
extern void func_0202c070(int v);
extern void func_02011b9c(void *a, void *b);
extern int  func_0202c0c0(int v);
extern void func_020aadf8(void *p, int v);
extern void func_0202ba94(int h, int f);
extern void func_0202c1ac(void);
extern void func_0202af40(void);

extern unsigned char data_02105a4d;
extern unsigned char data_020c59c4;

typedef struct { int _0; unsigned int b3:3; } Cfg;
extern Cfg data_02104f4c;

typedef struct { unsigned int count; unsigned char _4[8]; unsigned short tbl[1]; } Tbl;
extern Tbl data_02105a68;

void func_020138b8(void) {
    char buf[0x3c];
    unsigned int i;
    func_0202adf8(buf);
    func_0202ae1c(data_02104f4c.b3);
    func_0202c070(data_02104f4c.b3);
    func_02011b9c(&data_02105a68, &data_020c59c4);
    func_020aadf8(&data_02105a4d, func_0202c0c0(0x29));
    *((unsigned char *)&data_02104f4c + 0xb00) = data_02104f4c.b3;
    if (data_02105a68.count) {
        for (i = 0; i < data_02105a68.count; i++)
            func_0202ba94(data_02105a68.tbl[i], 1);
    }
    func_0202c1ac();
    func_0202af40();
}
