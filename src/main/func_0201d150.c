typedef struct { int raw[0x30]; } Record0219060c;
typedef struct {
    char pad[8];
    int f8;
    char padc[8];
    int f14;
    int f18;
} State0218febc;
extern State0218febc data_0218febc;
extern int data_0218ff8c[32];
extern Record0219060c data_0219060c[32];
extern unsigned short data_020be71c[];
extern void func_0201c9b4(Record0219060c *param0);
extern void func_0201ca88(void);
extern int func_0201cfe0(void);
extern int func_0201f7f0(void (*callback)(Record0219060c *), unsigned short *, int);
extern int func_0201fb8c(void);
extern void *func_0202046c(void);
extern int func_02020490(void);
extern int func_020206d8(void);
extern int func_02020914(int, int, int);
extern int func_02020a24(int, Record0219060c *);
extern int func_02020b84(void);
extern void func_02020ba0(void);
extern int func_02020c94(void);
extern unsigned short func_0209e124(void);

void func_0201d150(void) {
    int i;
    int value;
    switch ((unsigned int)func_0202046c()) {
    case 0:
        data_0218febc.f8 = 0;
        func_0201ca88();
        if (data_0218febc.f14 == 1) data_0218febc.f8 = 1;
        break;
    case 1:
        func_0201ca88();
        switch (data_0218febc.f14) {
        case 0: case 1: func_02020c94(); break;
        case 3: func_0201f7f0(func_0201c9b4, data_020be71c, 0); break;
        case 4: func_02020490(); break;
        case 5: func_02020a24(1, &data_0219060c[data_0218febc.f18]); break;
        }
        break;
    case 2:
        data_0218febc.f8 = 3;
        for (i = 0; i < 32; i++) {
            if (data_0218ff8c[i] > 0) data_0218ff8c[i]--;
        }
        switch (data_0218febc.f14) {
        case 0: case 1: func_02020ba0(); break;
        case 4: case 5: func_0201fb8c(); break;
        }
        break;
    case 4:
        data_0218febc.f8 = func_0201cfe0() ? 4 : 5;
        switch (data_0218febc.f14) {
        case 2: case 3: func_02020b84(); break;
        case 0: case 1: func_02020ba0(); break;
        }
        break;
    case 7:
        value = func_020206d8();
        func_02020914(0, func_0209e124(), value);
        break;
    case 8: case 9: case 10:
        data_0218febc.f8 = 1;
        func_0201ca88();
        switch (data_0218febc.f14) {
        case 2: case 3: func_02020b84(); break;
        case 0: func_02020ba0(); break;
        }
        break;
    }
}

