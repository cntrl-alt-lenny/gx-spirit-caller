/* func_ov006_021b2ad4: one-time-setup helper (sibling of func_ov006_021b2a58,
 * same struct/callees). If func_ov005_021acf40's bss field is set,
 * initializes a sub-buffer (func_ov006_021b6ae0 select 0, at a RUNTIME index
 * read from data_ov006_021cf020[5]) with a formatted string (func_020a9698,
 * OS_SPrintf-family), a 3-bit mode field from data_02104e6c.bits, and posts
 * it via func_020091d8. Then unconditionally posts two OS_SPrintf-family
 * debug prints (func_020018b4/func_0200195c) and applies the same mode
 * field via func_02001d48, finally arming data_ov006_021cf020[0]=5.
 */
struct Ctl104f4c {
    char pad0[4];
    unsigned int bits : 3;
    unsigned int rest : 29;
};

extern struct Ctl104f4c data_02104e6c;
extern int data_ov006_021cf020[];
extern char data_ov006_021cf038[];
extern char data_ov006_021cf090[];
extern char data_ov006_0224f328[];

extern void func_020018b4(int a);
extern void func_0200195c(int a, void *b, int c);
extern void func_02001d48(int arg);
extern void func_02094500(void *dst, int value, int count);
extern void func_020a9698(void *dst, const char *fmt);
extern int func_020aace8(const char *s);
extern int func_ov005_021acf40(void);
extern char *func_ov006_021b6ae0(char *base, int sel, int idx);
extern void func_020091d8(int a, int b, void *c);

int func_ov006_021b2ad4(void) {
    if (func_ov005_021acf40() != 0) {
        char *buf;
        func_020aace8(data_ov006_021cf038);
        buf = func_ov006_021b6ae0(data_ov006_0224f328, 0, data_ov006_021cf020[5]);
        func_02094500(buf + 1, 0, 0x19);
        func_020a9698(buf + 1, data_ov006_021cf038);
        buf[0] = (char)data_02104e6c.bits;
        func_020091d8(0, data_ov006_021cf020[5], buf);
    }

    func_020018b4(0xa0);
    func_0200195c(4, data_ov006_021cf090, 0x80000);
    func_02001d48((int)data_02104e6c.bits);
    data_ov006_021cf020[0] = 5;
    return 1;
}
