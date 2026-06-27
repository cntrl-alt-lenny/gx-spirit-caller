/* CAMPAIGN-PREP candidate for func_02062eec (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D store-order: h_64++ store-before-call; flag&0xff byte-mask; reload &buf50
 *   risk:       orig recomputes 'add r0,r7,#0x50' for EACH of the 4 calls (does NOT bind &buf50); if mwcc binds it into one local the per-call add->ldr diverges -- reshape-able (force reload: pass (char*)o+0x50 inline, don't hoist).
 *   confidence: med
 */
/* func_02062eec (cls D, size 0xd4): the low-level packet header writer.
 *
 *   if (func_02061530(&o->buf50) < len) { r=func_020643ac(o); if(r)*out=1; return !!r; }
 *   if (func_02062fc0(o, o->h_64, len) == 0) { r=func_020643ac(o); if(r)*out=1; return !!r; }
 *   func_020613d8(&o->buf50, &hdr2, 2);     // emit the 2 magic bytes (data_02101530)
 *   func_020614d8(&o->buf50, flag & 0xff);  // byte-masked flag
 *   func_02061464(&o->buf50, o->h_64++);    // seq id, halfword; store-before-call
 *   func_02061464(&o->buf50, o->h_66);      // ack id, halfword
 *   *out = 0; return 1;
 *
 * Store-order critical: o->h_64++ stores the incremented value BEFORE the call
 * but passes the pre-increment value (asm: ldrh;add;strh;bl).
 */

typedef unsigned short u16;

typedef struct Buf50 { unsigned char b[0x14]; } Buf50;  /* 0x50..0x64 */

typedef struct Obj Obj;
struct Obj {
    char   _pad0[0x50];
    Buf50  buf50;       /* 0x50: sub-buffer object passed by &o->buf50 */
    u16    h_64;        /* outgoing seq */
    u16    h_66;        /* incoming ack */
};

extern int data_02101530;
extern int func_02061530(Buf50 *b);
extern int func_020643ac(Obj *o);
extern int func_02062fc0(Obj *o, int seq, int len);
extern int func_020613d8(Buf50 *b, void *src, int n);
extern int func_020614d8(Buf50 *b, int v);
extern int func_02061464(Buf50 *b, u16 v);

int func_02062eec(Obj *o, int flag, int len, int *out)
{
    int r;

    if (func_02061530(&o->buf50) < len) {
        r = func_020643ac(o);
        if (r)
            *out = 1;
        return r ? 1 : 0;
    }
    if (func_02062fc0(o, o->h_64, len) == 0) {
        r = func_020643ac(o);
        if (r)
            *out = 1;
        return r ? 1 : 0;
    }

    func_020613d8(&o->buf50, &data_02101530, 2);
    func_020614d8(&o->buf50, flag & 0xff);
    func_02061464(&o->buf50, o->h_64++);
    func_02061464(&o->buf50, o->h_66);
    *out = 0;
    return 1;
}
