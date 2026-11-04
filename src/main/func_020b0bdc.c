typedef unsigned char u8;
typedef signed short s16;

typedef struct Key {
    u8 pad0[2];
    s16 id;
    u8 len;
    u8 data[1];
} Key;

int func_020b0bdc(Key *a, Key *b)
{
    int i;
    int n;
    int lb;
    int la;

    if (a->data[0] == 0) {
        return b->data[0] != 0;
    }
    if (b->data[0] == 0) {
        return 0;
    }
    if (a->id == b->id) {
        la = a->len;
        lb = b->len;
        i = 0;
        n = la;
        if (la > lb) {
            n = lb;
        }
        for (; i < n; i++) {
            u8 y = b->data[i];
            u8 x = a->data[i];
            if (x < y) {
                return 1;
            }
            if (y < x) {
                return 0;
            }
        }
        if (n == la && i < lb) {
            do {
                if (b->data[i] != 0) {
                    return 1;
                }
                i++;
            } while (i < ((volatile Key *)b)->len);
        }
        return 0;
    }
    return a->id < b->id;
}
