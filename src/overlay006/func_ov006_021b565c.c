/* func_ov006_021b565c: notify four subsystems of the current 3-bit mode and
 * seed a state word; return 1. */
extern void func_0202adf8(void *p);
extern void func_0202ae1c(int mode);
extern void func_0202c070(int mode);
extern void func_0200197c(int a, void *p, int c);
extern void func_02001d68(int mode);
extern char data_ov006_0224f3a4[];
struct Ov006Mode { int pad; unsigned mode : 3; };
extern struct Ov006Mode data_02104f4c;
extern char data_ov006_021cf1b0[];
extern int  data_ov006_0224f38c[];
int func_ov006_021b565c(void) {
    func_0202adf8(data_ov006_0224f3a4);
    func_0202ae1c(data_02104f4c.mode);
    func_0202c070(data_02104f4c.mode);
    func_0200197c(4, data_ov006_021cf1b0, 0x80000);
    func_02001d68(data_02104f4c.mode);
    data_ov006_0224f38c[0] = 2;
    return 1;
}
