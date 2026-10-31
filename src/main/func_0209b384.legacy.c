typedef struct { int f_0; int f_4; int f_8; int f_c; } state_021_4clear_t;
typedef struct { unsigned short flag; unsigned short pad; int value; } Entry;
extern unsigned short data_021a83cc;
extern int data_021a83e4[4];
extern Entry data_021a840c[5];
extern state_021_4clear_t data_021a83f4;
extern int data_021a83dc;
extern void func_02096228(void *p);
extern int func_0209640c(int bit, int idx);
extern void func_02096434(int slot, int value);
extern void func_0209b298(int, int, int);
extern void func_02092844(state_021_4clear_t *p);
void func_0209b384(void) {
    int i;
    if (data_021a83cc != 0) return;
    data_021a83cc = 1;
    data_021a83e4[0] = 0;
    data_021a83e4[1] = 0;
    func_02096228(data_021a83e4);
    while (func_0209640c(8, 1) == 0) {}
    func_02096434(8, (int)func_0209b298);
    for (i = 0; i < 5; i++) data_021a840c[i].flag = 0;
    func_02092844(&data_021a83f4);
    data_021a83dc = *(int *)0x027ffc3c;
}
