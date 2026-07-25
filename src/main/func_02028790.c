/* func_02028790 -- C-34 re-audit (cm-parked-reaudit-2 batch B). Companion
 * "find or grow a free slot" allocator for the data_0219a92c pool (stride
 * 0x19c) that func_020285bc (shipped this session) inits/grows -- an
 * exact clone of func_020270d0's shape (data_0219a924/stride 0xe0,
 * shipped this session) for a different pool symbol/stride. Orig has two
 * distinct pool slots for data_0219a92c: slot A (`.count`) and slot B
 * (`.base`, address loaded unconditionally right after but only
 * dereferenced inside the `count > 0` guard) -- registered-alias lever
 * splits them, reusing the data_0219a92c_alias entry added this session
 * alongside func_020285bc's own fix (docs/research/codegen-walls.md
 * C-34). Later count re-checks reference the symbol directly rather than
 * a cached local (matches func_020270d0's confirmed-byte-exact recipe).
 */

typedef struct {
    void *base;    /* +0x0 */
    int   count;   /* +0x4 */
} pool_0219a92c_t;

extern pool_0219a92c_t data_0219a92c;
extern pool_0219a92c_t data_0219a92c_alias;   /* SAME address -- see symbols.txt */
extern void Fill32(int value, void *dest, int size);

void *func_02028790(void *arg0)
{
    pool_0219a92c_t *p = &data_0219a92c;
    int count = p->count;
    int i;

    p = &data_0219a92c_alias;
    i = 0;
    if (count > 0) {
        char *scan = (char *)p->base;
        do {
            if (*(void **)scan == 0) {
                break;
            }
            i++;
            scan += 0x19c;
        } while (i < data_0219a92c.count);
    }
    if (i >= data_0219a92c.count) {
        return 0;
    }
    {
        char *slot = (char *)p->base + i * 0x19c;
        Fill32(0, slot, 0x19c);
        *(void **)slot = arg0;
        return slot;
    }
}
