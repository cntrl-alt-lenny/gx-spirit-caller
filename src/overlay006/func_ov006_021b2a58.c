/* func_ov006_021b2a58: one-time-setup helper. If func_ov005_021ad048's
 * bss field is set, initializes a sub-buffer (func_ov006_021b6be0 select
 * 2) with a formatted string (func_020a978c, OS_SPrintf-family) and a
 * 3-bit mode field from data_02104f4c.f_4. Then unconditionally posts two
 * OS_SPrintf-family debug prints (func_020018d4/func_0200197c) and applies
 * the same mode field via func_02001d68, finally arming
 * data_ov006_021cf140=5. P-16: data_02104f4c.f_4 read twice across call
 * boundaries, typed struct field required.
 */
struct Ctl104f4c {
    char pad0[4];
    unsigned int bits : 3;
    unsigned int rest : 29;
};

extern struct Ctl104f4c data_02104f4c;
extern int data_ov006_021cf140[];
extern char data_ov006_021cf158[];
extern char data_ov006_021cf1b0[];
extern char data_ov006_0224f448[];

extern void func_020018d4(int a);
extern void func_0200197c(int a, void *b, int c);
extern void func_02001d68(int arg);
extern void func_020945f4(void *dst, int value, int count);
extern void func_020a978c(void *dst, const char *fmt);
extern int func_020aaddc(const char *s);
extern int func_ov005_021ad048(void);
extern char *func_ov006_021b6be0(char *base, int sel, int idx);

int func_ov006_021b2a58(void) {
    if (func_ov005_021ad048() != 0) {
        char *buf;
        func_020aaddc(data_ov006_021cf158);
        buf = func_ov006_021b6be0(data_ov006_0224f448, 2, 0);
        func_020945f4(buf + 1, 0, 0x19);
        func_020a978c(buf + 1, data_ov006_021cf158);
        buf[0] = (char)data_02104f4c.bits;
    }

    func_020018d4(0xa0);
    func_0200197c(4, data_ov006_021cf1b0, 0x80000);
    func_02001d68((int)data_02104f4c.bits);
    data_ov006_021cf140[0] = 5;
    return 1;
}
