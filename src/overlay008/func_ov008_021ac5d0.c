typedef struct {
    unsigned int unused;
    unsigned int index : 3;
    unsigned int rest : 29;
} State;
extern State data_02104f4c;
extern void func_ov008_021ab484(int x, int y, int row, int col, int cell, int scale, int priority, int mode);

void func_ov008_021ac5d0(int x, int y, int mode) {
    unsigned int index = data_02104f4c.index;
    int variant;
    if (mode <= 1) return;
    if (index != 0) index--;
    switch (mode) {
    case 2:
        y += 4;
        variant = 0;
        break;
    case 3:
    case 4:
        x -= 3;
        variant = 1;
        break;
    }
    func_ov008_021ab484(x, y, 0, variant + (index * 2 + 2), 0, 2, 0x400, 0);
}
