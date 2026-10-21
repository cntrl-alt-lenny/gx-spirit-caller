extern int func_0202b6e4(int val, int *out, int max);
extern int func_0202bb20(int a);
extern int func_020b3870(int numerator, int denominator);
typedef struct {
    char pad0[0x10];
    unsigned short id;
    char pad12[2];
    int percent;
    char pad18[0x1c];
} Entry;
typedef struct {
    char pad[0x5a];
    unsigned short count;
} State;
extern Entry data_ov008_021b2780[];
extern State data_ov008_021b2c80;
void func_ov008_021aa5f0(void) {
    int list[60];
    int i, j, n;
    Entry *p;
    i = 0;
    if (i >= data_ov008_021b2c80.count) return;
    p = data_ov008_021b2780;
    do {
        n = 0;
        func_0202b6e4(p->id, list, 60);
        j = 0;
        while (list[j] != 0) {
            if (func_0202bb20(list[j]) != 0) n++;
            j++;
        }
        p->percent = j == 0 ? 0 : func_020b3870(n * 100, j);
        i++;
        p++;
    } while (i < data_ov008_021b2c80.count);
}






