/* func_0209e694: fetch the singleton node via func_0209dbb4; bail with
 * func_0209db98's own result if it's already signalled, or with 6 if
 * the caller passed no buffer. Otherwise notify + block-copy the
 * node's field_4 buffer into the caller's buffer.
 */

typedef struct {
    char _pad_0[4];
    int *field_4;
} Node_0209e788;

extern void *func_0209dbb4(void);
extern int   func_0209db98(void);
extern int   func_020927e4(int p, int k);
extern void  func_0209445c(int *src, int *dst, unsigned int count);

int func_0209e694(int *buf) {
    Node_0209e788 *node = (Node_0209e788 *)func_0209dbb4();
    int r = func_0209db98();

    if (r != 0) {
        return r;
    }
    if (buf == 0) {
        return 6;
    }
    func_020927e4((int)node->field_4, 0x7c0);
    func_0209445c(node->field_4, buf, 0x7c0);
    return 0;
}
