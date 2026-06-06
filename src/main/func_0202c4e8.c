/* func_0202c4e8: func_0202c4b4(); store func_02006c0c(&tbl,4,0) at *(global->f8). */
extern char data_020c6b58[];
extern char data_0219a93c[];
extern void func_0202c4b4(void);
extern int func_02006c0c(void *, int, int);
void func_0202c4e8(void){
    int r;
    func_0202c4b4();
    r = func_02006c0c(data_020c6b58, 4, 0);
    *(*(int **)(data_0219a93c + 8)) = r;
}
