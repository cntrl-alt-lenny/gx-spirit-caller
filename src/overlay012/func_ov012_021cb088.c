typedef unsigned int u32;
typedef struct {
    char pad[0x148];
    int x, y;
    char pad150[0x10];
    u32 selection:4; u32 rest160:28;
    u32 active:8; u32 rest164:24;
    u32 low168:16; u32 count:8; u32 hi168:8;
} State;
typedef struct { unsigned char map[6][4]; } Nav;
typedef struct { char pad[0x19c]; u32 mode:4; u32 rest:28; } Context;
extern State data_ov012_021cc6dc;
extern Nav data_ov012_021cc108;
extern Context data_ov012_021cc6a0;
extern unsigned short data_02104bac[];
extern unsigned int func_0200617c(void);
extern void *func_ov012_021caf44(void);
extern void func_02006110(int *, int *);
extern int func_ov012_021ca36c(int x, int y);
extern int func_02037208(int a0, int r1, int r2, int r3);
void func_ov012_021cb088(void) {
    State *p = &data_ov012_021cc6dc;
    Nav nav = data_ov012_021cc108;
    int x, y;
    if (func_0200617c() && !func_ov012_021caf44()) {
        int hit;
        func_02006110(&x, &y);
        x += p->x >> 12;
        y += p->y >> 12;
        hit = func_ov012_021ca36c(x, y);
        if (!p->selection) return;
        if (p->selection != hit) return;
        p->active = 1;
        p->count++;
        if (data_ov012_021cc6a0.mode == 1)
            func_02037208(0x53, -1, 0, 1);
        else
            func_02037208(0x3a, -1, 0, 1);
    } else {
        unsigned int keys = data_02104bac[0x2a];
        if (keys & 0xf0) {
            if (!p->selection) p->selection = 1;
            else if (keys & 0x40) p->selection = nav.map[p->selection][-4];
            else if (keys & 0x80) p->selection = nav.map[p->selection][-3];
            else if (keys & 0x10) p->selection = nav.map[p->selection][-2];
            else if (keys & 0x20) p->selection = nav.map[p->selection][-1];
            func_02037208(0x38, -1, 0, 1);
        } else {
            if (!(keys & 1)) return;
            if (!p->selection) return;
            p->active = 1;
            p->count++;
            if (data_ov012_021cc6a0.mode == 1)
                func_02037208(0x53, -1, 0, 1);
            else
                func_02037208(0x3a, -1, 0, 1);
        }
    }
}


