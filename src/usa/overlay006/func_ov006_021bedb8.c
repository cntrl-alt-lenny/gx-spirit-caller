typedef unsigned short u16;
typedef unsigned int u32;

struct Hw100e {
    volatile u16 ctrl;
    char _pad[0xc];
};
#define HW_100E (*(struct Hw100e *)0x0400100e)
#define HW_100E_FIELD_E (*(volatile u32 *)((char *)0x0400100e + 0xe))

extern int func_0208deac(void);
extern void func_02094410(int a, int b, int c);
extern void func_02001cec(char *a, int b, int c);
extern void func_02001e74(char *a, int b, int c, int d);
extern int func_0208dcb4(void);
extern void func_0208fe9c(char *a, int b, int c);
extern char data_020b4634[];

int func_ov006_021bedb8(char *arg0) {
    HW_100E.ctrl = (HW_100E.ctrl & ~3) | 2;
    HW_100E.ctrl = (HW_100E.ctrl & 0x43) | 0x218 | 0x400;
    HW_100E_FIELD_E = 0x30000;

    func_02094410(0, func_0208deac(), 0x640);
    func_02001cec(arg0 + 4, 0x20, 0x19);
    func_02001e74(arg0 + 4, func_0208deac(), 2, 1);
    func_02094410(0, func_0208dcb4() + 0x40, 0x6400);
    func_0208fe9c(data_020b4634, 0x20, 0x20);
    return 1;
}
