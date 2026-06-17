/* func_0203c80c: allocate via func_0203c8b0(1), stash a0 at +12 and a status
 * byte (func_0203c838) at +10. SP3 tier (1.2/sp3). */
extern char *func_0203c8b0(int);
extern int func_0203c838(void);
void func_0203c80c(int a0){
    char *obj = func_0203c8b0(1);
    *(int *)(obj + 12) = a0;
    *(char *)(obj + 10) = (char)func_0203c838();
}
