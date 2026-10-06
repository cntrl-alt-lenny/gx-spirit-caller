typedef struct {
    char *h_name;
    char **h_aliases;
    unsigned short h_addrtype;
    unsigned short h_length;
    char **h_addr_list;
} HostEnt;

extern HostEnt data_0219e4d4;
extern char *data_0219e4f8[2];
extern int data_0219e4e4;
extern char *data_0219e4cc[];
extern char data_020ffc04[];
extern int func_0206e174(void);
extern void func_0206e670(unsigned int v, unsigned char *dst);

HostEnt *func_02054f44(void) {
    data_0219e4d4.h_name = data_020ffc04;
    data_0219e4d4.h_aliases = data_0219e4cc;
    data_0219e4d4.h_addrtype = 2;
    data_0219e4d4.h_length = 0;
    data_0219e4d4.h_addr_list = data_0219e4f8;
    data_0219e4e4 = 0;
    func_0206e670(func_0206e174(), (unsigned char *)&data_0219e4e4);
    if (data_0219e4e4 == 0) {
        return 0;
    }
    data_0219e4f8[0] = (char *)&data_0219e4e4;
    data_0219e4d4.h_length = 4;
    data_0219e4f8[1] = 0;
    return &data_0219e4d4;
}
