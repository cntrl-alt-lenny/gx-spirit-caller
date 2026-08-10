/* func_02073838: IRQ-guarded handle lookup. Two early sentinel-return
 * gates share their own exit label; the main path linear-scans an
 * 8-entry, 12-byte-stride table (data_0219ef90) for arg0, and on a
 * match stores a tick-derived halfword into the parallel
 * data_0219ef9a array (same byte stride) before returning
 * &entry+4. Falls through with a NULL result if no entry matches.
 */

typedef struct {
    int f0;
    char _pad4[8];
} Entry0219ef90;

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern int func_02073e68(int a);
extern int func_02073e54(unsigned int a);
extern long long func_020930b0(void);

extern int data_0219ef1c;
extern char data_0219ef2c;
extern char data_02101ea4;
extern Entry0219ef90 data_0219ef90[8];
extern char data_0219ef9a[];

void *func_02073838(int arg0) {
    unsigned int i;
    void *result;
    int saved;

    saved = OS_DisableIrq();
    result = 0;

    if (arg0 == 0x7f000001 || arg0 == data_0219ef1c) {
        result = &data_0219ef2c;
    } else if (func_02073e68(arg0) != 0 || func_02073e54(arg0) != 0) {
        result = &data_02101ea4;
    } else {
        for (i = 0; i < 8; i++) {
            if (data_0219ef90[i].f0 == arg0) {
                long long t = func_020930b0();
                *(unsigned short *)(data_0219ef9a + i * 0xc) = (unsigned short)(t >> 16);
                result = (char *)&data_0219ef90[i] + 4;
                break;
            }
        }
    }

    OS_RestoreIrq(saved);
    return result;
}
