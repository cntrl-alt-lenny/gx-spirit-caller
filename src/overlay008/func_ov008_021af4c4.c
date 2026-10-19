typedef struct {
    unsigned int pad[8];
    unsigned int bits[2];
    unsigned int tail[3];
} Entry;
extern Entry data_ov008_021b2780[];
extern unsigned int data_ov008_021b27a8[][13];
extern int func_ov008_021aedfc(int thr);
extern int func_ov008_021aee54(int thr);

int func_ov008_021af4c4(int arg) {
    int row = func_ov008_021aedfc(arg);
    int nth = func_ov008_021aee54(arg);
    int i;
    int count = 0;
    unsigned int result;
    unsigned int value;
    for (i = 0; i < 64; i++) {
        if (data_ov008_021b2780[row].bits[i / 32] & (1 << (i % 32))) {
            if (count == nth) break;
            count++;
        }
    }
    result = data_ov008_021b27a8[row][i / 16] >> ((i % 16) * 2);
    data_ov008_021b27a8[row][i / 16] &= ~(3 << ((i % 16) * 2));
    result &= 3;
    if (result == 0) result++;
    return result;
}
