typedef struct {
    char *h_name;
    char **h_aliases;
    unsigned short h_addrtype;
    unsigned short h_length;
    char **h_addr_list;
} HostEnt;
extern HostEnt *func_02054f44(void);
extern int func_02054ec0(unsigned int *addr);

unsigned int func_02065d4c(void) {
    int i;
    HostEnt *host;
    int result = 0;
    unsigned int *addr;
    host = func_02054f44();
    if (host == 0) return result;
    for (i = 0; ; i++) {
        addr = (unsigned int *)host->h_addr_list[i];
        if (addr == 0) break;
        if (*addr != 0x0100007f) {
            result = *addr;
            if (func_02054ec0(addr) != 0) return result;
        }
    }
    return result;
}



