#include "runtime/intrinsics.h"
typedef struct { char data[0x800]; int len; } sbuf_02067294_t;
typedef struct { unsigned char data[256]; int len; } List;
typedef struct {
    char pad[0x88];
    void (*emit0)(int, sbuf_02067294_t *, int);
    void (*emit1)(int, int, sbuf_02067294_t *, int);
    void (*emit2)(int, int, sbuf_02067294_t *, int);
    void (*list)(int, List *, int);
    int (*count)(int, int);
    char pad2[0x70];
    int arg;
} Obj;
extern void func_02067294(sbuf_02067294_t *b, char *s);
extern char data_02101764[];
extern char data_0210176c[];
extern char *data_02101928[];
void func_02066ae8(Obj *o, sbuf_02067294_t *b, int mode, int len, unsigned char *s) {
    List list;
    unsigned short val;
    int count;
    int i, j, k, old;
    list.len = 0;
    if (len == 0) return;
    if ((unsigned int)(mode - 1) <= 1) {
        if (sizeof(b->data) - b->len < sizeof(val)) return;
        count = o->count(mode, o->arg);
        val = (((unsigned short)count >> 8) & 0xff) | (((unsigned short)count << 8) & 0xff00);
        __memcpy(b->data + b->len, &val, 2);
        b->len += 2;
    } else count = 1;
    if (len == 0xff) {
        o->list(mode, &list, o->arg);
        for (k = 0; k < list.len; k++) {
            char *p = data_02101928[list.data[k]];
            func_02067294(b, p == 0 ? data_02101764 : p);
            if (mode == 0) {
                old = b->len;
                o->emit0(list.data[k], b, o->arg);
                if (old == b->len) func_02067294(b, data_0210176c);
            }
        }
        if (0x800 - b->len < 1) return;
        b->data[b->len++] = 0;
        len = list.len;
        s = list.data;
        if (mode == 0) return;
    }
    for (i = 0; i < count; i++) {
        for (j = 0; j < len; j++) {
            old = b->len;
            if (mode == 0) o->emit0(s[j], b, o->arg);
            else if (mode == 1) o->emit1(s[j], i, b, o->arg);
            else if (mode == 2) o->emit2(s[j], i, b, o->arg);
            if (old == b->len) func_02067294(b, data_0210176c);
        }
    }
}

