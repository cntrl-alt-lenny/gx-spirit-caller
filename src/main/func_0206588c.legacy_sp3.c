extern void *data_0219e958;
extern void *data_0219e95c;
extern void *data_0219e960;
extern void *data_0219e964;
extern char data_021015a0[];
extern char data_021015bc[];
extern void *func_02065934(void *param0, int param1);

int func_0206588c(void) {
    if (data_0219e964 == 0) {
        data_0219e964 = func_02065934(data_0219e95c, (int)data_021015a0);
    }
    if (data_0219e960 == 0) {
        data_0219e960 = func_02065934(data_0219e958, (int)data_021015bc);
    }
    if (data_0219e964 == 0 || data_0219e960 == 0) {
        return 0;
    }
    return 1;
}
