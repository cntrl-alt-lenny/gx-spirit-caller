/* func_020243dc -- C-34 re-audit (cm-parked-reaudit-2 batch A).
 * Literal-address-cast lever: orig has 2 distinct pool slots for
 * data_0219a80c. The symbol-form reference is a persistent pointer
 * (Fill32 dst at offset 0, later offset-0x4 read + offset-0x0 write);
 * the literal-form reference is a SHORT-LIVED pointer used immediately
 * (offset-0x4 write, offset-0x0 read, both right after the Fill32 call,
 * no loop/gap in between) -- assigned to a local pointer variable once,
 * not re-cast inline, so the nonzero-offset access doesn't fold into the
 * literal itself.
 */

typedef struct {
    int field0; /* +0x0 */
    int field4; /* +0x4 */
} Overlay0219a8ec;

typedef struct {
    int w0, w1, w2; /* 12-byte raw copy source, fields unused by this fn */
} Blob020be754;

typedef struct {
    unsigned char  byte0;  /* +0x0 */
    char           _pad1[3];
    unsigned short half4;  /* +0x4 */
    unsigned short half6;  /* +0x6 */
    char           _pad7[0x1c - 0x8];
    int            word1c; /* +0x1c */
} Overlay0219a8f4;

extern Overlay0219a8ec data_0219a80c;
extern Blob020be754    data_020be660;
extern Overlay0219a8f4 data_0219a814;

extern void Fill32(unsigned int value, void *dst, unsigned int size);
extern int  Task_PostLocked(int a0, int a1, int a2);
extern void func_02026f24(void *a0, int a1, int a2, int a3);

int func_020243dc(int param)
{
    Blob020be754 localbuf;
    Overlay0219a8ec *p_sym = &data_0219a80c;
    Overlay0219a8ec *p_literal = (Overlay0219a8ec *)0x0219a8ec;
    Overlay0219a8f4 *p_f4;

    localbuf = data_020be660;

    p_f4 = &data_0219a814;
    Fill32(0, p_sym, 0x38);

    p_literal->field4 = param;
    if (p_literal->field0 == 0) {
        int size = p_sym->field4 * 0x16c;
        int handle = Task_PostLocked(size, 4, 0);
        p_sym->field0 = handle;
        Fill32(0, (void *)handle, size);
    }

    p_f4->byte0 = 5;
    p_f4->half4 = 0x80;
    p_f4->half6 = 0x80;
    p_f4->word1c = 0;
    func_02026f24(&localbuf, 0, 0x80, 5);

    return 1;
}
