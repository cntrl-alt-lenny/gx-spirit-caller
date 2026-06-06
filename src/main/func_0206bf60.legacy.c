/* func_0206bf60: if a0, func_0209256c(&tbl, a0, 0). Legacy 1.2/sp2p3. */
extern char data_0219ed20[];
extern void func_0209256c(void *, int, int);
void func_0206bf60(int a0){
    if (a0 == 0) return;
    func_0209256c(data_0219ed20, a0, 0);
}
