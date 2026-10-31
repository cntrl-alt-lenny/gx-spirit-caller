typedef struct { int count; char pad[0x44]; int next, current, previous; char pad2[8]; int fade; } State;
typedef struct { int state, hover, choice, height, y, timer, mode; } Dialog;
extern State data_ov004_0220b500;
extern Dialog data_ov004_022915e8;
extern void func_02005ca0(int which);
extern void func_02005e20(int which);
extern void func_0208c884(unsigned short *a0, int a1);
extern void func_ov004_021ca198(void);
extern void func_ov004_021ce1ec(void);
extern int func_ov004_021d6734(void);
extern void func_ov004_021d7910(void);
extern int func_ov004_021d83b0(void);
extern void func_ov004_021d8608(void);
extern int func_ov004_021d8d58(Dialog *p);
extern void func_ov004_021d9134(Dialog *p);
extern void func_ov004_021d9418(void);
extern int func_ov004_021d9d58(void);
extern void func_ov004_021d9ea4(void);
extern void func_ov004_021da36c(void);
extern int func_ov004_021db780(void);
extern int func_ov004_021db860(void);
int func_ov004_021d6a10(void) {
    State *b = &data_ov004_0220b500;
    if (b->next != b->current) {
        if (b->fade < 16) b->fade++;
    } else {
        if (b->fade != 0) b->fade--;
    }
    switch (b->current) {
    case 1: func_ov004_021d83b0(); break;
    case 0: func_ov004_021db780(); break;
    case 2: func_ov004_021d9d58(); break;
    }
    func_ov004_021d6734();
    func_ov004_021d8d58(&data_ov004_022915e8);
    func_ov004_021d9134(&data_ov004_022915e8);
    func_ov004_021ca198();
    func_ov004_021ce1ec();
    b->count++;
    func_02005e20(1);
    func_02005e20(2);
    func_02005ca0(1);
    func_02005ca0(2);
    func_0208c884((unsigned short *)0x0400006c, -b->fade);
    func_0208c884((unsigned short *)0x0400106c, -b->fade);
    if (b->fade == 16) {
        switch (b->current) {
        case 1: func_ov004_021d8608(); break;
        case 0: func_ov004_021db860(); break;
        case 2: func_ov004_021d9ea4(); break;
        }
        b->previous = b->current;
        b->current = b->next;
        switch (b->current) {
        case 1: func_ov004_021d7910(); break;
        case 0: func_ov004_021da36c(); break;
        case 2: func_ov004_021d9418(); break;
        default: return 1;
        }
    }
    return 0;
}
