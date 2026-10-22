#include "runtime/intrinsics.h"
typedef struct { char pad[8]; int f8; unsigned short fc; } obj_020684b4_t;
typedef struct { char pad[0x18]; int table; } rec_02068b54_t;
typedef struct { int name, kind; } Entry;
typedef struct { int f0, f4; char *entries; char pad[0x78]; int strings[0x100]; char pad2[0x24]; unsigned short kind; } Context;
extern void *func_020540d0(char *s, int index);
extern int func_02054140(void *p);
extern unsigned char func_0206849c(void *p);
extern void func_020684a4(void *p, unsigned char value);
extern void func_020684ac(void *p, int value);
extern void func_020684b4(obj_020684b4_t *p, int a, unsigned short b);
extern void func_020684c0(void *p, unsigned char value);
/* Original caller supplies r2 although the current C callee ignores it. */
extern void func_02068b1c(void *p0, void *p1, int value);
extern void func_02068b54(rec_02068b54_t *rec, int name, int value);
extern int func_020aaddc(const char *s);

int func_0206a44c(Context *ctx, void *rec, unsigned char *s, int n, int indexed) {
    int original = n;
    unsigned char flags = *s;
    int value;
    unsigned short number;
    unsigned short kind;
    int count, i;
    func_020684c0(rec, flags);
    s += 5; n -= 5;
    if (flags & 0x10) { s += 2; n -= 2; }
    if (flags & 2) {
        __memcpy(&value, s, 4);
        s += 4; n -= 4;
    } else value = 0;
    if (flags & 0x20) {
        __memcpy(&kind, s, 2);
        s += 2; n -= 2;
    } else kind = ctx->kind;
    func_020684b4(rec, value, kind);
    if (flags & 8) {
        __memcpy(&value, s, 4);
        s += 4; n -= 4;
        func_020684ac(rec, value);
    }
    if (flags & 0x40) {
        count = func_02054140(ctx->entries);
        for (i = 0; i < count; i++) {
            Entry *entry = func_020540d0(ctx->entries, i);
            switch (entry->kind) {
            case 1:
                func_02068b1c(rec, (void *)entry->name, *s);
                s++; n--;
                break;
            case 2:
                __memcpy(&number, s, 2);
                func_02068b1c(rec, (void *)entry->name, (unsigned short)(((number >> 8) & 0xff) | ((number << 8) & 0xff00)));
                s += 2; n -= 2;
                break;
            case 0: {
                int c;
                if (indexed) { c = *s++; n--; } else c = 0xff;
                if (c == 0xff) {
                    int length;
                    func_02068b54(rec, entry->name, (int)s);
                    length = func_020aaddc((char *)s) + 1;
                    s += length; n -= length;
                } else func_02068b54(rec, entry->name, ctx->strings[c]);
                break;
            }
            }
        }
        func_020684a4(rec, func_0206849c(rec) | 1);
    }
    if (flags & 0x80) {
        while (*(signed char *)s != 0 && n > 0) {
            unsigned char *name = s;
            int length = func_020aaddc((char *)s) + 1;
            s += length; n -= length;
            func_02068b54(rec, (int)name, (int)s);
            length = func_020aaddc((char *)s) + 1;
            s += length; n -= length;
        }
        n--;
        func_020684a4(rec, func_0206849c(rec) | 2);
    }
    return original - n;
}




