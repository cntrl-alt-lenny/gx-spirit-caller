/* func_ov008_021ac128: index into a 0x34-byte-stride table by
 * (hibyte+lobyte) of a status halfword, notify two subsystems with the
 * looked-up entry, then decide a flag from either a threshold gate
 * (func_ov008_021aa498 + func_02006148) or a bitfield test, and forward
 * it to func_ov008_021b1f04.
 */

extern void func_ov008_021b1ce8(int x);
extern void func_ov008_021b1cfc(int p0, int p1);
extern int func_ov008_021b1dbc(void);
extern int func_ov008_021aa498(int a0, int a1, int a2, int a3);
extern unsigned int func_02006148(void);
extern void func_ov008_021b1f04(int a0);

typedef struct {
    unsigned short f0;
    char _pad2[2];
    int f4;
    char _pad_rest[0x34 - 8];
} Ov008Entry;
extern Ov008Entry data_ov008_021b2670[];

typedef struct {
    char _pad4[4];
    unsigned short lo : 8;
    unsigned short hi : 8;
} Dc0Hdr;
extern Dc0Hdr data_ov008_021b2ca0_alias;

typedef struct {
    char _pad54[0x54];
    unsigned short field54;
} Bac;
extern Bac data_02104acc;

void func_ov008_021ac128(void) {
    int flag = 0;
    int idx = data_ov008_021b2ca0_alias.lo + data_ov008_021b2ca0_alias.hi;
    Ov008Entry *entry = &data_ov008_021b2670[idx];

    func_ov008_021b1ce8(entry->f4);
    func_ov008_021b1cfc(entry->f0, 0);

    if (func_ov008_021b1dbc() != 0) {
        if (func_ov008_021aa498(0xe3, 0, 0x100, 0x14) != 0) {
            if (func_02006148() != 0) flag = 1;
        } else {
            if (data_02104acc.field54 & 0x800) flag = 1;
        }
    }
    func_ov008_021b1f04(flag);
}
