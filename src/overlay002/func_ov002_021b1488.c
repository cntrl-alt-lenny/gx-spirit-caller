struct Control {
    unsigned int low : 15;
    signed int count : 4;
    unsigned int high : 13;
};
extern struct Control data_ov002_022cdc68;

void func_ov002_021b1488(int a, int b) {
    switch (a) {
    case 2: case 3: case 7: case 8:
    case 12: case 13: case 14: case 15: case 16: case 17:
    case 21: case 23: case 24: case 25: case 26: case 27:
    case 28: case 29: case 30: case 31:
        if (b != 0) {
            data_ov002_022cdc68.count++;
        } else {
            data_ov002_022cdc68.count--;
        }
        break;
    }
}
