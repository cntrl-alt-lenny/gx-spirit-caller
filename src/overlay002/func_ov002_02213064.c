typedef unsigned int u32;
typedef int s32;
struct Input { unsigned short card; unsigned short player:1; unsigned short rest:15; };
extern struct { char pad[0x5a8]; int state; } data_ov002_022ce288;
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern int func_ov002_021b4120(int arg0, int arg1, int arg2);
extern s32 func_ov002_021b9aa8(u32 a, u32 b);
extern int func_ov002_021d5c50(int arg0, int arg1, int unused2, int unused3);
extern void func_ov002_021d7970(void *arg0, int arg1, int arg2);
extern int func_ov002_021e06e4(int a, int b, int c);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c();
int func_ov002_02213064(struct Input *p) {
    int card, idx, result;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        func_ov002_021e06e4(1-p->player, 3, p->card);
        return 0x7f;
    case 0x7f:
        result = func_ov002_021b3ecc(1-p->player, 0xb, p->card);
        if (!result) return 0;
        func_ov002_021e2b3c(result);
        return 0x7e;
    case 0x7e:
        card = func_ov002_021b4120(1-p->player, 0xb, p->card);
        idx = func_ov002_021b9aa8(1-p->player, card);
        if (card > 0 && idx >= 0) {
            func_ov002_021d7970((void *)(1-p->player), idx, 1);
            func_ov002_021d5c50(1-p->player, 0xb, p->card, card);
            return 0x7e;
        }
        func_ov002_021e2c5c();
        return 0;
    }
    return 0;
}

