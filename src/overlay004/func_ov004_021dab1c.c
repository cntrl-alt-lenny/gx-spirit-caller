typedef struct { int type; int value; unsigned char kind; char name[23]; } Record;
typedef struct {
    char pad[0xa3c];
    unsigned char kind : 3;
    unsigned char rest : 5;
    char pad2[0x27];
    int value;
} State;
extern char data_02104f4c[];
typedef struct { char pad[0x8c]; int mode; char pad2[0xc]; int a9c; int aa0; int aa4; char pad3[8]; int ab0; int ab4; Record records[5]; } Global;
extern Global data_ov004_0220b500;
extern char data_02105989[];
extern char *func_020aadf8(char *dst, const char *src);
extern int func_ov004_021da978(void);
extern int func_ov004_021daa48(void);
void func_ov004_021dab1c(void) {
    Global *b = &data_ov004_0220b500;
    int i;
    b->a9c = 0;
    b->aa0 = 0;
    b->ab0 = -1;
    if (b->mode > 0x100) {
        b->records[0].type = 5;
        b->records[0].kind = ((State *)data_02104f4c)->kind;
        b->records[0].value = ((State *)data_02104f4c)->value;
        func_020aadf8(b->records[0].name, data_02105989);
        for (i = 1; i < 5; i++) {
            b->records[i].type = 0;
        }
        b->aa4 = 0;
        if (b->mode == 0x200) {
            b->a9c = func_ov004_021da978();
            b->aa0 = func_ov004_021daa48();
        }
    }
}







