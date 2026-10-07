extern int data_021a5204;
extern int data_021a5208;
extern char data_021a520c[];
extern char data_021a522c[];
extern char data_021a5340[];
extern void *data_021a5800;

extern void func_02088620(void);
extern void func_02092614(void *a, void *b, int n);
extern void func_02091d24(void *thr, void *entry, int arg, void *stack, int size, int prio);
extern void func_020919d8(void *thr);

void func_02088dd8(int prio)
{
    if (data_021a5204 != 0) {
        return;
    }
    data_021a5208 = 0;
    func_02092614(data_021a520c, data_021a522c, 8);
    func_02091d24(data_021a5340, func_02088620, 0, &data_021a5800, 0x400, prio);
    data_021a5204 = 1;
    func_020919d8(data_021a5340);
}
