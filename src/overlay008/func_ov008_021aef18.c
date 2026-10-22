extern int func_0202224c(int idx);
extern int func_02022234(unsigned int idx, unsigned int v);
extern int func_020212cc(void *);
extern int func_ov008_021aedfc(int thr);
extern int func_ov008_021aee54(int thr);
extern char data_ov008_021b2eac[];
typedef struct { unsigned short a, b, flag; unsigned char pad[0xa4]; unsigned short tail; } State;
extern State data_ov008_021b2de4;
extern char data_ov008_021b27bc[];
void func_ov008_021aef18(void) {
    int row, index, bit; int *word; int value;
    func_02022234(0, func_0202224c(0) & ~2);
    func_020212cc(*(void **)(data_ov008_021b2eac + 8));
    row = func_ov008_021aedfc(data_ov008_021b2de4.a + data_ov008_021b2de4.b);
    index = func_ov008_021aee54(data_ov008_021b2de4.a + data_ov008_021b2de4.b);

    ((int *)(data_ov008_021b27bc + row * 52))[index / 32] |= 1 << (func_ov008_021aee54(data_ov008_021b2de4.a + data_ov008_021b2de4.b) % 32);
    data_ov008_021b2de4.flag = 1;
    data_ov008_021b2de4.tail = 0;
}







