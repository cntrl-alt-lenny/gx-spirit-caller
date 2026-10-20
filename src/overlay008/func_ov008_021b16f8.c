typedef struct { char pad[0xa8]; unsigned short count; char pad2[0x16]; unsigned short *items; } State;
typedef struct { int head[10]; unsigned int bits[4]; } Row;
extern State data_ov008_021b2de4;
extern Row data_ov008_021b2780[];
extern void Task_InvokeLocked(void *p);
extern void func_0202ba94(int arg0, int arg1);
extern int func_0202bbec(int a, int b);
extern void func_ov008_021aa5f0(void);
extern int func_ov008_021aedfc(int thr);
extern void func_ov008_021b18a4(int param);
extern void func_ov008_021b1e0c(int x);
extern void func_ov008_021b22e4(int param);
void func_ov008_021b16f8(void) {
    int mask = 0;
    int i, j, n, v;
    Row *row;
    for (i = 0; i < data_ov008_021b2de4.count; i++) {
        mask |= 1 << func_ov008_021aedfc(i);
    }
    row = data_ov008_021b2780;
    for (i = 0; i < 26; i++, row = (Row *)((char *)row + 0x34)) {
        if (mask & (1 << i)) {
            unsigned int tmp[4] = {0, 0, 0, 0};
            n = 0;
            for (j = 0; j < 64; j++) {
                v = (row->bits[j / 16] >> ((j % 16) * 2)) & 3;
                if (v > 0) {
                    tmp[n / 16] |= v << ((n % 16) * 2);
                    n++;
                }
            }
            row->bits[0] = tmp[0];
            row->bits[1] = tmp[1];
            row->bits[2] = tmp[2];
            row->bits[3] = tmp[3];
        }
    }
    for (i = 0; i < data_ov008_021b2de4.count * 5; i++) {
        func_0202ba94(data_ov008_021b2de4.items[i], 1);
        func_0202bbec(data_ov008_021b2de4.items[i], 1);
    }
    Task_InvokeLocked(data_ov008_021b2de4.items);
    data_ov008_021b2de4.items = 0;
    func_ov008_021b22e4(0);
    func_ov008_021b18a4(0);
    func_ov008_021aa5f0();
    func_ov008_021b1e0c(data_ov008_021b2780[0].head[5]);
}
