typedef unsigned char u8;
typedef struct { u8 pad[1]; u8 kind; u8 pad2; u8 len; u8 data[32]; } Out;
typedef struct { u8 pad[0x40]; u8 a[32]; u8 b[32]; u8 pad80[0x67]; u8 state; u8 pade8[0x18]; } Rec;
typedef struct { Rec rec[3]; Out out[6]; u8 pad3d8[0x934]; unsigned char select:4; unsigned char rest:4; } Game;
static inline int copy(Out *out, u8 *src, int kind) {
    u8 n = 0;
    while (n < 32) {
        if (src[n] == 0) break;
        out->data[n] = src[n];
        n++;
    }
    if (n != 0) {
        out->len = n;
        out->kind = kind;
        return 1;
    }
    return 0;
}
int func_0203df88(Game *g) {
    int i;
    u8 count = 0;
    Rec *rec = g->rec;
    i = 0;
    Out *out = g->out;
    for (; i < 3; i++, rec++) {
        if (g->select == 0 || g->select == i + 1) {
            if (rec->state != 0xff) {
                if (copy(out, rec->a, i)) { count++; out++; }
                if (rec->state == 1) {
                    if (copy(out, rec->b, i + 3)) { count++; out++; }
                }
            }
        }
    }
    return count;
}


