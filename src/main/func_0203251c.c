extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern void func_02094688(const void *src, void *dst, unsigned int size);
typedef struct { unsigned int head, tail, size; unsigned char *buf; } ring_t;
typedef struct { unsigned char type, wrap; unsigned short length; } header_t;
int func_0203251c(ring_t *r, int type, const void *src, unsigned int length) {
    int saved, result;
    unsigned int tail, end, slot;
    if (r == 0) return -1;
    if (src == 0) return 0;
    slot = ((length + 3) & ~3u) + 4;
    if (r->size <= slot * 2) return -1;
    saved = OS_DisableIrq();
    tail = r->tail;
    result = 0;
    if (tail + slot > r->size) {
        if (tail + 4 <= r->size) {
            header_t *h = (header_t *)(r->buf + tail);
            h->type = 0;
            h->wrap = 1;
            h->length = 0;
        }
        tail = 0;
        if (slot > r->head) { result = -1; goto cleanup; }
    }
    end = tail + slot;
    if (tail < r->head && end > r->head) result = -1;
    else {
        header_t *h = (header_t *)(r->buf + tail);
        h->type = type;
        h->wrap = 0;
        h->length = length;
        func_02094688(src, h + 1, length);
        r->tail = end;
        if (end == r->size) r->tail = 0;
        else if (end == r->size) result = -1;
    }
cleanup:
    OS_RestoreIrq(saved);
    return result;
}
