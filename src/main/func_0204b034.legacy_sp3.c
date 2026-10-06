typedef struct {
    unsigned char active;          /* +0x00 */
    unsigned char _b1;
    unsigned char b_02;            /* +0x02 */
    unsigned char _b3;
    int _f4;
    int f_08;                      /* +0x08 */
    int f_0c;                      /* +0x0c */
    unsigned long long start_tick; /* +0x10 */
    unsigned long long tick;       /* +0x18 */
} Timer;

extern Timer *data_0219dc84;
extern unsigned long long func_020930b0(void);

void func_0204b034(int keep_start) {
    if (data_0219dc84 == 0) {
        return;
    }
    if (data_0219dc84->active == 0) {
        return;
    }
    data_0219dc84->f_08 = 0;
    data_0219dc84->f_0c = 0;
    data_0219dc84->b_02 = 0;
    data_0219dc84->tick = func_020930b0();
    if (keep_start != 0) {
        return;
    }
    data_0219dc84->start_tick = func_020930b0();
}
