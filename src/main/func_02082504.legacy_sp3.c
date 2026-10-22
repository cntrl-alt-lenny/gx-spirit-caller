typedef long long s64;
typedef struct Blend Blend;
typedef struct Result {
    int flags;
    int a[3], b[3], c[3];
    int x[3], y[3], z[3];
    int pos[3];
} Result;
struct Blend {
    int unk0, weight, unk8;
    void (*callback)(Result *, Blend *, int);
    Blend *next;
    unsigned char pad[6];
    unsigned short entries[1];
};
extern void func_020827ec(int *a, int *b, int s, int flag);
/* The existing void wrapper discards the int returned by func_0208bed8;
 * this caller consumes that return value in the original assembly. */
extern int func_0208bfa8(int unused0, int unused1);
extern void func_0208c1a0(int *v, int *out);
extern void func_0208c348(int *a, int *b, int *out);
extern void func_02094504(int value, void *dst, int size);
int func_02082504(Result *out, Blend *node, int index)
{
    Result temp;
    Blend *p, *last;
    int total, count, scale;
    unsigned short entry;
    if (node->next == 0) {
        entry = node->entries[index];
        if ((entry & 0x300) != 0x100) return 0;
        node->callback(out, node, entry & 0xff);
        return 1;
    }
    total = 0;
    count = 0;
    p = node;
    do {
        if ((p->entries[index] & 0x300) == 0x100) {
            total += p->weight;
            last = p;
            count++;
        }
        p = p->next;
    } while (p != 0);
    if (total == 0) return 0;
    if (count == 1) {
        last->callback(out, last, last->entries[index] & 0xff);
        return 1;
    }
    func_02094504(0, out, 0x58);
    out->flags = -1;
    do {
        entry = node->entries[index];
        if ((entry & 0x300) == 0x100 && node->weight > 0) {
            node->callback(&temp, node, entry & 0xff);
            if (total == 0x1000) scale = node->weight;
            else scale = func_0208bfa8(node->weight, total);
            func_020827ec(out->a, temp.a, scale, temp.flags & 1);
            func_020827ec(out->b, temp.b, scale, temp.flags & 8);
            func_020827ec(out->c, temp.c, scale, temp.flags & 0x10);
            if (!(temp.flags & 4)) {
                out->pos[0] += (int)(((s64)scale * temp.pos[0]) >> 12);
                out->pos[1] += (int)(((s64)scale * temp.pos[1]) >> 12);
                out->pos[2] += (int)(((s64)scale * temp.pos[2]) >> 12);
            }
            if (!(temp.flags & 2)) {
                out->x[0] += (scale * temp.x[0]) >> 12;
                out->x[1] += (scale * temp.x[1]) >> 12;
                out->x[2] += (scale * temp.x[2]) >> 12;
                out->y[0] += (scale * temp.y[0]) >> 12;
                out->y[1] += (scale * temp.y[1]) >> 12;
                out->y[2] += (scale * temp.y[2]) >> 12;
            } else {
                out->x[0] += scale;
                out->y[1] += scale;
            }
            out->flags &= temp.flags;
        }
        node = node->next;
    } while (node != 0);
    func_0208c348(out->x, out->y, out->z);
    func_0208c1a0(out->x, out->x);
    func_0208c1a0(out->z, out->z);
    func_0208c348(out->z, out->x, out->y);
    return 1;
}

