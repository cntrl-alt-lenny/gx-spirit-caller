typedef struct {
    unsigned int low : 8;
    unsigned int state : 8;
    unsigned int high : 16;
} State;
typedef struct {
    unsigned char pad[0x18];
    State step;
} Control;
extern Control data_ov002_022cd300;
extern State data_ov002_022cd318;
extern unsigned int data_ov002_022ce288[];
extern int func_ov002_022465d4(void);
extern int func_ov002_021e4ba8(void);
extern int func_ov002_021e3dac(void);
extern int func_ov002_021e72a8(void);

int func_ov002_021e7418(void) {
    switch (data_ov002_022cd300.step.state) {
    case 0:
        if (data_ov002_022ce288[0x1a2] != 0)
            return func_ov002_022465d4();
        data_ov002_022cd300.step.state++;
    case 1:
        if (data_ov002_022ce288[0x168] != 0)
            return func_ov002_021e4ba8();
        data_ov002_022cd318.state++;
    case 2:
        if (data_ov002_022ce288[0x166] == 0 && data_ov002_022ce288[0x124] != 0)
            func_ov002_021e72a8();
        data_ov002_022cd318.state++;
    case 3:
        if (data_ov002_022ce288[0x166] != 0)
            return func_ov002_021e3dac();
        data_ov002_022cd318.state++;
    case 4:
        if (data_ov002_022ce288[0x168] != 0)
            return func_ov002_021e4ba8();
        data_ov002_022cd318.state++;
    }
    return 0;
}
