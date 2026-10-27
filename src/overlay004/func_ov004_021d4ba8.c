struct FlagBits { unsigned char value:3; };
extern char data_02104f4c[];
extern char data_02105989[];
extern char data_ov004_0220b500[];
extern char data_021040ac[];
extern void *func_0203268c(void);
struct Obj_02033654;
extern int func_02033654(struct Obj_02033654 *p);
extern int func_02049684(int a, int b);
extern char *func_020aadf8(char *dst, const char *src);
extern void func_ov004_021c9d8c(int x);
extern int func_ov004_021c9d9c(void);
extern void func_ov004_021d7c00(int arg0);
extern int func_ov004_021d7c54(void);
static inline int take_flag(char *p) {
    int result;
    if (*(int *)(p + 0x38) != 0) {
        *(int *)(p + 0x38) = 0;
        result = 1;
    } else result = 0;
    return result;
}
static inline void state(char *p, int v) {
    *(int *)(p + 0x30) = v;
    *(int *)(p + 0x38) = 1;
    *(int *)(p + 0x3c) = 0;
}
void func_ov004_021d4ba8(void *rec) {
    char *p = rec;
    char *b;
    struct { unsigned char flag; char text[23]; int value; } msg;
    if (take_flag(p)) {
        msg.flag = ((struct FlagBits *)(data_02104f4c + 0xa3c))->value;
        func_020aadf8(msg.text, data_02105989);
        msg.value = *(int *)(data_02104f4c + 0xa64);
        func_02049684((int)&msg, 0x1c);
        if (*(int *)(data_ov004_0220b500 + 0x48) == 0) {
            state(p, 0x1d);
            return;
        }
        if (func_ov004_021c9d9c() != 0) {
            state(p, 0x21);
            return;
        }
        if (*(int *)(data_021040ac + 0xbac) >= 0) {
            state(p, 0x20);
            return;
        }
        func_ov004_021d7c00(1);
    }
    if (func_ov004_021d7c54() == 0) return;
    b = data_ov004_0220b500;
    if (*(int *)(b + 0x88) == 1) state(p, 0x1b);
    if (*(int *)(b + 0x88) == 2) {
        if (func_02033654(func_0203268c()) > 0) {
            state(p, 0x1d);
            func_ov004_021c9d8c(0);
        } else state(p, 0x19);
    } else if (*(int *)(b + 0x88) == 3) state(p, 0x25);
    if (*(int *)(b + 0x88) < 0) state(p, 0x24);
}


