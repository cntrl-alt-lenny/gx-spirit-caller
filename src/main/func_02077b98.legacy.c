typedef struct { char pad[0x54]; int f54; unsigned short f58; unsigned char f5a; char pad5b; } Entry02077d08;
extern Entry02077d08 data_021a071c[4];
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern int func_020a7440(const void *a, const void *b, int n);
void func_02077b98(void *packet)
{
    int i;
    int state;
    Entry02077d08 *entry;
    state = OS_DisableIrq();
    entry = data_021a071c;
    for (i = 0; i < 4; i++, entry++) {
        if (entry->f5a && func_020a7440(entry, (char *)packet + 0x74, 32) == 0) {
            entry->f5a = 0;
            break;
        }
    }
    OS_RestoreIrq(state);
}
