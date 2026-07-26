typedef struct {
    char pad[0x48c];
    void *field_48c;
} data_022ce288_t;
extern data_022ce288_t data_ov002_022ce288;

typedef struct {
    unsigned short bit0 : 1;
    unsigned short unused : 15;
} halfword_bit0_t;

extern int func_ov002_0225764c(void *p, int a, int sum);

int func_ov002_0222ca78(int a, int b, int c) {
    void *p = data_ov002_022ce288.field_48c;
    halfword_bit0_t *h = (halfword_bit0_t *)((char *)p + 2);
    if (a != h->bit0) {
        if (b == 0xb) {
            return 0x800;
        }
        if (b <= 0xa) {
            if (func_ov002_0225764c(p, a, b + c) != 0) {
                return 0x800;
            }
        }
    }
    return 0;
}
