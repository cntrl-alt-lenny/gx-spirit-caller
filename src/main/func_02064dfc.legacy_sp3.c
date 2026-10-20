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
/* Original caller supplies only r0 to this four-argument thunk. */
extern int func_020ace00();
extern char data_02101554[];
extern char data_02101578[];
extern unsigned short data_020c3754[];

int func_02064dfc(char *name, unsigned int *addr, unsigned short *port) {
    char buf[256];
    unsigned int ip;
    unsigned short p;
    char *colon;
    int len;
    char *s;
    int value;
    hostent_0206ebe8_t *host;
    if (!name || !*name) {
        ip = 0;
        p = 0;
    } else {
        colon = Strchr(name, ':');
        if (!colon) {
            p = 0;
        } else {
            if (colon == name) {
                name = 0;
                ip = 0;
            } else {
                len = colon - name;
                if (len >= 256)
                    func_020a6d54((int)(data_02101554 + 4), (int)data_02101578, 0, 129);
                func_020a7368(buf, (signed char *)name, len);
                name = buf;
                name[len] = 0;
            }
            s = colon + 1;
            while (*s) {
                if (!((*s < 0 || *s >= 128) ? 0 : (data_020c3754[*s] & 8)))
                    return 0;
                ++s;
            }
            value = func_020ace00((int)(colon + 1));
            if (value < 0 || value > 65535)
                return 0;
            p = (unsigned short)value;
        }
        if (name) {
            ip = func_02054c0c((int)name);
            if (ip == -1) {
                host = func_0206ebe8(name);
                if (!host)
                    return 0;
                ip = **host->addr_list;
            }
        }
    }
    if (addr) *addr = ip;
    if (port) *port = p;
    return 1;
}

