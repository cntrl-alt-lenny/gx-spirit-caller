extern int Task_PostLocked(void *arg0, int arg1, int arg2);
/* Fill32 consumes three argument registers despite its assembly-only definition. */
extern void Fill32(int value, void *dst, int size);
typedef struct { int kind; unsigned short a, b; void *x, *y; } Entry;
typedef struct { int count; Entry **items; } List;
typedef struct { char pad[0x18]; int count; int offset; } Header;
typedef struct { int kind; unsigned short a, b; int x, y; } Record;
List *func_0200bb5c(Header *base)
{
    List *out;
    int count;
    int i;
    Record *src;
    Record *cursor;
    out = (List *)Task_PostLocked((void *)8, 4, 0);
    if (out) {
        Fill32(0, out, 8);
        count = base->count;
        out->count = count;
        out->items = (Entry **)Task_PostLocked((void *)(count * 4), 4, 0);
        if (!out->items) goto failure;
        for (i = 0; i < count; i++) {
            out->items[i] = (Entry *)Task_PostLocked((void *)0x10, 4, 0);
            if (!out->items[i]) goto failure;
            Fill32(0, out->items[i], 0x10);
        }
        src = (Record *)((char *)base + base->offset);

        for (i = 0; i < count; i++) {
            cursor = &src[i];
            out->items[i]->kind = src[i].kind;
            if (src[i].kind) {
                out->items[i]->a = cursor->a;
                out->items[i]->b = cursor->b;
                out->items[i]->x = (void *)(cursor->x + (unsigned int)base);
                out->items[i]->y = (void *)(cursor->y + (unsigned int)base);
            }
        }
    }
    return out;
failure:
    return 0;
}



