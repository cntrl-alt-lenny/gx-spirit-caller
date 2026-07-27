typedef struct {
    unsigned short bit0 : 1;
    unsigned short field : 5;
    unsigned short rest : 10;
} data_field_t;

extern int func_ov002_021b3878(int bit0, int field);
extern int func_ov002_021bcf50(int bit0);
extern int func_ov002_021ff230(void *a, int b);

int func_ov002_021ffeb8(void *a, int b) {
    data_field_t *f = (data_field_t *)((char *)a + 2);
    int bit0 = f->bit0;
    int field = f->field;
    if (func_ov002_021b3878(bit0, field) != 0xffff) {
        return 0;
    }
    if (func_ov002_021bcf50(bit0) == -1) {
        return 0;
    }
    return func_ov002_021ff230(a, b);
}
