extern char data_ov004_0220b500[];
typedef struct { char pad[0xba4]; int value; int value2; char pad2[0x20]; unsigned char a; unsigned char b; } State;
extern State data_021040ac;
extern char data_02104c94[];
extern char data_02104c7a[];
extern char data_ov004_022915e8[];
extern int func_0201cbd8(int, void *);
extern void func_02094688(const void *, void *, unsigned int);
extern char *func_020aadf8(char *, const char *);
extern int func_02007218(void);
extern void func_ov004_021d8cd0(void *rec);
int func_ov004_021cd924(void) {
    unsigned short packet[256];
    char *b = data_ov004_0220b500;
    if (func_0201cbd8(2, packet) == 0) return 0;
    switch (packet[0]) {
    case 0:
        func_02094688(packet + 1, b + 0x3cd4, 0x54);
        data_021040ac.value = *(unsigned short *)(b + 0x3d14);
        data_021040ac.b = *(unsigned char *)(b + 0x3ce4);
        data_021040ac.value2 = *(int *)(b + 0x3d18);
        func_020aadf8(data_02104c94, b + 0x3ce5);
        *(int *)(b + 0x3ce0) = func_02007218();
        *(int *)(data_ov004_0220b500 + 0x74) = 1;
        break;
    case 1:
        if (*(int *)(data_ov004_0220b500 + 0x44) != 0) {
            *(int *)(data_ov004_0220b500 + 0x78) = packet[1];
            data_021040ac.value = packet[2];
        } else {
            func_02094688(packet + 1, b + 0x3cd4, 0x54);
            data_021040ac.value = *(unsigned short *)(b + 0x3d14);
            data_021040ac.a = *(unsigned char *)(b + 0x3ce4);
            data_021040ac.value2 = *(int *)(b + 0x3d18);
            func_020aadf8(data_02104c7a, b + 0x3ce5);
            *(int *)(b + 0x3ce0) = func_02007218();
            *(int *)(b + 0x3cd0) = 1;
            *(int *)(data_ov004_0220b500 + 0x78) = 1;
        }
        func_ov004_021d8cd0(data_ov004_022915e8);
        break;
    case 0x13:
        *(int *)(data_ov004_0220b500 + 0x78) = 2;
        break;
    }
    return 1;
}


