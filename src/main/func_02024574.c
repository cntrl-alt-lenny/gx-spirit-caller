typedef struct {
    void *base;
    int count;
} Pool;

extern Pool data_0219a8ec;
/* Fill32 consumes r0-r2 despite its parameterless low-level definition. */
extern void Fill32(int value, void *dest, unsigned int size);

void *func_02024574(void *arg0)
{
    Pool *p = (Pool *)0x0219a8ec;
    Pool *q = p;
    int count = p->count;
    int i;

    p = &data_0219a8ec;
    i = 0;
    if (count > 0) {
        char *scan = (char *)p->base;
        do {
            if (*(void **)scan == 0) {
                break;
            }
            i++;
            scan += 0x16c;
        } while (i < q->count);
    }
    if (i >= q->count) {
        return 0;
    }
    {
        char *slot = (char *)p->base + i * 0x16c;
        Fill32(0, slot, 0x16c);
        *(void **)slot = arg0;
        return slot;
    }
}


