typedef struct { int values[20]; } AnimationTable;
extern const AnimationTable data_ov008_021b23e0;
extern int *data_ov008_021b270c;
extern int func_0208e1cc(void);

void func_ov008_021b1d08(int enabled) {
    AnimationTable table = data_ov008_021b23e0;
    int selected;
    unsigned short *dst;
    int row, col;

    selected = table.values[(unsigned int)(data_ov008_021b270c[9] / 4) % 20];
    dst = (unsigned short *)(func_0208e1cc() + 0x4f6);
    if (enabled == 0 || selected < 0) {
        for (row = 0; row < 3; row++) {
            for (col = 0; col < 5; col++) {
                *dst++ = 0;
            }
            dst += 27;
        }
    } else {
        enabled = selected * 15 + 0x290;
        for (row = 0; row < 3; row++) {
            for (col = 0; col < 5; col++) {
                *dst++ = enabled++ | 0x4000;
            }
            dst += 27;
        }
    }
}



