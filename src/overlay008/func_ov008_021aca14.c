extern char data_ov008_021b2780[];
extern char data_ov008_021b2c80[];
extern int func_020b3870(int, int);
extern void func_ov008_021ab484(int x, int y, int row, int col, int cell, int scale, int priority, int mode);
void func_ov008_021aca14(int value, int max) {
    int x = 40;
    func_ov008_021ab484(27,126,0,0,21,2,1024,0);
    func_ov008_021ab484(19,126,0,0,(*(unsigned int *)(data_ov008_021b2780 + 0x634) & 16) ? 10 : 9,2,1024,0);
    func_ov008_021ab484(211,126,0,0,(*(unsigned int *)(data_ov008_021b2780 + 0x634) & 32) ? 12 : 11,2,1024,0);
    if (*(unsigned short *)(data_ov008_021b2c80 + 90) <= 6) return;
    if (value == 0) x = 40;
    else if (value == max) x = 190;
    else {
        x += func_020b3870(150 * value, max);
        if (x < 40) x = 40;
        else if (x > 190) x = 190;
    }
    func_ov008_021ab484(x,126,0,0,(*(unsigned int *)(data_ov008_021b2780 + 0x634) & 256) ? 18 : 17,2,1024,0);
}
