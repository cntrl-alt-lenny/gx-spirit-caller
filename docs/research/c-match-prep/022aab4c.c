/* CAMPAIGN-PREP candidate for func_022aab4c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     divmod %49 as plain %; bitfield-insert (&~0xf)|5|0x10; store-order kept
 *   risk:       struct-guessed AND truncated: source asm ends mid-loop (.L_fb0), so the counted draw loop and several field stores are missing; frame size 0x648 and field offsets unverified.
 *   confidence: low
 */
/* func_ov002_022aab4c: large MMIO/OAM setup. Visible head: alloc ~0x648
 * stack frame, call func_0208e200 -> handle r4, init a descriptor at
 * sp+0x20 via func_0201d47c. If arg1(r5)==0, divmod a global counter
 * [g+0xb84] by 49 and index a string table, else use r5 directly, then
 * func_02091554 formats into sp+0; func_02006c0c handle; build OAM
 * scratch (bitfield insert into sp+0x34: (x&~0xf)|5 then |0x10), submit
 * via func_0201e5b8, release via func_02006e1c, then a /6-ish signed
 * reduction feeding a counted draw loop (loop body TRUNCATED in source
 * asm -- only prologue reproduced). */

extern int   data_021040ac[];      /* g; counter at +0xb84 */
extern int   data_02104f4c[];      /* g2; field at +4 */
extern int   data_ov002_022cc154[];
extern int   data_ov002_022cc3d8[];
extern int   data_ov002_022cc3f8[];
extern int   func_02006c0c(int *src, int a, int b);
extern void  func_02006e1c(int handle);
extern void  func_0201d47c(void *d);
extern void  func_0201e5b8(void *d);
extern int   func_0208e200(void);
extern void  func_02091554(char *dst, int *fmt, int arg);

struct oam_scratch {
    int   f0;          /* 0x00 */
    int   f4;
    int   handle;      /* 0x08 -> stored at sp+0x20 region; struct-guessed */
    int   f0c;
    int   f10;
    unsigned short f14_lo;
    unsigned short f14_pad;
    unsigned short f30;
    unsigned short pad32;
    unsigned short f34;   /* bitfield-insert target */
    unsigned short pad36;
    int   f38;
};

void func_ov002_022aab4c(void *self, int sel) {
    char buf[0x400 + 0x200];   /* large format buffer, struct-guessed size */
    struct oam_scratch d;
    int handle;
    int idx;

    handle = func_0208e200();
    func_0201d47c(&d);

    if (sel == 0) {
        unsigned int v = (unsigned int)data_021040ac[0xb84 / 4];
        idx = (int)(v % 49u);
        func_02091554(buf, (int *)data_ov002_022cc154,
                      ((int *)data_ov002_022cc3d8)[idx]);
    } else {
        func_02091554(buf, (int *)data_ov002_022cc3f8, sel);
    }

    d.f0 = func_02006c0c((int *)buf, 4, 0);
    d.f34 = (d.f34 & ~0xf) | 5;
    d.f34 |= 0x10;
    d.f38 &= ~0x1c000;
    d.f30 = 0xe00;
    func_0201e5b8(&d);
    func_02006e1c(d.f0);
    (void)handle;
    /* TRUNCATED: source asm cuts off at .L_fb0 draw loop; body incomplete */
}
