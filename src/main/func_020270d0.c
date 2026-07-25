/* func_020270d0 -- C-34 re-audit (cm-parked-reaudit-2 batch B). Companion
 * "find or grow a free slot" allocator for the data_0219a924 pool (stride
 * 0xe0) that func_02026fd8 (E-08, shipped) inits/grows. Same pool header
 * layout: { base@0x0; count@0x4 }. Orig has two distinct pool slots for
 * data_0219a924: slot A (`.count`) and slot B (`.base`, address loaded
 * unconditionally right after but only DEREFERENCED inside the
 * `count > 0` guard) -- registered-alias lever splits them, reusing the
 * data_0219a924_alias entry already registered in symbols.txt/BSS for
 * func_02026fd8's own fix (docs/research/codegen-walls.md C-34). The same
 * pointer variable is reassigned from the original symbol to the alias
 * between the two accesses (matching orig's single reused address
 * register r1); `i`'s zero-init is sequenced after that reassignment to
 * match orig's scheduling (loads early, the zero-immediate late). Later
 * count re-checks reference the symbol directly (m2c's own rendering of
 * the target does not cache it into a local either).
 */

typedef struct {
    void *base;    /* +0x0 */
    int   count;   /* +0x4 */
} pool_0219a924_t;

extern pool_0219a924_t data_0219a924;
extern pool_0219a924_t data_0219a924_alias;   /* SAME address -- see symbols.txt */
extern void Fill32(int value, void *dest, int size);

void *func_020270d0(void *arg0)
{
    pool_0219a924_t *p = &data_0219a924;
    int count = p->count;
    int i;

    p = &data_0219a924_alias;
    i = 0;
    if (count > 0) {
        char *scan = (char *)p->base;
        do {
            if (*(void **)scan == 0) {
                break;
            }
            i++;
            scan += 0xe0;
        } while (i < data_0219a924.count);
    }
    if (i >= data_0219a924.count) {
        return 0;
    }
    {
        char *slot = (char *)p->base + i * 0xe0;
        Fill32(0, slot, 0xe0);
        *(void **)slot = arg0;
        return slot;
    }
}
