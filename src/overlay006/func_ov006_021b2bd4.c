/* func_ov006_021b2bd4: one-time-setup helper (sibling of func_ov006_021b2a58,
 * same struct/callees). If func_ov005_021ad048's bss field is set,
 * initializes a sub-buffer (func_ov006_021b6be0 select 0, at a RUNTIME index
 * read from data_ov006_021cf140[5]) with a formatted string (func_020a978c,
 * OS_SPrintf-family), a 3-bit mode field from data_02104f4c.bits, and posts
 * it via func_020091f4. Then unconditionally posts two OS_SPrintf-family
 * debug prints (func_020018d4/func_0200197c) and applies the same mode
 * field via func_02001d68, finally arming data_ov006_021cf140[0]=5.
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
extern void func_020091f4(int a, int b, void *c);

int func_ov006_021b2bd4(void) {
    if (func_ov005_021ad048() != 0) {
        char *buf;
        func_020aaddc(data_ov006_021cf158);
        buf = func_ov006_021b6be0(data_ov006_0224f448, 0, data_ov006_021cf140[5]);
        func_020945f4(buf + 1, 0, 0x19);
        func_020a978c(buf + 1, data_ov006_021cf158);
        buf[0] = (char)data_02104f4c.bits;
        func_020091f4(0, data_ov006_021cf140[5], buf);
    }

    func_020018d4(0xa0);
    func_0200197c(4, data_ov006_021cf1b0, 0x80000);
    func_02001d68((int)data_02104f4c.bits);
    data_ov006_021cf140[0] = 5;
    return 1;
}
