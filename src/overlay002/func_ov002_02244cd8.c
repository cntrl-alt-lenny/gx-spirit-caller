typedef unsigned short u16;
typedef unsigned int u32;
typedef int s32;

extern s32 func_ov002_021bc55c(s32 a, s32 b);

typedef struct {
    u16 pad0;
    u16 lo : 1;
    u16 v : 5;
    u16 hi : 10;
} Obj;

s32 func_ov002_02244cd8(Obj *obj, s32 a, s32 b) {
    s32 v;
    if (b > 4) {
        return 0;
    }
    v = obj->v;
    if (b == v - 1 || b == v + 1) {
        if (func_ov002_021bc55c(a, b) == 0) {
            return 0;
        }
        return 1;
    }
    return 0;
}
