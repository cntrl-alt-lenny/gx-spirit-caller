struct Card {
    unsigned short id;
    unsigned short player : 1;
    unsigned short rest : 15;
};
extern struct { char pad[0x5a8]; int state; } data_ov002_022ce288;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021bc618(int arg0);
/* The original supplies only r0 to this four-parameter forwarding thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_0223f6c4(struct Card *a);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int arg0);
extern int func_ov002_0227adb8(int a, int b, int c, int d);

int func_ov002_0221d288(struct Card *a) {
    int v;
    int *p;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_021ca2b8(a->player) == 0) return 0;
        if (func_ov002_021bc618(a->player) == 0) return 0;
        if (a->id == 0x140b || a->id == 0x1a98) {
            if (func_ov002_0223f6c4(a) == 0) return 0;
        }
        v = func_ov002_0223f6c4(a);
        if (func_ov002_0225368c(a->player, a->id, v) == 0) {
            func_ov002_021ae400(a->player, 0xd);
            return 0x6e;
        } else {
            func_ov002_021ae400(a->player, 0x30);
            return 0x7f;
        }
    case 0x7f:
        v = func_ov002_0223f6c4(a);
        func_ov002_021af9d0(a->player, 6, a->id, v);
        return 0x7e;
    case 0x7e:
        p = func_ov002_021afb74();
        func_ov002_0227adb8(a->player, (int)p, 1, a->id << 16);
        return 0x64;
    case 0x6e:
        func_ov002_0226b054(1 - a->player);
        return 0x64;
    case 0x64:
        func_ov002_021e286c(a->player);
        return 0;
    }
    return 0;
}
