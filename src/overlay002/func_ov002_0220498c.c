typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 id;
    u16 a : 1;
    u16 b : 5;
    u16 type : 6;
    u16 c : 4;
    u32 pad[4];
    u32 lo : 16;
    u32 f16 : 1;
    u32 d : 4;
    u32 f21 : 1;
    u32 e : 10;
} Entry;

int func_ov002_0220498c(Entry *a, Entry *b) {
    if (b != 0 && b->id != a->id) {
        return 0;
    }
    if (a->type == 14) {
        if (a->f16 != 1 - a->a) {
            return 0;
        }
        if (a->f21 != a->a) {
            return 0;
        }
        return a->lo >= 2000;
    }
    return 0;
}
