/* func_ov008_021adaa8 — C-34 address-CSE duplicate pool slot (re-audit,
 * brief 207 Phase 2 retry). data_ov008_021b2dc8 is referenced from two
 * distinct pool words: one used as a raw address-of passed to a
 * Fill32-style call, the other used for repeated struct-field access.
 * Technique 2: a second symbol name (data_ov008_021b2dc8_alias) is
 * registered at the exact same address via a real zero-size split in
 * the module's BSS file (src/overlay008/bss/data_ov008_bss.s) plus a
 * symbols.txt entry, so mwasmarm's symbol-based literal-pool dedup
 * treats the two references as genuinely distinct pool slots. See
 * docs/research/codegen-walls.md C-34 and the existing
 * data_ov008_021b2dc0_alias / data_0219a8e4_alias precedents.
 */

extern void func_02094504(int arg0, void *arg1, int arg2);

struct Item2dc0 {
    char _pad0[6];
    unsigned short f6lo : 8;
    unsigned short f6hi : 8;
};
extern struct Item2dc0 data_ov008_021b2dc0;

struct Item2dc8 {
    char _pad0[6];
    unsigned short f6lo : 8;
    unsigned short f6hi : 8;
    char _pad1[4];
    int fC;
    int f10;
    char _pad2[4];
    int f18;
};
extern struct Item2dc8 data_ov008_021b2dc8;
extern char data_ov008_021b2dc8_alias[];

struct Item2dce {
    unsigned short f0lo : 8;
    unsigned short f0hi : 8;
};
extern struct Item2dce data_ov008_021b2dce;

extern char data_ov008_021b279c[];
extern char data_ov008_021b27a0[];
extern char data_ov008_021b27a4[];

void func_ov008_021adaa8(int arg0) {
    int saved_f18;
    int idx;
    unsigned short raw;

    saved_f18 = data_ov008_021b2dc8.f18;
    func_02094504(0, data_ov008_021b2dc8_alias, 0x1c);
    if (arg0 != 0) {
        return;
    }

    idx = data_ov008_021b2dc0.f6lo * 0x34;
    raw = *(unsigned short *)(data_ov008_021b279c + idx);

    data_ov008_021b2dc8.f6lo = raw / 5;

    if (raw % 5 != 0) {
        data_ov008_021b2dce.f0lo += 1;
    }

    data_ov008_021b2dc8.f6hi = raw;
    data_ov008_021b2dc8.fC = *(int *)(data_ov008_021b27a0 + idx);
    data_ov008_021b2dc8.f10 = *(int *)(data_ov008_021b27a4 + idx);
    data_ov008_021b2dc8.f18 = saved_f18;
}
