typedef struct {
    unsigned short pad[2];
    unsigned short value : 8;
    unsigned short upper : 8;
} State;
extern State data_ov008_021b2dc0;
extern unsigned short data_ov008_021b2c80[];
extern void func_ov008_021ac430(void);
extern void func_ov008_021ac4d0(int count, int direction);
void func_ov008_021acd04(int x) {
    int old = data_ov008_021b2dc0.value;
    int value = data_ov008_021b2c80[45] - 6;
    int now;
    int diff;
    int offset = x - 52;
    if (x < 52) value = 0;
    else if (x <= 202) value = offset * value / 150;
    data_ov008_021b2dc0.value = (unsigned short)value;
    now = data_ov008_021b2dc0.value;
    if (now == old) return;
    diff = now - old;
    if ((diff >= 0 ? diff : -diff) >= 8) {
        func_ov008_021ac430();
        return;
    }
    if (old < now) func_ov008_021ac4d0(diff, 1);
    else func_ov008_021ac4d0(old - now, 0);
}

