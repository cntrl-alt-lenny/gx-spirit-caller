typedef struct {
    char _pad_00[0x3c];
    int field_3c;
} State;

extern State data_ov010_021b8c08;
extern void func_0202aeec(void);
extern void func_ov010_021b64e4(void);
extern void func_ov010_021b8508(void);
extern void func_02001b84(void);
extern void func_020068fc(void);

int func_ov010_021b3e50(void) {
    func_0202aeec();
    switch (data_ov010_021b8c08.field_3c) {
    case 1:
        func_ov010_021b64e4();
        break;
    case 2:
        func_ov010_021b8508();
        break;
    case 3:
        break;
    }
    func_02001b84();
    func_020068fc();
    return 1;
}
