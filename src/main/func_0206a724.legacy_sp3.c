#include "runtime/intrinsics.h"
typedef struct { char pad[0x4a8]; unsigned short kind; } Context;
void func_0206a724(Context *ctx, unsigned char *s, int n, void *value, unsigned short *kind) {
    unsigned char flags;
    if (n < 5) return;
    flags = *s;
    s++;
    __memcpy(value, s, 4);
    s += 4;
    n -= 5;
    if (flags & 0x10) {
        if (n < 2) return;
        __memcpy(kind, s, 2);
    } else {
        *kind = ctx->kind;
    }
}
