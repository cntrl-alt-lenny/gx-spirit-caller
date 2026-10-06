typedef struct {
    char          *name;
    char         **aliases;
    unsigned short addrtype;
    unsigned short length;
    unsigned int **addr_list;
} hostent_0206ebe8_t;

extern char data_0219edbc[];
extern hostent_0206ebe8_t data_0219ed64;
extern unsigned int *data_0219ed5c[2];
extern unsigned int data_0219ed50;
extern unsigned int func_0206e284(void *arg0);
extern void func_020945f4(void *p, int b, int c);
extern void func_020a6a94(void *dst, void *src, int n);

hostent_0206ebe8_t *func_0206ebe8(char *name) {
    unsigned int addr = func_0206e284(name);
    unsigned int net;

    if (addr == 0) {
        return 0;
    }
    func_020945f4(data_0219edbc, 0, 0x101);
    func_020a6a94(data_0219edbc, name, 0x101);
    net = ((addr >> 24) & 0xff) | ((addr >> 8) & 0xff00) | ((addr << 8) & 0xff0000) | ((addr << 24) & 0xff000000);
    data_0219ed64.name = data_0219edbc;
    data_0219ed64.aliases = 0;
    data_0219ed64.addrtype = 2;
    data_0219ed64.length = 4;
    data_0219ed64.addr_list = data_0219ed5c;
    data_0219ed5c[0] = &data_0219ed50;
    data_0219ed5c[1] = 0;
    data_0219ed50 = net;
    return &data_0219ed64;
}
