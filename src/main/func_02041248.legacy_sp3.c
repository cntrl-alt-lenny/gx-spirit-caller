extern int func_020aaddc(const char *s);
extern char *func_020aaec0(char *dst, const char *src, unsigned int n);
extern unsigned char *func_020ab0c4(unsigned char *haystack, const unsigned char *needle);
/* This caller supplies only the string; the thunk's other parameters are unused here. */
extern int func_020ace00();
extern unsigned char data_020fe894[], data_020fe89c[], data_020fe8a8[], data_020fe8ac[];
typedef struct {
    char pad[0x1024];
    char text[0x100];
    unsigned char *host;
    unsigned char *path;
    int mode;
    unsigned short port;
} Context;
int func_02041248(Context *self, const char *text) {
    unsigned char *port = 0;
    unsigned char *p;
    int length;
    if ((unsigned int)func_020aaddc(text) >= 0x100) return 0;
    func_020aaec0(self->text, text, 0x100);
    length = func_020aaddc(text);
    if (length != func_020aaddc(self->text)) return 0;
    p = func_020ab0c4((unsigned char *)self->text, data_020fe894);
    if (p) {
        self->host = (unsigned char *)self + 0x102b;
        self->mode = 0;
        self->port = 0x50;
    } else {
        p = func_020ab0c4((unsigned char *)self->text, data_020fe89c);
        if (!p) return 0;
        self->host = p + 8;
        self->mode = 1;
        self->port = 0x1bb;
    }
    p = func_020ab0c4(self->host, data_020fe8a8);
    if (p) {
        *p = 0;
        port = p + 1;
    }
    p = func_020ab0c4(self->host, data_020fe8ac);
    if (!p) {
        self->path = 0;
    } else {
        *p = 0;
        self->path = p + 1;
    }
    if (port) self->port = func_020ace00(port);
    return 1;
}

