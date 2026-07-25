/* func_ov008_021aa86c — C-34 address-CSE duplicate pool slot (re-audit,
 * brief 207 Phase 2 retry). data_ov008_021b2660_alias is referenced from two
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

extern void func_02094410(int arg0, void *arg1, int arg2);
extern void func_02005be0(int arg0);
extern void func_02005ec4(void);
extern void func_02001a14(int arg0);
extern void func_02001d48(int arg0);
extern void func_0202ada4(void *arg0);
extern void func_0202adc8(int arg0);
extern void func_0202c01c(int arg0);
extern void func_0202c1f8(void *arg0);
extern void func_0202c21c(int arg0);
extern int func_0201a4a8(void);
extern void func_02009dd0(void);
extern void func_02009e80(void);
extern void func_ov008_021aa4f8(void);
extern void func_ov008_021aa5c4(void);
extern void func_ov008_021ab084(void);
extern void func_ov008_021b1f40(void);
extern void func_ov008_021ac1cc(void);
extern int func_ov008_021ad984(int arg0);

struct Data040ac {
    char _pad[0x38];
    int f38;
    char _pad2[0xb70 - 0x3c];
    int fb70;
};
extern struct Data040ac data_02103fcc;

struct Item2780 {
    char _pad0[8];
    int f8;
    char _pad1[0x568 - 0xc];
    int f568;
};
extern struct Item2780 data_ov008_021b2660;
extern char data_ov008_021b2660_alias[];

extern void *data_ov008_021b2bcc;
extern void *data_ov008_021b2c08;

struct Data104f4c {
    int w0;
    unsigned int chan : 3;
    unsigned int : 29;
    char _pad[0x90c - 8];
    unsigned int _f90cpad : 24;
    unsigned int f90cbit24 : 1;
    unsigned int _f90cpad2 : 7;
};
extern struct Data104f4c data_02104e6c;

int func_ov008_021aa86c(void) {
    int i;

    if (data_02103fcc.fb70 == 0) {
        unsigned short f38;

        func_02094410(0, data_ov008_021b2660_alias, 0x640);
        f38 = (unsigned short)data_02103fcc.f38;
        data_ov008_021b2660.f8 = (int)f38;
        func_02005be0(3);
        func_02005ec4();
        func_02001a14(0x24);
        func_02001d48(data_02104e6c.chan);
        func_0202ada4(&data_ov008_021b2bcc);
        func_0202adc8(data_02104e6c.chan);
        func_0202c01c(data_02104e6c.chan);
        func_0202c1f8(&data_ov008_021b2c08);
        func_0202c21c(data_02104e6c.chan);
        if (func_0201a4a8() == 1) {
            data_ov008_021b2660.f568 = 1;
        }
        if (data_02104e6c.f90cbit24 != 0) {
            unsigned char *p = (unsigned char *)&data_02104e6c;

            for (i = 0; i < 0x1a; i++, p += 0x1c) {
                if ((p + 0x1000)[0x56c] != 0 && (p + 0x1000)[0x56d] != 0) {
                    break;
                }
            }
            if (i >= 0x1a) {
                func_02009dd0();
                func_02009e80();
            }
        }
        func_ov008_021aa4f8();
        func_ov008_021aa5c4();
        func_ov008_021ab084();
        func_ov008_021b1f40();
        data_02103fcc.fb70 = data_02103fcc.fb70 + 1;
        return 0;
    } else {
        func_ov008_021ac1cc();
        func_ov008_021ad984(1);
        return 1;
    }
}
