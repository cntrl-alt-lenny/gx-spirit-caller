/* data_021a4824 is volatile because the original reloads it at each of three
 * tests; a plain int is CSE'd by both compiler tiers and no longer matches. */
struct Buf { int count; int data[1]; };

extern struct Buf *data_021a4820;
extern volatile int data_021a4824;

extern void func_02084fc8(void);
extern void func_02084fe0(void);
extern void func_020944ec(void *src, void *dst, int size);
extern void func_02094550(void *src, void *dst, int size);

void func_02084e0c(int cmd, void *src, int n)
{
    if (data_021a4820 != 0) {
        if (data_021a4824 != 0) {
            int idx = data_021a4820->count;
            if ((unsigned)(idx + 1 + n) <= 0xc0) {
                data_021a4820->count = idx + 1;
                data_021a4820->data[idx] = cmd;
                if (n == 0) {
                    return;
                }
                func_02094550(src, &data_021a4820->data[data_021a4820->count], n * 4);
                data_021a4820->count += n;
                return;
            }
        }
        if (data_021a4820->count != 0) {
            func_02084fe0();
        } else if (data_021a4824 != 0) {
            func_02084fc8();
        }
    } else if (data_021a4824 != 0) {
        func_02084fc8();
    }
    *(int *)0x04000400 = cmd;
    func_020944ec(src, (void *)0x04000400, n * 4);
}
