extern int func_ov002_022a1870(int *p);
extern int func_ov002_022a3918(int *p);
extern int func_ov002_022a6cc4(char *self);
extern int func_ov002_022a6d1c(char *self);
extern int func_ov002_022b3910(void *arg0);
extern char data_ov002_022d1410[];
extern char data_ov002_022d1b7c[];
extern unsigned short data_ov002_022d1a9c;
extern int data_ov002_022d11bc[];
extern char data_ov002_022d1af8[];
extern int data_ov002_022d1400[];

int func_ov002_0229c7f8(int arg) {
    switch (arg) {
    case 0: case 18: case 21: case 25:
        return func_ov002_022a6d1c(data_ov002_022d1410);
    case 16:
        return func_ov002_022a6d1c(data_ov002_022d1410) || *(int *)(data_ov002_022d1b7c + 0xc54) == 0x15;
    case 3:
        return data_ov002_022d1a9c;
    case 49: case 50:
        return func_ov002_022a1870(data_ov002_022d11bc);
    case 13: case 14:
        return func_ov002_022b3910(data_ov002_022d1af8);
    case 4: case 5:
        return func_ov002_022a3918(data_ov002_022d1400) || func_ov002_022b3910(data_ov002_022d1af8);
    case 1:
        return func_ov002_022a3918(data_ov002_022d1400) || *(int *)(data_ov002_022d1b7c + 0xc54) == 0x1a;
    case 2:
        return func_ov002_022b3910(data_ov002_022d1af8) || *(int *)(data_ov002_022d1b7c + 0xc54) == 0x1b;
    case 32:
        return func_ov002_022a3918(data_ov002_022d1400) || *(int *)(data_ov002_022d1b7c + 0xc54) == 5;
    case 29:
        return *(int *)(data_ov002_022d1b7c + 0xc54) == 0xa;
    case 30:
        return *(int *)(data_ov002_022d1b7c + 0xc54) == 3;
    case 28:
        return *(int *)(data_ov002_022d1b7c + 0xc54) == 4;
    case 34:
        return *(int *)(data_ov002_022d1b7c + 0xc54) == 6;
    case 33:
        return *(int *)(data_ov002_022d1b7c + 0xc54) == 8;
    case 31:
        return *(int *)(data_ov002_022d1b7c + 0xc54) == 9;
    case 26:
        return func_ov002_022a6d1c(data_ov002_022d1410) || *(int *)(data_ov002_022d1b7c + 0xc54) == 0xb;
    case 24:
        return func_ov002_022a6d1c(data_ov002_022d1410) || *(int *)(data_ov002_022d1b7c + 0xc54) == 0xc;
    case 35:
        return *(int *)(data_ov002_022d1b7c + 0xc54) == 0xe;
    case 37:
        return *(int *)(data_ov002_022d1b7c + 0xc54) == 0xd;
    case 19:
        return *(int *)(data_ov002_022d1b7c + 0xc54) == 0x14;
    case 39:
        return *(int *)(data_ov002_022d1b7c + 0xc54) == 0x16;
    case 12:
        return func_ov002_022a3918(data_ov002_022d1400) || *(int *)(data_ov002_022d1b7c + 0xc54) == 2;
    case 51: case 52:
        return func_ov002_022a3918(data_ov002_022d1400) || *(int *)(data_ov002_022d1b7c + 0xc54) == 1;
    case 53:
        return *(int *)(data_ov002_022d1b7c + 0xc54) == 0x10;
    case 48: case 61:
        return func_ov002_022a3918(data_ov002_022d1400);
    case 55:
        return *(int *)(data_ov002_022d1b7c + 0xc54) == 0x18;
    case 56:
        return *(int *)(data_ov002_022d1b7c + 0xc54) == 0x17;
    case 57:
        return *(int *)(data_ov002_022d1b7c + 0xc54) == 0x19;
    case 58:
        return *(int *)(data_ov002_022d1b7c + 0xc54) == 0x11;
    case 59:
        return *(int *)(data_ov002_022d1b7c + 0xc54) == 0x12;
    case 60:
        return *(int *)(data_ov002_022d1b7c + 0xc54) == 0x13;
    case 6:
        return *(int *)(data_ov002_022d1b7c + 0xc54) == 0xf;
    case 47:
        return func_ov002_022a3918(data_ov002_022d1400) || func_ov002_022a6cc4(data_ov002_022d1410);
    case 42: case 45:
        return *(int *)(data_ov002_022d1b7c + 0xc54) == 7;
    default:
        return func_ov002_022a6cc4(data_ov002_022d1410);
    }
}
