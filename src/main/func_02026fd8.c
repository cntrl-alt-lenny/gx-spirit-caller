/* func_02026fd8 — E-08, clone of E-07 (func_02023f7c) with data_0219a924
 * (stride 0xe0 replacing data_0219a8e4's 0x88). Pool header { base@0x0;
 * count@0x4 }: Fill32-clear the header, store the requested slot count,
 * and if no buffer allocated yet, allocate base = Task_PostLocked
 * (count*0xe0, 4, 0) and Fill32-clear the new buffer. Returns 1.
 *
 * C-34 candidate (docs/research/codegen-walls.md): orig pool has two
 * distinct .word data_0219a924 slots -- slot A (kept alive the whole
 * function) covers the Fill32 address arg plus the LATE `.count`
 * read / `.base` write; slot B (loaded fresh right after the first
 * Fill32 call) covers the EARLY `.count` write / `.base` read cluster.
 * Plain typed-struct member access still lets mwcc share ONE pool load
 * across both clusters (verified empirically -- same outcome as
 * func_02024024's plain-struct attempt). Using the C-27 alias recipe
 * (a new `data_0219a924_alias` extern, added to symbols.txt/BSS at the
 * identical address, mirroring the existing data_0219a8e4_alias /
 * data_0219a934_alias pattern already used for this exact shape in the
 * USA/JPN ports of a sibling function) forces the early cluster onto an
 * independent pool word.
 *
 * NOTE: func_02023f7c (E-07), the byte-identical-shape sibling this
 * function clones, is docs/research/codegen-walls.md's own canonical C-34
 * worked example and was proven un-crackable by plain C in brief 201
 * (bare extern, volatile, pointer-alias, all 3 compiler tiers, asm-void)
 * -- but brief 201's attempt list predates this alias-view recipe, which
 * is a distinct, later-established technique (see func_0202a1ec.c /
 * func_02023f98.c) rather than any of the specific forms brief 201 ruled
 * out.
 */

typedef struct {
    void *base;    /* +0x0 */
    int   count;   /* +0x4 */
} pool_0219a924_t;

extern pool_0219a924_t data_0219a924;
extern pool_0219a924_t data_0219a924_alias;   /* SAME address — see symbols.txt */
extern void Fill32(int v, void *dst, int size);
extern void *Task_PostLocked(int size, int align, int flags);

int func_02026fd8(int arg0) {
    pool_0219a924_t *a = &data_0219a924;

    Fill32(0, a, 8);
    data_0219a924_alias.count = arg0;
    if (data_0219a924_alias.base == 0) {
        int size = a->count * 0xe0;
        void *h = Task_PostLocked(size, 4, 0);
        a->base = h;
        Fill32(0, h, size);
    }
    return 1;
}
