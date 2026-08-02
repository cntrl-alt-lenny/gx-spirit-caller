/* func_ov002_0229e3d8: spawn a task from a fixed entry-point blob, fill in
 * a local 0x28-byte descriptor, submit it, then invoke the task. Two
 * near-identical blocks back to back, each with its own local descriptor
 * (mwcc allocates them as two separate 0x28-byte stack slots, sub sp #0x50
 * total).
 */

typedef struct {
    int field_0x0;
    char _pad_0x4[0x8];
    int field_0xc;
    unsigned short field_0x10;
    unsigned short _pad_0x12;
    unsigned short field_0x14;
    char _pad_0x16[0x28 - 0x16];
} Desc0229e4e8;

extern char data_ov002_022cb92c[];
extern char data_ov002_022cb940[];
extern void *func_02006bf0(void *entry, int a, int b);
extern void func_0201d428(void *desc);
extern void func_0201e564(void *desc);
extern void Task_Invoke(void *task);

void func_ov002_0229e3d8(void) {
    Desc0229e4e8 d1;
    void *t1 = func_02006bf0(data_ov002_022cb92c, 4, 0);
    func_0201d428(&d1);
    int tmp1 = d1.field_0x14;
    d1.field_0x0 = (int)t1;
    d1.field_0x14 = (tmp1 & ~0xf) | 9;
    d1.field_0xc = 0x800;
    d1.field_0x10 = 0x40;
    func_0201e564(&d1);
    Task_Invoke(t1);

    Desc0229e4e8 d2;
    void *t2 = func_02006bf0(data_ov002_022cb940, 4, 0);
    func_0201d428(&d2);
    int tmp2 = d2.field_0x14;
    d2.field_0xc = 0x3600;
    d2.field_0x0 = (int)t2;
    d2.field_0x14 = (tmp2 & ~0xf) | 9;
    d2.field_0x10 = 0xa0;
    func_0201e564(&d2);
    Task_Invoke(t2);
}
