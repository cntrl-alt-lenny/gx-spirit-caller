/* func_02037dc0: mode-dispatch scan over the 28-entry data_0219b760 table
 * (0x78 stride, Entry68-shaped per func_02038168.c ground truth). Modes
 * 0-5 loop every entry, skip inactive ones (signed byte +0x6a < 0), apply
 * a per-mode flag-bit guard on the +0x34 word, and call
 * func_02037d28(entry, arg1, arg2) for entries that pass. Any other mode
 * (arg0 - 0x8f00000 out of [0,5]) resolves a caller-context entry via
 * func_02037b58 and calls func_02037d28 once with it, or returns 0 if
 * unresolved.
 */

typedef struct Entry68 {
    char _pad_00[0x04];
    char f04;
    char _pad_05[0x1a - 0x5];
    unsigned short f1a;
    char _pad_1c[0x34 - 0x1c];
    unsigned int f34;
    char _pad_38[0x6a - 0x38];
    signed char f6a;
} Entry68;

extern Entry68 *func_02037b58(int id);
extern int func_02037d28(void *entry, void *arg1, void *arg2);
extern unsigned char data_0219b760[];
extern unsigned char data_0219b2e0[];

int func_02037dc0(int modeArg, void *arg1, void *arg2) {
    unsigned int mode = modeArg - 0x8f00000;
    unsigned char *entry = data_0219b760;
    int idx;

    switch (mode) {
    case 0:
        for (idx = 0; idx < 0x1c; idx++, entry += 0x78) {
            if (((Entry68 *)entry)->f6a < 0) continue;
            if (((Entry68 *)entry)->f34 & 0x1000000) continue;
            func_02037d28(entry, arg1, arg2);
        }
        return 1;
    case 1:
        for (idx = 0; idx < 0x1c; idx++, entry += 0x78) {
            if (((Entry68 *)entry)->f6a < 0) continue;
            if (!(((Entry68 *)entry)->f34 & 0x1000000)) continue;
            if (((Entry68 *)entry)->f34 & 0x2000000) continue;
            func_02037d28(entry, arg1, arg2);
        }
        return 1;
    case 2:
        for (idx = 0; idx < 0x1c; idx++, entry += 0x78) {
            if (((Entry68 *)entry)->f6a < 0) continue;
            if (!(((Entry68 *)entry)->f34 & 0x1000000)) continue;
            if (!(((Entry68 *)entry)->f34 & 0x2000000)) continue;
            func_02037d28(entry, arg1, arg2);
        }
        return 1;
    case 3:
        for (idx = 0; idx < 0x1c; idx++, entry += 0x78) {
            if (((Entry68 *)entry)->f6a < 0) continue;
            if (!(((Entry68 *)entry)->f34 & 0x1000000)) continue;
            func_02037d28(entry, arg1, arg2);
        }
        return 1;
    case 4:
        for (idx = 0; idx < 0x1c; idx++, entry += 0x78) {
            if (((Entry68 *)entry)->f6a < 0) continue;
            func_02037d28(entry, arg1, arg2);
        }
        return 1;
    case 5:
        for (idx = 0; idx < 0x1c; idx++, entry += 0x78) {
            unsigned int flags;
            unsigned char *defs;
            if (((Entry68 *)entry)->f6a < 0) continue;
            flags = ((Entry68 *)entry)->f34;
            if (!(flags & 0x1000000)) continue;
            defs = *(unsigned char **)(data_0219b2e0 + 0x34);
            if (!(defs[(unsigned short)flags * 0xc + 7] & 0x80)) continue;
            func_02037d28(entry, arg1, arg2);
        }
        return 1;
    default: {
        Entry68 *resolved = func_02037b58(modeArg);
        if (resolved == 0) return 0;
        func_02037d28(resolved, arg1, arg2);
        return 1;
    }
    }
}
