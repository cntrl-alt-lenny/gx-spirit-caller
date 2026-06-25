/* CAMPAIGN-PREP candidate for func_0205c54c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload ctl->handle each call (no bind); packed Req struct u8@1/u16@2/u32@4; staged bail-returns
 *   risk:       struct-guessed + reshape-able: the packed stack Req (1/2/4-byte members at +1/+2/+4 with words at +0/+8) and the late branch chain (func_02054db8 == -1, then func_02054bfc in {-5,-0x19,-0x4b}) are only sketched; req fill/store-order and the final compare ladder need fleshing out and will likely differ first build.
 *   confidence: low
 */
/* func_0205c54c: device/stream open sequence with staged error bail-outs.
 * arg(r4) holds a control block: [0xc] cfg in, [0x8] handle out, [0]
 * status. Each stage that fails calls func_0205ffd4 + func_020585d4 and
 * returns 3; the final fall-through sets arg[0]=0x67 and returns 0. A
 * packed on-stack request struct is filled before func_02054db8: u8 @+1=2,
 * u16 @+2 = h->cfg->f14, u32 @+4 = h->cfg->f10, words @0/+8 left/zeroed.
 * arg[0x8] is RELOADED before every call (orig re-issues ldr [r4,#8]). */

extern char data_02100bc8[];
extern char data_02100be4[];
extern char data_02100c0c[];
extern char data_02100c40[];
extern int  func_02054bfc(int handle);
extern int  func_02054db8(int handle, void *req, int n);
extern int  func_02054e8c(int a, int b, int c);
extern int  func_02055250(int handle, int z);
extern void func_020585d4(void *s, int a, int b);
extern void func_0205c928(int handle);
extern int  func_0205d6bc(void *s, int cfg, void **outinfo);
extern void func_0205ffc0(void *s, void *tag);
extern void func_0205ffd4(void *s, int code, void *tag);

typedef struct Ctl { int f00; char _pad[0x08 - 0x04]; int handle; int cfg; } Ctl;
typedef struct Info { char _pad[0x08]; struct Sub *sub; } Info;
typedef struct Sub { char _pad[0x10]; int f10; int f14; } Sub;

typedef struct Req {
    char  b0[1];
    unsigned char  tag;   /* +0x1 = 2 */
    unsigned short h2;    /* +0x2 = sub->f14 */
    int   w4;             /* +0x4 = sub->f10 */
    int   w8;
} Req;

int func_0205c54c(void *s, Ctl *ctl) {
    Info *info;
    Req req;
    int rc;

    if (func_0205d6bc(s, ctl->cfg, (void **)&info) == 0) {
        func_0205ffc0(s, data_02100bc8);
        return 3;
    }
    ctl->handle = func_02054e8c(2, 1, 0);
    if (ctl->handle == -1) {
        func_0205ffd4(s, 5, data_02100be4);
        func_020585d4(s, 3, 0);
        return 3;
    }
    if (func_02055250(ctl->handle, 0) == 0) {
        func_0205ffd4(s, 5, data_02100c0c);
        func_020585d4(s, 3, 0);
        return 3;
    }
    func_0205c928(ctl->handle);
    req.w0_dummy0();
    return 0;
}
