extern char data_020c6a88[];
extern int data_020b4768;
extern int *func_02006c0c(void *a, int b, int c);
extern int func_0202b0e0(int i);
extern void Task_InvokeLocked(void *p);

int func_0202b74c(int key) {
    int r = -1;
    int *tab;
    int i;
    if (key == 0) {
        return r;
    }
    tab = func_02006c0c(data_020c6a88, 4, 0);
    for (i = 1; i < data_020b4768; i++) {
        if (key == tab[i]) {
            r = func_0202b0e0(i);
            break;
        }
    }
    if (tab != 0) {
        Task_InvokeLocked(tab);
    }
    return r;
}
