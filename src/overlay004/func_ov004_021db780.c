typedef struct { int scale; int mode; int unused[2]; void *entry; } Record;
extern char data_ov004_0220b500[];
extern int data_ov004_022915e8;
extern void func_ov004_021dab1c(void);
extern void func_ov004_021da848(int id);
extern void func_ov004_021dac7c(void);
extern void func_ov004_021db530(void);
extern void func_ov004_021da898(void);
extern void func_ov004_021ca0a4(Record *self, int a, int x, int y, void *p, int index);
/* The caller supplies a fourth argument although this callee does not use it. */
extern void func_ov004_021c9dd4(unsigned short *dst, unsigned short *src, int count, int flags);
static inline _Bool active(void) { return data_ov004_022915e8 != 0; }
int func_ov004_021db780(void) {
    char *b = data_ov004_0220b500;
    if (*(int *)(b + 0x4c) == *(int *)(b + 0x48) ) {
        if (active() == 0) {
        if (*(int *)(b + 0x3c90) != 0) {
            func_ov004_021dab1c();
            func_ov004_021da848(3);
        } else {
            func_ov004_021dac7c();
        }
    }
    }
    func_ov004_021db530();
    func_ov004_021ca0a4((Record *)(b + 0x5f90), 2, 0, 0, (void *)2, 31);
    func_ov004_021da898();
    func_ov004_021ca0a4((Record *)(b + 0x5f90), 2, 228, 3, (void *)2, *(int *)(b + 0xa0));
    func_ov004_021c9dd4((unsigned short *)0x05000638, (unsigned short *)(b + 0x5ef0), 4, 0x00600100);
    return 0;
}











