/* func_0203f650: return !func_020a734c(a0, data_020fe464, 8). SP3 tier (1.2/sp3). */
extern char data_020fe464[];
extern int func_020a734c(int, void *, int);
int func_0203f650(int a0){
    return func_020a734c(a0, data_020fe464, 8) == 0;
}
