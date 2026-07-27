typedef struct {
    unsigned short bit0 : 1;
    unsigned short unused : 15;
} halfword2_t;

typedef struct {
    unsigned short unused1 : 6;
    unsigned short field9 : 9;
    unsigned short unused2 : 1;
} halfword4_t;

extern int func_ov002_021ff05c(int bit0, int one1, int field, int zero, int one2);
extern int func_ov002_021ff230(void *a, int b);
extern int func_ov002_021ff310(void *a, int b);

int func_ov002_0220aeac(void *a, int b) {
    halfword2_t *h2 = (halfword2_t *)((char *)a + 2);
    halfword4_t *h4 = (halfword4_t *)((char *)a + 4);
    int bit0 = h2->bit0;
    int field = h4->field9;
    if (func_ov002_021ff05c(bit0, 1, field, 0, 1) == 0) {
        return 0;
    }
    if (func_ov002_021ff230(a, b) == 0) {
        return 0;
    }
    return func_ov002_021ff310(a, b);
}
