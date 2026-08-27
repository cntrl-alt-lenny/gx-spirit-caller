/* func_0208a0fc: resolve a node via func_020892a4, validate via
 * func_02089fb4, then dispatch to func_02089e00 (odd a1) or func_02088f3c
 * (even a1), writing the result through an optional out-param.
 */

typedef struct {
    void *f_0;
    unsigned short f_4;
} node_t;

extern node_t *func_020892a4(int a0);
extern int func_02089fb4(int a, int b, int c, int d, int e);
extern int func_02089e00(void *a, int b, int c);
extern int func_02088f3c(void *a);

int func_0208a0fc(int a0, int a1, int a2, int a3, int *outp) {
    node_t *n = func_020892a4(a0);
    if (n == 0) {
        return 2;
    }
    int result = func_02089fb4(n->f_4, a1, a2, a3, 0);
    if (result != 0) {
        return result;
    }
    int val;
    if (a1 & 1) {
        val = func_02089e00(n->f_0, a2, a3);
        if (val == 0) {
            return 6;
        }
    } else {
        val = func_02088f3c(n->f_0);
    }
    if (outp != 0) {
        *outp = val;
    }
    return 0;
}
