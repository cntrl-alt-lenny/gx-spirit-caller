/* func_ov002_022aaf38: if player==0 or *(arg0+8)==player, return (no-op).
 * Else record player, open a task handle, fetch its work buffer via
 * func_0201d710, blit into buffer+(player-1)*0x100 via func_0208f920,
 * then Task_Invoke the handle.
 */

extern int func_02006c0c(void *a, int b, int c);
extern void *func_0201d710(void *self);
extern void func_0208f920(void *a, int b, unsigned int c);
extern void Task_Invoke(void *task);
extern char data_ov002_022cc498[];

void func_ov002_022aaf38(void *arg0, int player) {
    void *h;
    void *p;

    if (player == 0 || *(int *)((char *)arg0 + 8) == player) return;
    *(int *)((char *)arg0 + 8) = player;
    h = (void *)func_02006c0c(data_ov002_022cc498, 4, 0);
    p = func_0201d710(h);
    func_0208f920((char *)p + (player - 1) * 0x100, 0x1f40, 0x100);
    Task_Invoke(h);
}
