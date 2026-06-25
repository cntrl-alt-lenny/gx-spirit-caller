/* CAMPAIGN-PREP candidate for func_0205d7e4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     staged bail-returns in order; stash hdr->fc/f10 to sp[8]/[c] before branch; node8 fill order f04 then f00
 *   risk:       reshape-able: func_02058528 reads sp[8]/sp[0xc] (a,b) while sp[0]=hdr/sp[4]=0 are written but unconsumed; if mwcc elides those dead stack stores or reorders node->f04/f00 the bytes differ. Hdr/Node8 offsets struct-guessed.
 *   confidence: low
 */
/* func_0205d7e4: parse/validate then optionally allocate-and-dispatch.
 * r5=s, r4=hdr, r6=stream. Steps: func_020603cc(s,stream,1) nonzero ->
 * return 4. func_020ab054(stream,tag,5) nonzero -> bail (ffd4+585d4,ret 3).
 * func_020602c4(stream,tag2,&buf,0x10) ==0 -> same bail. Then ctx =
 * func_020ace00(&buf). Stage hdr[0xc],hdr[0x10] into sp[8],sp[0xc]; if
 * hdr[0xc]==0 skip the alloc branch. Else node=func_020453e8(8); if NULL
 * log+return 1; node[1]=ctx; node[0]=0; sp[0]=hdr; sp[1word]=0;
 * func_02058528(s, sp[8], sp[0xc]) nonzero -> return its status. Finally
 * func_0205bd58(s,hdr); return 0. */

extern char data_02100d8c[];
extern char data_02100d94[];
extern char data_02100dc4[];
extern char data_02100dd0[];
extern void *func_020453e8(int size);
extern int  func_02058528(void *s, int a, int b);
extern void func_020585d4(void *s, int a, int b);
extern void func_0205bd58(void *s, void *hdr);
extern void func_0205ffc0(void *s, void *tag);
extern void func_0205ffd4(void *s, int code, void *tag);
extern int  func_020602c4(void *stream, void *tag, void *buf, int n);
extern int  func_020603cc(void *s, void *stream, int v);
extern int  func_020ab054(void *stream, void *tag, int n);
extern void *func_020ace00(void *buf);

typedef struct Hdr { char _pad[0x0c]; int fc; int f10; } Hdr;
typedef struct Node8 { void *f00; void *f04; } Node8;

int func_0205d7e4(void *s, Hdr *hdr, void *stream) {
    char buf[0x10];
    int sp0_pair[2];   /* sp[0]=hdr, sp[4]=0 */
    int a, b;          /* sp[8]=hdr->fc, sp[0xc]=hdr->f10 */
    void *ctx;
    Node8 *node;
    int rc;

    if (func_020603cc(s, stream, 1) != 0) return 4;

    if (func_020ab054(stream, data_02100d8c, 5) != 0) {
        func_0205ffd4(s, 1, data_02100d94);
        func_020585d4(s, 3, 1);
        return 3;
    }
    if (func_020602c4(stream, data_02100dc4, buf, 0x10) == 0) {
        func_0205ffd4(s, 1, data_02100d94);
        func_020585d4(s, 3, 1);
        return 3;
    }
    ctx = func_020ace00(buf);
    a = hdr->fc;
    b = hdr->f10;
    if (a != 0) {
        node = (Node8 *)func_020453e8(8);
        if (node == 0) {
            func_0205ffc0(s, data_02100dd0);
            return 1;
        }
        node->f04 = ctx;
        node->f00 = 0;
        sp0_pair[0] = (int)hdr;
        sp0_pair[1] = 0;
        if ((rc = func_02058528(s, a, b)) != 0)
            return rc;
    }
    func_0205bd58(s, hdr);
    return 0;
}
