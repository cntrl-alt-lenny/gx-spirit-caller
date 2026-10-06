typedef struct {
    unsigned char  len;
    unsigned char  family;
    unsigned short port;
    unsigned int   addr;
} sockaddr_0206ee40_t;

extern int func_0206c8ac(void *s, unsigned short port, unsigned int addr);

int func_0206ee40(void *s, sockaddr_0206ee40_t *sa) {
    unsigned int a = sa->addr;

    return func_0206c8ac(s, ((sa->port >> 8) & 0xff) | ((sa->port << 8) & 0xff00),
                         ((a >> 24) & 0xff) | ((a >> 8) & 0xff00) | ((a << 8) & 0xff0000) | ((a << 24) & 0xff000000));
}
