typedef struct {
    unsigned short first, selected, active;
    char pad[0xa2];
    unsigned short count;
} State;
extern State data_ov008_021b2de4;
extern unsigned int data_ov008_021b27bc[][13];
extern void func_ov008_021ac06c(int x, int *out, int a2);
extern int func_ov008_021aedfc(int thr);
extern int func_ov008_021aee54(int thr);
extern void func_ov008_021af154(int count, int direction);
extern void func_ov008_021af338(void);
void func_ov008_021b03b8(int x) {
    int pos = data_ov008_021b2de4.first;
    int old, delta;
    int bit, row, word;
    func_ov008_021ac06c(x, &pos, data_ov008_021b2de4.count - 3);
    if (pos == data_ov008_021b2de4.first) return;
    old = data_ov008_021b2de4.first;
    data_ov008_021b2de4.first = pos;
    pos = old;
    delta = data_ov008_021b2de4.first - pos;
    if ((delta >= 0 ? delta : -delta) >= 5) {
        func_ov008_021af338();
    } else if (data_ov008_021b2de4.first > pos) {
        func_ov008_021af154(delta, 1);
    } else {
        func_ov008_021af154(pos - data_ov008_021b2de4.first, 0);
    }
    bit = func_ov008_021aee54(data_ov008_021b2de4.first + data_ov008_021b2de4.selected);
    row = func_ov008_021aedfc(data_ov008_021b2de4.first + data_ov008_021b2de4.selected);
    word = func_ov008_021aee54(data_ov008_021b2de4.first + data_ov008_021b2de4.selected);
    if ((data_ov008_021b27bc[row][word / 32] & (1 << (bit % 32))) == 0)
        data_ov008_021b2de4.active = 0;
}

