/* func_02077d08: IRQ-guarded linear scan of a 4-entry, 0x5c-stride
 * table (data_021a071c) for an active (f5a!=0) entry matching
 * (f54==param1, f58==param2). On match, copies 2 sub-regions in from
 * param0, stamps a tick-derived value at +0x50, and flags param0->
 * 0x30. Same func_020930b0()>>16 truncation idiom as func_02073838.
 */

typedef struct {
    char _pad0[0x54];
    int f54;
    unsigned short f58;
    unsigned char f5a;
    char _pad5b[1];
} Entry02077d08;

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern void func_02094688(void *dst, void *src, int n);
extern long long func_020930b0(void);

extern Entry02077d08 data_021a071c[4];

void func_02077d08(void *param0, int param1, int param2) {
    char *base = (char *)param0;
    int saved;
    int i;

    saved = OS_DisableIrq();
    i = 0;
    base[0x30] = 0;

    do {
        Entry02077d08 *e = &data_021a071c[i];

        if (e->f5a == 0) continue;
        if (e->f54 != param1) continue;
        if (e->f58 != param2) continue;

        func_02094688(e, base + 0x74, 0x20);
        func_02094688((char *)e + 0x20, base, 0x30);
        {
            long long t = func_020930b0();
            *(int *)((char *)e + 0x50) = (int)(t >> 16);
        }
        base[0x30] = 1;
        break;
    } while (++i < 4);

    OS_RestoreIrq(saved);
}
