typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Pair { u16 key; u16 val; } Pair;
typedef struct Rng { u16 base; u16 pad; u16 kind; u16 pad2[3]; u16 data[1]; } Rng;

u16 func_020801ac(Rng *r, u32 key)
{
    u16 res = 0xffff;
    switch (r->kind) {
    case 0:
        res = r->data[0] + (key - r->base);
        break;
    case 1:
        res = r->data[key - r->base];
        break;
    case 2: {
        u16 *d = r->data;
        Pair *lo = (Pair *)(d + 1);
        Pair *hi = lo + (d[0] - 1);
        while (lo <= hi) {
            Pair *mid = lo + (hi - lo) / 2;
            if (mid->key < key) {
                lo = mid + 1;
            } else if (key < mid->key) {
                hi = mid - 1;
            } else {
                res = mid->val;
                break;
            }
        }
        break;
    }
    }
    return res;
}
