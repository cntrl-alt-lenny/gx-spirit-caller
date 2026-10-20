extern char data_ov008_021b2780[];
typedef struct { unsigned short first; char pad[166]; unsigned short count; } State;
extern State data_ov008_021b2de4;
extern int func_ov008_021aedfc(int thr);
extern int func_ov008_021aee54(int thr);
extern void func_ov008_021aefd4(int row, int slot);
extern void func_ov008_021af0a8(int index, int slot);
void func_ov008_021af338(void) {
    unsigned short start, slot;
    int count, i, n, bit, row;
    if (data_ov008_021b2de4.first == 0) {

        for (i = 0; i < 4; i++) {

            func_ov008_021aefd4(func_ov008_021aedfc(i), i);
            bit = func_ov008_021aee54(i);
            row = func_ov008_021aedfc(i);
            if (((unsigned int *)(data_ov008_021b2780 + row * 52 + 60))[func_ov008_021aee54(i) / 32] & (1 << (bit % 32))) {
                func_ov008_021af0a8(i, i);
            }
        }
    } else {
        start = data_ov008_021b2de4.first - 1;
        n = data_ov008_021b2de4.count - start;



        if (n > 5) n = 5;
        count = (unsigned short)n;
        i = 0;
        while (i < count) {
            slot = start % 5;

            func_ov008_021aefd4(func_ov008_021aedfc(start), slot);
            bit = func_ov008_021aee54(start);
            row = func_ov008_021aedfc(start);
            if (((unsigned int *)(data_ov008_021b2780 + row * 52 + 60))[func_ov008_021aee54(start) / 32] & (1 << (bit % 32))) {
                func_ov008_021af0a8(start, slot);
            }
            start++;
            i++;
        }
    }
}






