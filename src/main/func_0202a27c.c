/* func_0202a27c -- C-34 re-audit (cm-parked-reaudit-2 batch B). Companion
 * "find or grow a free slot" allocator for the data_0219a934 pool (stride
 * 0xec) -- same shape as func_020270d0 (data_0219a924/stride 0xe0), plus
 * an extra func_0202aa58(slot) callback after populating the slot. Orig
 * has two distinct pool slots for data_0219a934: slot A (`.count`) and
 * slot B (`.base`, address loaded unconditionally right after but only
 * dereferenced inside the `count > 0` guard) -- registered-alias lever
 * splits them, reusing the data_0219a934_alias entry already registered
 * in symbols.txt/BSS (docs/research/codegen-walls.md C-34). Later count
 * re-checks reference the symbol directly rather than a cached local
 * (matches func_020270d0's confirmed-byte-exact recipe).
 */

typedef struct {
    void *base;    /* +0x0 */
    int   count;   /* +0x4 */
} pool_0219a934_t;

extern pool_0219a934_t data_0219a934;
extern pool_0219a934_t data_0219a934_alias;   /* SAME address -- see symbols.txt */
extern void Fill32(int value, void *dest, int size);
extern void func_0202aa58(void *slot);

void *func_0202a27c(void *arg0)
{
    pool_0219a934_t *p = &data_0219a934;
    int count = p->count;
    int i;

    p = &data_0219a934_alias;
    i = 0;
    if (count > 0) {
        char *scan = (char *)p->base;
        do {
            if (*(void **)scan == 0) {
                break;
            }
            i++;
            scan += 0xec;
        } while (i < data_0219a934.count);
    }
    if (i >= data_0219a934.count) {
        return 0;
    }
    {
        char *slot = (char *)p->base + i * 0xec;
        Fill32(0, slot, 0xec);
        *(void **)slot = arg0;
        func_0202aa58(slot);
        return slot;
    }
}
