/* func_02073750: IRQ-guarded handle lookup. Two early sentinel-return
 * gates share their own exit label; the main path linear-scans an
 * 8-entry, 12-byte-stride table (data_0219eeb0) for arg0, and on a
 * match stores a tick-derived halfword into the parallel
 * data_0219eeba array (same byte stride) before returning
 * &entry+4. Falls through with a NULL result if no entry matches.
 */

typedef struct {
    int f0;
    char _pad4[8];
} Entry0219ef90;

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern int func_02073d80(int a);
extern int func_02073d6c(unsigned int a);
extern long long func_02092fc8(void);

extern int data_0219ee3c;
extern char data_0219ee4c;
extern char data_02101dc4;
extern Entry0219ef90 data_0219eeb0[8];
extern char data_0219eeba[];

void *func_02073750(int arg0) {
    unsigned int i;
    void *result;
    int saved;

    saved = OS_DisableIrq();
    result = 0;

    if (arg0 == 0x7f000001 || arg0 == data_0219ee3c) {
        result = &data_0219ee4c;
    } else if (func_02073d80(arg0) != 0 || func_02073d6c(arg0) != 0) {
        result = &data_02101dc4;
    } else {
        for (i = 0; i < 8; i++) {
            if (data_0219eeb0[i].f0 == arg0) {
                long long t = func_02092fc8();
                *(unsigned short *)(data_0219eeba + i * 0xc) = (unsigned short)(t >> 16);
                result = (char *)&data_0219eeb0[i] + 4;
                break;
            }
        }
    }

    OS_RestoreIrq(saved);
    return result;
}
