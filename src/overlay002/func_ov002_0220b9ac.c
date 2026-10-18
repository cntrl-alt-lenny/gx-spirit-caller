typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 id;
    u16 a : 1;
    u16 b : 5;
    u16 type : 6;
    u16 c : 4;
    u32 pad[4];
    u32 lo : 9;
    u32 f9 : 1;
    u32 d : 4;
    u32 p14 : 1;
    u32 f15 : 1;
    u32 p16 : 1;
    u32 f17 : 1;
    u32 p18 : 1;
    u32 e : 4;
    u32 f23 : 1;
    u32 hi : 8;
} Entry;

int func_ov002_0220b9ac(Entry *a) {
    if (a->type == 22 || a->type == 27) {
        if (a->f9 == a->a && a->d <= 4 && a->f23 == 0 && a->f17 != 0 && a->f15 != 0 && a->e == 14) {
            return 1;
        }
    }
    return 0;
}
