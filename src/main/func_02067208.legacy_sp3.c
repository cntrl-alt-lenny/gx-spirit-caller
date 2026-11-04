typedef struct {
    char *h_name;
    char **h_aliases;
    unsigned short h_addrtype;
    unsigned short h_length;
    char **h_addr_list;
} HostEnt;
extern HostEnt *func_02054f44(void);
extern void *__memcpy(void *dst, const void *src, unsigned long n);
extern int data_0219eb6c;
extern unsigned int data_0219eb70[5];
void func_02067208(void) {
    HostEnt *host = func_02054f44();
    if (host == 0) return;
    for (data_0219eb6c = 0; data_0219eb6c < 5; data_0219eb6c++) {
        char *address = host->h_addr_list[data_0219eb6c];
        if (address == 0) return;
        __memcpy(&data_0219eb70[data_0219eb6c], address, 4);
    }
}
