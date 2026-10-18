typedef unsigned short u16;
typedef int s32;

typedef struct {
    u16 id;
    u16 flag : 1;
    u16 pad : 5;
    u16 kind : 6;
    u16 rest : 4;
} Card;

extern s32 func_ov002_021ca63c(s32 a, s32 b);
extern s32 func_ov002_022536e8(s32 a, s32 b, s32 c);

s32 func_ov002_02203d38(Card *p) {
    if (func_ov002_021ca63c(p->flag, 1) == 0) {
        return 0;
    }
    if (p->kind != 0x23) {
        if (func_ov002_022536e8(p->flag, p->id, 0) < 5) {
            return 0;
        }
    } else {
        if (func_ov002_022536e8(p->flag, p->id, 0) < 3) {
            return 0;
        }
    }
    return 1;
}
