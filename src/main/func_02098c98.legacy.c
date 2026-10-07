typedef struct {
    int pad0;
    char *base;
    int start;
    int len;
} Region;

extern void func_020928cc(void *ptr, int size);
extern void func_02092940(void *ptr, int size);
extern void func_020945f4(void *dst, int val, int size);

void func_02098c98(Region *r) {
    char *base = r->base;
    int start = r->start;
    int end = start + r->len;
    func_02092940(base, end);
    func_020928cc(base, end);
    func_020945f4(base + start, 0, end - start);
}
