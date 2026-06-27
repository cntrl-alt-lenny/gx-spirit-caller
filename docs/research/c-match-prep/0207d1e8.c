/* CAMPAIGN-PREP candidate for func_0207d1e8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D byte-pack via flags=0; &=~0xff; |=(f&0xff); EUR twin of shipped USA .s
 *   risk:       permuter-class: USA twin func_0207d100 ships as hand-.s precisely because this u32-low-byte read/modify/write (str0;ldr;bic;str;ldr;orr;str) is a reg-alloc wall mwcc won't reproduce; expect escape-to-.s.
 *   confidence: low
 */
/* func_0207d1e8 (main, class D, 0x8c) — struct init + bitfield byte pack.
 * EUR twin of USA's already-ship-as-.s func_0207d100 (same body, different
 * callees func_0207d1b8/d274/d12c). obj layout: +0x0 ptr a1, +0xc body[],
 * +0x18 a2, +0x1c a3, +0x20 u32 flags whose LOW BYTE is a u8 bitfield set
 * from the 5th (stacked u16) arg. Then register the body block (func_0207d1b8,
 * size 4), one-shot global init guarded by data_021a08d0, hook + list-insert.
 * WARNING: USA twin ships as .s -> this exact byte-pack is a reg-alloc wall.
 */
extern void func_0207d1b8(void *block, int size);
extern void func_0207d274(void *obj);
extern void func_0207d12c(void *list, void *node);
extern int  data_021a08d0;
extern char data_021a08d4;

typedef struct Obj_1e8 {
    void           *f0;    /* +0x00 */
    char            _p4[8];/* +0x04 */
    char            body[12];/* +0x0c, passed by &  */
    void           *f18;   /* +0x18 */
    void           *f1c;   /* +0x1c */
    unsigned int    flags; /* +0x20 ; low byte is a u8 field */
} Obj_1e8;

void func_0207d1e8(Obj_1e8 *obj, void *a1, void *a2, void *a3, unsigned short f) {
    obj->f0  = a1;
    obj->f18 = a2;
    obj->f1c = a3;
    obj->flags = 0;
    obj->flags &= ~0xffu;
    obj->flags |= (f & 0xff);
    func_0207d1b8(obj->body, 4);
    if (data_021a08d0 == 0) {
        func_0207d1b8(&data_021a08d4, 4);
        data_021a08d0 = 1;
    }
    func_0207d274(obj);
    func_0207d12c(obj, obj);
}
