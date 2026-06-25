/* CAMPAIGN-PREP candidate for func_021cfbec (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     select-as-movcc (handle?-1:0x400), bitfield RMW low4 then bit4, bind id once
 *   risk:       struct-guessed: field offsets +0xc/+0x10/+0x14 and 0x28 frame inferred from stack stores; the lo4/b4 split must be one u16 bitfield to emit bic+orr+orr not separate strh.
 *   confidence: med
 */
/* func_ov004_021cfbec: build an OAM/affine descriptor on the stack and submit it.
 * a0=index (r6), a1=handle (r5). Calls 0202be4c(handle)->id(r4), 0201d47c(&desc)
 * to template-init the struct, patches a few fields, then 0201e5b8(&desc) + 02006e1c(id).
 * desc.f_c = (index<<10)+0x10000; desc.h14 bitfields RMW'd: low4=9, then +bit4(0x10);
 * desc.h10 = handle ? -1 : 0x400.  Class C: bind-vs-reload + select-as-movcc. */
extern int  func_0202be4c(int handle);
extern void func_0201d47c(void *desc);
extern void func_0201e5b8(void *desc);
extern void func_02006e1c(int id);

struct Ov004Desc1 {
    int            f_0;       /* +0x00 (id written here) */
    char           _pad4[8];
    int            f_c;       /* +0x0c */
    unsigned short h10;       /* +0x10 */
    unsigned short lo4 : 4;   /* +0x14 bits 0..3 */
    unsigned short b4  : 1;   /* +0x14 bit 4    */
    unsigned short     : 11;
    char           _pad16[0x28 - 0x16];
};

void func_ov004_021cfbec(int index, int handle) {
    struct Ov004Desc1 desc;
    int id;

    id = func_0202be4c(handle);
    func_0201d47c(&desc);
    desc.f_c = (index << 10) + 0x10000;
    desc.lo4 = 9;
    desc.b4 = 1;
    desc.h10 = handle ? (unsigned short)-1 : (unsigned short)0x400;
    desc.f_0 = id;
    func_0201e5b8(&desc);
    func_02006e1c(id);
}
