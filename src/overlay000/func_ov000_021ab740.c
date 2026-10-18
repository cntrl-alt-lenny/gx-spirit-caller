struct State {
    unsigned low : 8;
    unsigned zero : 2;
    unsigned mode : 2;
    unsigned value : 8;
    unsigned : 12;
};
extern struct State data_ov000_021c7588[];
extern int func_020b3870(int, int);
extern void func_ov000_021ab8f8(void);
void func_ov000_021ab740(int a, int b) {
    unsigned address = (unsigned)data_ov000_021c7588;
    int result;
    ((struct State *)address)->low = 0xff;
    ((struct State *)address)->zero = 1;
    ((struct State *)address)->mode = a;
    result = func_020b3870((b >> 1) + 0xff, b);
    ((struct State *)address)->value = result;
    func_ov000_021ab8f8();
}
