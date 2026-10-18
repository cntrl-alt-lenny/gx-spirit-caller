typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 f0;
    u16 side : 1;
    u16 pad2 : 5;
    u16 kind : 6;
    u16 pad3 : 4;
    u32 pad[4];
    u32 idx : 9;
    u32 pad4 : 1;
    u32 lim : 4;
    u32 pad5 : 5;
    u32 mode : 4;
    u32 flag : 1;
    u32 pad6 : 8;
} S;

typedef struct {
    u32 id : 13;
    u32 side : 1;
    u32 rest : 18;
} E;

extern int func_ov002_021b947c(int idx);
extern E *func_ov002_021c93f0(int b0, int b1, int hi);
extern int func_0202e234(int x);

int func_ov002_02201a6c(S *p) {
    if (p->kind == 0x16 || p->kind == 0x1b) {
        if (p->lim <= 4) {
            if (p->flag == 0 && p->mode == 0xe) {
                int v = func_ov002_021b947c(p->idx);
                u16 lo = (u16)v;
                int b1 = ((int)lo >> 8) & 0xff;
                u16 hi = (u16)((u32)v >> 16);
                E *e = func_ov002_021c93f0(v & 0xff, b1, (int)hi);
                if (e->side == p->side) {
                    if (func_0202e234(e->id) != 0)
                        return 1;
                }
            }
        }
    }
    return 0;
}
