/* func_ov008_021aa94c — C-34 address-CSE duplicate pool slot (re-audit,
 * brief 207 Phase 2 retry). data_ov008_021b2780 is referenced from two
 * distinct pool words: one used as a raw address-of passed to a
 * Fill32-style call, the other used for repeated struct-field access
 * (+0x8, +0x568). Technique 2: a second symbol name
 * (data_ov008_021b2780_alias) is registered at the exact same address
 * via a real zero-size split in the module's BSS file
 * (src/overlay008/bss/data_ov008_bss.s) plus a symbols.txt entry, so
 * mwasmarm's symbol-based literal-pool dedup treats the two references
 * as genuinely distinct pool slots. See docs/research/codegen-walls.md
 * C-34 and the existing data_ov008_021b2dc0_alias / data_0219a8e4_alias
 * precedents.
 */

extern void func_02094504(int arg0, void *arg1, int arg2);
extern void func_02005bfc(int arg0);
extern void func_02005ee0(void);
extern void func_02001a34(int arg0);
extern void func_02001d68(int arg0);
extern void func_0202adf8(void *arg0);
extern void func_0202ae1c(int arg0);
extern void func_0202c070(int arg0);
extern void func_0202c24c(void *arg0);
extern void func_0202c270(int arg0);
extern int func_0201a4dc(void);
extern void func_02009dec(void);
extern void func_02009e9c(void);
extern void func_ov008_021aa5d8(void);
extern void func_ov008_021aa6a4(void);
extern void func_ov008_021ab164(void);
extern void func_ov008_021b2064(void);
extern void func_ov008_021ac2ac(void);
extern int func_ov008_021adaa8(int arg0);

struct Data040ac {
    char _pad[0x38];
    int f38;
    char _pad2[0xb70 - 0x3c];
    int fb70;
};
extern struct Data040ac data_021040ac;

struct Item2780 {
    char _pad0[8];
    int f8;
    char _pad1[0x568 - 0xc];
    int f568;
};
extern struct Item2780 data_ov008_021b2780;
extern char data_ov008_021b2780_alias[];

extern void *data_ov008_021b2cec;
extern void *data_ov008_021b2d28;

struct Data104f4c {
    int w0;
    unsigned int chan : 3;
    unsigned int : 29;
    char _pad[0x90c - 8];
    unsigned int _f90cpad : 24;
    unsigned int f90cbit24 : 1;
    unsigned int _f90cpad2 : 7;
};
extern struct Data104f4c data_02104f4c;

int func_ov008_021aa94c(void) {
    int i;

    if (data_021040ac.fb70 == 0) {
        unsigned short f38;

        func_02094504(0, data_ov008_021b2780_alias, 0x640);
        f38 = (unsigned short)data_021040ac.f38;
        data_ov008_021b2780.f8 = (int)f38;
        func_02005bfc(3);
        func_02005ee0();
        func_02001a34(0x24);
        func_02001d68(data_02104f4c.chan);
        func_0202adf8(&data_ov008_021b2cec);
        func_0202ae1c(data_02104f4c.chan);
        func_0202c070(data_02104f4c.chan);
        func_0202c24c(&data_ov008_021b2d28);
        func_0202c270(data_02104f4c.chan);
        if (func_0201a4dc() == 1) {
            data_ov008_021b2780.f568 = 1;
        }
        if (data_02104f4c.f90cbit24 != 0) {
            unsigned char *p = (unsigned char *)&data_02104f4c;

            for (i = 0; i < 0x1a; i++, p += 0x1c) {
                if ((p + 0x1000)[0x56c] != 0 && (p + 0x1000)[0x56d] != 0) {
                    break;
                }
            }
            if (i >= 0x1a) {
                func_02009dec();
                func_02009e9c();
            }
        }
        func_ov008_021aa5d8();
        func_ov008_021aa6a4();
        func_ov008_021ab164();
        func_ov008_021b2064();
        data_021040ac.fb70 = data_021040ac.fb70 + 1;
        return 0;
    } else {
        func_ov008_021ac2ac();
        func_ov008_021adaa8(1);
        return 1;
    }
}
