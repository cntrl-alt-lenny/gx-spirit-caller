typedef struct {
    char  _pad[0x10];
    short field10;
    char  _12[0x46];
    void *handle;
} mgr_020379f8_t;

extern mgr_020379f8_t data_0219b2e0;
extern short data_020fe480;
extern int func_0208aec8(int arg0);
extern int func_0208afac(void *handle, int flags, int id);

int func_020379f8(int id) {
    void *handle = data_0219b2e0.handle;

    if (handle == 0) {
        return 0;
    }
    if (data_0219b2e0.field10 >= 0) {
        return 0;
    }
    if (data_020fe480 >= 0) {
        func_0208aec8(id);
    } else if (func_0208afac(handle, 0x3000, id) == 0) {
        return 0;
    }
    data_020fe480 = id;
    return 1;
}
