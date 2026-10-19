#include "runtime/intrinsics.h"
typedef unsigned char u8;
typedef unsigned int u32;
typedef struct { u8 b[6]; } Magic;
extern Magic data_020bee6c;
typedef struct {
    u8 pad[0xa0];
    void (*special)(u32, void *);
    void (*normal)(u8 *, int, void *);
    u8 pad2[0x64];
    void *user;
} Obj;
void func_02066650(Obj *o, u8 *data, int len) {
    Magic magic = data_020bee6c;
    int i;
    int match = 1;
    u8 *p = magic.b;
    u32 value;
    if (len >= 10) {
        for (i = 0; i < 6; i++, p++) {
            if (*p != data[i]) {
                match = 0;
                break;
            }
        }
    } else {
        match = 0;
    }
    if (match) {
        __memcpy(&value, data + 6, 4);
        if (o->special == 0) return;
        o->special(((value >> 24) & 0xff) | ((value >> 8) & 0xff00) |
                   ((value << 8) & 0xff0000) | ((value << 24) & 0xff000000), o->user);
    } else {
        if (o->normal == 0) return;
        o->normal(data, len, o->user);
    }
}



