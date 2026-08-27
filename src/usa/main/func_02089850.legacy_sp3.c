/* func_02089850: buffer-pool allocator initializer. Aligns `ptr` up to
 * a 4-byte boundary, verifies at least 0x10 bytes remain before `ptr +
 * size`, carves a sub-heap via func_0207da18 over the remainder, then
 * registers it via func_020896c8. Returns the aligned base pointer on
 * success, or 0 on any failure (rolling back via func_0207da0c if the
 * heap was created but registration failed). Mechanically guard-chain
 * shaped (three sequential bail-out checks) but functionally an
 * allocator-lifecycle routine, not a plain guard chain.
 */
extern void *func_0207da18(void *base, int size, int flags);
extern int func_020896c8(void *pool, void *heap);
extern void func_0207da0c(void *heap);

void *func_02089850(char *ptr, int size) {
    char *end = ptr + size;
    char *aligned = (char *)(((int)ptr + 3) & ~3);
    unsigned int avail;
    void *heap;

    if (aligned > end) {
        return 0;
    }

    avail = end - aligned;
    if (avail < 0x10) {
        return 0;
    }

    heap = func_0207da18(aligned + 0x10, avail - 0x10, 0);
    if (heap == 0) {
        return 0;
    }

    if (func_020896c8(aligned, heap) != 0) {
        return aligned;
    }

    func_0207da0c(heap);
    return 0;
}
