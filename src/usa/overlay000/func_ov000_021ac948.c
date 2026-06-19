/* func_ov000_021ac948: if the +0x98 ready bit (30) is set, build two scratch
 * records, dispatch the locked task, then clear the task slot + ready bit. */
extern void func_0207f79c(void *);
extern void func_0207f774(void *);
extern int func_0201eebc(int);
extern void func_0201edc8(int, int, int, void *, int);
extern void Task_InvokeLocked(int);
struct Ov000Task {
    char pad70[0x70];
    int task;        /* +0x70 = 112 */
    int f74;         /* +0x74 = 116 */
    int pad78;
    int f7c;         /* +0x7c = 124 */
    char pad80[0x18];
    unsigned flags;  /* +0x98 = 152 */
    unsigned f9c;    /* +0x9c = 156 */
};
void func_ov000_021ac948(struct Ov000Task *s) {
    char a[36];
    char b[20];
    if (((s->flags << 1) >> 31) == 0) {
        return;
    }
    func_0207f79c(a);
    func_0207f774(b);
    func_0201edc8(s->f74, s->f7c, func_0201eebc((s->flags << 15) >> 27), b,
                  s->f9c >> 16);
    Task_InvokeLocked(s->task);
    s->task = 0;
    s->flags &= ~0x40000000;
}
