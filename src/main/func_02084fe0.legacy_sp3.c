struct Buf { int count; int data[1]; };

extern struct Buf *data_021a4820;
extern int data_021a4824;

extern void func_02084fc8(void);
extern void func_020944ec(void *src, void *dst, int size);

void func_02084fe0(void)
{
    struct Buf *b;
    int n;
    if (data_021a4824 != 0) {
        func_02084fc8();
    }
    b = data_021a4820;
    if (b == 0) {
        return;
    }
    n = b->count;
    if (n == 0) {
        return;
    }
    func_020944ec(b->data, (void *)0x04000400, n * 4);
    data_021a4820->count = 0;
}
