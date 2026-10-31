typedef struct {
    char *name;
    char **aliases;
    unsigned short addrtype;
    unsigned short length;
    unsigned int **addr_list;
} hostent_0206ebe8_t;
extern int func_02054c0c(int a);
extern hostent_0206ebe8_t *func_0206ebe8(char *name);
extern void func_020a6d54(int a, int b, int c, int d);
extern void *func_020a7368(void *dst, signed char *src, int count);
extern char *Strchr(char *s, int c);
/* This caller supplies only r0 to the four-parameter conversion thunk. */
extern int func_020ace00();
extern char data_02101554[];
extern char data_02101578[];
extern unsigned short data_020c3754[];

int func_02064dfc(char *name, int *addr_out, unsigned short *port_out) {
    char buf[256];
    char *colon;
    int addr;
    unsigned short port;
    int len;
    char *p;
    int value;
    hostent_0206ebe8_t *host;
    if (!name || !*name) {
        addr = 0;
        port = 0;
    } else {
        colon = Strchr(name, ':');
        if (!colon) {
            port = 0;
        } else {
            if (colon == name) {
                name = 0;
                addr = 0;
            } else {
                len = colon - name;
                if (len >= 256)
                    func_020a6d54((int)(data_02101554 + 4), (int)data_02101578, 0, 0x81);
                func_020a7368(buf, (signed char *)name, len);
                name = buf;
                name[len] = 0;
            }
            p = colon + 1;
            while (*p) {
                if (!((*p < 0 || *p >= 128) ? 0 : data_020c3754[*p] & 8))
                    return 0;
                ++p;
            }
            value = func_020ace00((int)(colon + 1));
            if (value < 0 || value > 65535)
                return 0;
            port = (unsigned short)value;
        }
        if (name) {
            addr = func_02054c0c((int)name);
            if (addr == -1) {
                host = func_0206ebe8(name);
                if (!host) return 0;
                addr = **host->addr_list;
            }
        }
    }
    if (addr_out) *addr_out = addr;
    if (port_out) *port_out = port;
    return 1;
}

