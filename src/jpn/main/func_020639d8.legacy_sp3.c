/* func_020639d8: reset a0's queue for a2, iterate its `count` items,
 * bump each qualifying item's f_0 down by a1->f_4 and track a (dead,
 * never read back) running max of f_0+f_4, then flush via func_020612c8.
 */

typedef struct {
    int f_0;
    int f_4;
} pair_t;

typedef struct {
    int f_0;
    int f_4;
} item_t;

typedef struct {
    char _pad0[0x44];
    char f_44[0x18];
    int f_5c;
} s_02063a4c_t;

extern void func_02053de4(int a, int b);
extern int func_020540cc(int a);
extern item_t *func_0205405c(int a, int idx);
extern void func_020612c8(void *dst, int a, int b);

void func_020639d8(s_02063a4c_t *a0, pair_t *a1, int a2) {
    int max = 0;
    int a1_f0 = a1->f_0;
    int a1_f4 = a1->f_4;
    func_02053de4(a0->f_5c, a2);
    int count = func_020540cc(a0->f_5c);
    for (int i = 0; i < count; i++) {
        item_t *p = func_0205405c(a0->f_5c, i);
        if (p->f_0 > a1_f0) {
            p->f_0 = p->f_0 - a1_f4;
            int sum = p->f_0 + p->f_4;
            if (max <= sum) {
                max = sum;
            }
        }
    }
    func_020612c8(a0->f_44, a1_f0, a1_f4);
}
