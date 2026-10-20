extern int Task_PostLocked(void *arg0, int arg1, int arg2);
/* Fill32's assembly definition consumes value, destination and byte count. */
extern void Fill32(int value, void *dst, int size);
typedef struct { int kind; unsigned short a, b; void *x, *y, *z; } Entry;
typedef struct { int count; Entry **items; } List;
typedef struct { char pad[0x18]; int count; int offset; } Header;
typedef struct { int kind; unsigned short a, b; int x, y, z, pad; } Record;
List *func_0200ba00(Header *base)
{
    List *out;
    int count;
    int i;
    Record *src;
    out = (List *)Task_PostLocked((void *)8, 4, 0);
    if (out) {
        Fill32(0, out, 8);
        count = base->count;
        out->count = count;
        out->items = (Entry **)Task_PostLocked((void *)(count * 4), 4, 0);
        if (!out->items) goto failure;
        for (i = 0; i < count; i++) {
            out->items[i] = (Entry *)Task_PostLocked((void *)0x14, 4, 0);
            if (!out->items[i]) goto failure;
            Fill32(0, out->items[i], 0x14);
        }
        src = (Record *)((char *)base + base->offset);
        for (i = 0; i < count; i++, src++) {
            out->items[i]->kind = src->kind;
            if (src->kind) {
                out->items[i]->a = src->a;
                out->items[i]->b = src->b;
                out->items[i]->x = (void *)(src->x + (unsigned int)base);
                out->items[i]->y = (void *)(src->y + (unsigned int)base);
                out->items[i]->z = (void *)(src->z + (unsigned int)base);
            }
        }
    }
    return out;
failure:
    return 0;
}



