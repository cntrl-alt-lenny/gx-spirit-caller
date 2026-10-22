/* The assembly IRQ primitive returns the saved mask in r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
typedef struct { unsigned int head, tail, size; unsigned char *buf; } ring_t;
typedef struct { unsigned char type, wrap; unsigned short length; } header_t;
void *func_0203244c(ring_t *r, unsigned int *length) {
    int saved;
    void *result;
    header_t *h;
    unsigned int head;
    if (r == 0) return 0;
    saved = OS_DisableIrq();
    if (r->head == r->tail) result = 0;
    else {
        for (;;) {
            h = (header_t *)(r->buf + r->head);
            if (h->wrap == 1) {
                result = 0;
                head = 0;
                r->head = head;
                if (r->tail == 0) break;
                h = (header_t *)(r->buf + (unsigned int)result);
            }
            *length = h->length;
            result = h + 1;
            break;
        }
    }
    OS_RestoreIrq(saved);
    return result;
}



