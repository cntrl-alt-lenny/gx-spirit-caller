typedef unsigned short u16;
typedef unsigned char u8;
typedef unsigned int u32;

struct node {
    char _pad[6];
    u16 cnt;
};

extern u16 func_ov002_0223de94(struct node *n, int i);

int func_ov002_0223e1b4(struct node *n, u32 a, u32 b) {
    int i;
    u16 key;
    u8 lo, hi;
    i = 0;
    if ((int)((u32)(n->cnt << 24) >> 24) > 0) {
        lo = a;
        hi = b;
        key = (u16)(lo | (hi << 8));
        do {
            if (key == func_ov002_0223de94(n, i)) {
                return 1;
            }
            i++;
        } while (i < (int)((u32)(n->cnt << 24) >> 24));
    }
    return 0;
}
