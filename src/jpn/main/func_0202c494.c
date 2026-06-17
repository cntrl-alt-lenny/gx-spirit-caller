/* func_0202c494: func_0202c460(); store func_02006bf0(&tbl,4,0) at *(global->f8). */
extern char data_020c6a78[];
extern char data_0219a85c[];
extern void func_0202c460(void);
extern int func_02006bf0(void *, int, int);
void func_0202c494(void){
    int r;
    func_0202c460();
    r = func_02006bf0(data_020c6a78, 4, 0);
    *(*(int **)(data_0219a85c + 8)) = r;
}
