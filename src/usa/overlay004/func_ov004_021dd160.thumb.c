#include "ov004_core.h"
#pragma thumb on

/* func_ov004_021dd160 — flag-gated record serializer (Thumb RE giant, brief 405).
 * arg0: [+0] u16 flags, [+0x116] status byte, [+0x117] output record buffer.
 * Sinks: 021dbe5c = header/init write; 021dbe68 = memcpy(dst,src,n);
 *        021dbd08 = strlen; 021dd350 = validate_printable_ascii (nonzero = bad). */

extern void func_ov004_021dbc48(void *dst, int b, int c);
extern void func_ov004_021dbc54(void *dst, const void *src, int n);
extern int  func_ov004_021dbaf4(const char *s);
extern int  func_ov004_021dd13c(const char *s, int n);

typedef struct {
    char _pad8[8];
    int  a;          /* +8  */
    int  b;          /* +12 */
} Hdr;

typedef struct {
    char _pad4[4];
    int  len;        /* +4  block-copy length */
    char name[1];    /* +8  name/payload string */
    /* blocks at +0x30/+0x70/+0xB0/+0xF0 reached via byte offsets */
} Rec;

extern char data_ov004_022913d0[];
extern char data_ov004_02291ad8[];
extern char data_ov004_02291c08[];
extern char data_ov004_02291d38[];
extern char data_ov004_02291da8[];

int func_ov004_021dd160(unsigned short *arg0) {
    char *out;
    Rec  *a;
    Rec  *b;
    Rec  *c;
    Rec  *d;
    Hdr  *h;

    out = (char *)arg0 + 0x117;
    a = (Rec *)data_ov004_02291ad8;
    b = (Rec *)data_ov004_02291c08;
    c = (Rec *)data_ov004_02291d38;
    d = (Rec *)data_ov004_02291da8;

    if (out == 0) return -1;

    h = (Hdr *)data_ov004_022913d0;
    *arg0 = (unsigned short)(h->a & h->b);
    func_ov004_021dbc48(out, 0, 0x154);

    if (*arg0 & 1) {
        func_ov004_021dbc54(out + 0,    (char *)a + 0x30, a->len);
        func_ov004_021dbc54(out + 6,    (char *)a + 0x70, a->len);
        func_ov004_021dbc54(out + 0x0C, (char *)a + 0xB0, a->len);
        func_ov004_021dbc54(out + 0x12, (char *)a + 0xF0, a->len);
        if (func_ov004_021dd13c(a->name, func_ov004_021dbaf4(a->name)) != 0) goto fail;
        func_ov004_021dbc54(out + 0x18, a->name, func_ov004_021dbaf4(a->name));
    }

    if (*arg0 & 2) {
        func_ov004_021dbc54(out + 0x39, (char *)b + 0x30, b->len);
        func_ov004_021dbc54(out + 0x47, (char *)b + 0x70, b->len);
        func_ov004_021dbc54(out + 0x55, (char *)b + 0xB0, b->len);
        func_ov004_021dbc54(out + 0x63, (char *)b + 0xF0, b->len);
        if (func_ov004_021dd13c(b->name, func_ov004_021dbaf4(b->name)) != 0) goto fail;
        func_ov004_021dbc54(out + 0x71, b->name, func_ov004_021dbaf4(b->name));
    }

    if (*arg0 & 4) {
        if (func_ov004_021dd13c((char *)c + 0x30, c->len - 1) != 0) goto fail;
        func_ov004_021dbc54(out + 0x92, (char *)c + 0x30, c->len);
        if (func_ov004_021dd13c(c->name, func_ov004_021dbaf4(c->name)) != 0) goto fail;
        func_ov004_021dbc54(out + 0xD2, c->name, func_ov004_021dbaf4(c->name));
    }

    if (*arg0 & 8) {
        if (func_ov004_021dd13c((char *)d + 0x30, d->len - 1) != 0) goto fail;
        func_ov004_021dbc54(out + 0xF3, (char *)d + 0x30, d->len);
        if (func_ov004_021dd13c(d->name, func_ov004_021dbaf4(d->name)) != 0) goto fail;
        func_ov004_021dbc54(out + 0x133, d->name, func_ov004_021dbaf4(d->name));
    }

    *((char *)arg0 + 0x116) = 0;
    return 0;

fail:
    func_ov004_021dbc48(out, 0, 0x154);
    return -1;
}
