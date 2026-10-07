extern int func_0209bf18(void *time);
extern int func_0209bf34(void *date);

long long func_0209bea0(void *date, void *time) {
    int days = func_0209bf34(date);
    int secs;
    if (days == -1) {
        return -1;
    }
    secs = func_0209bf18(time);
    if (secs == -1) {
        return -1;
    }
    return (long long)days * 86400 + secs;
}
