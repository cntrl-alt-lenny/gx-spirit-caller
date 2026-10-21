extern unsigned int func_ov008_021aa4a0(unsigned int x);
typedef struct {
    char pad0[8];
    unsigned short count;
    char pad1[6];
    unsigned int a;
    unsigned int b;
    char pad2[28];
} Item;
typedef struct { char pad[6]; unsigned short lo : 8; unsigned short hi : 8; } Selection;
typedef struct { char pad[12]; unsigned int a; unsigned int b; } Special;
extern Item data_ov008_021b2790[];
extern Selection data_ov008_021b2dc0;
extern Special data_ov008_021b2dc8;
int func_ov008_021ada0c(void) {
    int i;
    int sum = 0;
    int n;
    Item *p = data_ov008_021b2790;
    int a, b;
    for (i = 0; i < 26; i++, p++) {
        n = p->count;
        if (i == data_ov008_021b2dc0.lo) {
            a = func_ov008_021aa4a0(data_ov008_021b2dc8.a);
            b = func_ov008_021aa4a0(data_ov008_021b2dc8.b);
        } else {
            a = func_ov008_021aa4a0(p->a);
            b = func_ov008_021aa4a0(p->b);
        }
        a += b;
        sum += a * n;
    }
    return sum;
}




