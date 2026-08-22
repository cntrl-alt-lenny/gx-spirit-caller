typedef struct {
    char _pad_00[0x3c];
    int field_3c;
} State;

extern State data_ov010_021b8d08;
extern void func_0202af40(void);
extern void func_ov010_021b65e4(void);
extern void func_ov010_021b8608(void);
extern void func_02001ba4(void);
extern void func_02006918(void);

int func_ov010_021b3f50(void) {
    func_0202af40();
    switch (data_ov010_021b8d08.field_3c) {
    case 1:
        func_ov010_021b65e4();
        break;
    case 2:
        func_ov010_021b8608();
        break;
    case 3:
        break;
    }
    func_02001ba4();
    func_02006918();
    return 1;
}
