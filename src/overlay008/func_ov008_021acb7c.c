typedef struct {
    unsigned short pad[2];
    unsigned short value : 8;
    unsigned short upper : 8;
} State;
extern State data_ov008_021b2dc0;
extern char data_021040ac[];
extern char data_ov008_021b2780[];
extern unsigned short data_ov008_021b2c80[];
extern void func_ov008_021ab484(int x, int y, int row, int col, int cell, int scale, int priority, int mode);
extern void func_ov008_021ac7f0(void);
extern void func_ov008_021abcdc(void);
extern void func_ov008_021aca14(int value, int max);
extern void func_ov008_021ac590(int a0);
void func_ov008_021acb7c(void) {
    int blink = (*(int *)(data_021040ac + 0x38) >> 4) & 1;
    func_ov008_021ac7f0();
    if (data_ov008_021b2dc0.value) {
        func_ov008_021ab484(1 - blink, 62, 0, 0, 31, 2, 1024, 0);
    }
    if (data_ov008_021b2c80[45] > 6 && data_ov008_021b2c80[45] - 6 > data_ov008_021b2dc0.value) {
        func_ov008_021ab484(blink + 239, 62, 0, 0, 32, 2, 1024, 0);
    }
    func_ov008_021ab484(46, 164, 0, 0, (*(unsigned int *)(data_ov008_021b2780 + 0x634) & 4) ? 3 : 2, 2, 1024, 0);
    func_ov008_021ab484(74, 164, 0, 0, (*(unsigned int *)(data_ov008_021b2780 + 0x634) & 8) ? 5 : 4, 2, 1024, 0);
    func_ov008_021aca14(data_ov008_021b2dc0.value, data_ov008_021b2c80[45] - 6);
    func_ov008_021ac590(data_ov008_021b2dc0.upper);
    func_ov008_021abcdc();
}
