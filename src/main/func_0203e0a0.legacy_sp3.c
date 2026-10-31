typedef unsigned char u8;
typedef struct { u8 pad[1]; u8 kind; u8 pad2; u8 len; u8 data[32]; } Out;
typedef struct { u8 pad[0x40]; u8 a[32]; u8 b[32]; u8 pad80[0x67]; u8 state; u8 pade8[0x18]; } Rec;
typedef struct { Rec rec[3]; Out out[6]; u8 pad3d8[0x934]; unsigned char select:4; unsigned char rest:4; } Game;
extern int func_0203df88(Game *g);
extern void func_02094688(void *src, void *dst, int n);
extern u8 data_020fe4c4[];
extern u8 data_020bec3c[];
int func_0203e0a0(Game *g) {
    int n;
    Out *out = g->out;
    n = func_0203df88(g);
    out += n;
    if (g->select == 0 || g->select == 4) {
        func_02094688(data_020fe4c4, out->data, 8);
        out->len = 8;
        out->kind = 6;
        n = (u8)(n + 1);
        out++;
    }
    if (g->select == 0 || g->select == 7) {
        func_02094688(data_020bec3c, out->data, 8);
        out->len = 8;
        out->kind = 9;
        n = (u8)(n + 1);
        out++;
    }
    if (g->select == 0 || g->select == 8) {
        func_02094688(data_020bec3c + 0x10, out->data, 0xb);
        out->len = 0xb;
        out->kind = 0xa;
        n = (u8)(n + 1);
    }
    return n;
}


