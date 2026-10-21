typedef struct { unsigned short count; } state_0201ef3c_t;
typedef struct {
    state_0201ef3c_t *state;
    int pad4;
    void *task;
    void *tasks[2];
} Entry;
typedef struct { int pad0; Entry entries[4]; } State;
extern int func_ov014_021b3fc4(State *p);
extern int func_ov014_021b280c(void *p);
extern void func_02001ba4(void);
extern int func_02005c60(int kind);
extern void func_02006918(void);
extern void func_0202af40(void);
extern void func_0202c1ac(void);
extern int func_ov005_021ad030(int a, int b);
extern char data_ov014_021b5040[];
extern char data_ov014_02235094[];
extern State data_ov014_022350f4;
extern char data_ov014_021b5088[];

int func_ov014_021b2644(void) {
    *(volatile unsigned int *)0x04000000 &= ~0x1f00;
    *(volatile unsigned int *)0x04001000 &= ~0x1f00;
    if (*(int *)(data_ov014_021b5040 + 0x44) == 0) {
        func_ov014_021b280c(data_ov014_02235094);
        func_ov014_021b3fc4(&data_ov014_022350f4);
    }
    func_02005c60(2);
    func_02005c60(1);
    func_02001ba4();
    if (*(int *)(data_ov014_02235094 + 0x2c) != 0) {
        func_ov005_021ad030((int)data_ov014_021b5088, 0x80000);
        *(int *)data_ov014_021b5040 = 3;
    } else {
        func_0202c1ac();
        func_0202af40();
        func_02006918();
    }
    return 1;
}
