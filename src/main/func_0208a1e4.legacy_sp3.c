/* func_0208a1e4: resolve a node via func_0208938c, validate via
 * func_0208a09c, then dispatch to func_02089ee8 (odd a1) or func_02089024
 * (even a1), writing the result through an optional out-param.
 */

typedef struct {
    void *f_0;
    unsigned short f_4;
} node_t;

extern node_t *func_0208938c(int a0);
extern int func_0208a09c(int a, int b, int c, int d, int e);
extern int func_02089ee8(void *a, int b, int c);
extern int func_02089024(void *a);

int func_0208a1e4(int a0, int a1, int a2, int a3, int *outp) {
    node_t *n = func_0208938c(a0);
    if (n == 0) {
        return 2;
    }
    int result = func_0208a09c(n->f_4, a1, a2, a3, 0);
    if (result != 0) {
        return result;
    }
    int val;
    if (a1 & 1) {
        val = func_02089ee8(n->f_0, a2, a3);
        if (val == 0) {
            return 6;
        }
    } else {
        val = func_02089024(n->f_0);
    }
    if (outp != 0) {
        *outp = val;
    }
    return 0;
}
