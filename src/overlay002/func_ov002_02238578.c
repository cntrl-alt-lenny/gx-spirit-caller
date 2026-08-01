typedef struct {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
} F2_02238578;

typedef struct {
    unsigned int low9 : 9;
    unsigned int hi23 : 23;
} F14_02238578;

typedef struct {
    char pad[0x5a8];
    int state;
} T022ce288_02238578;

extern T022ce288_02238578 data_ov002_022ce288;
extern char data_ov002_022cf178[];
extern char data_ov002_022cf16c[];

extern int func_ov002_021b9aa8(int a, int b);
extern void func_ov002_021e27c0(int a, int b);
extern void func_ov002_0226b094(int a, int b);
extern void func_ov002_0227adb8(int a, int *b, int c, int d);

int func_ov002_02238578(void *obj) {
    char *o = (char *)obj;
    int result;
    int state;

    result = func_ov002_021b9aa8(((F2_02238578 *)(o + 2))->bit0,
                                  ((F14_02238578 *)(o + 0x14))->low9);
    state = data_ov002_022ce288.state;

    if (state == 0x64) goto case_64;
    if (state == 0x6e) goto case_6e;
    if (state != 0x80) goto case_default;

    /* case 0x80 (inline, matches the original's fallthrough layout) */
    {
        int bit0 = ((F2_02238578 *)(o + 2))->bit0;
        int idx = (1 - bit0) & 1;
        int *entry = (int *)(data_ov002_022cf178 + idx * 0x868);
        if (*entry == 0) {
            return 0;
        }
        if (result < 0) {
            func_ov002_021e27c0(bit0, 1);
            return 0x6e;
        } else {
            int *arr = (int *)(data_ov002_022cf16c + (bit0 & 1) * 0x868 + 0x120);
            func_ov002_0227adb8(bit0, arr + result, 1, 0);
            return 0;
        }
    }

case_6e:
    {
        int bit0 = ((F2_02238578 *)(o + 2))->bit0;
        unsigned short f0 = *(unsigned short *)o;
        func_ov002_0226b094(1 - bit0, f0);
        return 0x64;
    }

case_64:
    {
        int bit0 = ((F2_02238578 *)(o + 2))->bit0;
        func_ov002_021e27c0(bit0, 0);
        return 0;
    }

case_default:
    return 0;
}
