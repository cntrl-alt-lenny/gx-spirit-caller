typedef struct { int state; unsigned char pad[0x4ac]; void *socket; } Obj;
typedef struct { unsigned char pad[0x4b0]; void *field_4b0; } Obj_0206adfc_t;
/* This caller supplies four arguments although the existing callee definition takes void. */
extern int func_02054cf8(void *, void *, int, int);
extern int func_0206ab88(void *, int, int, int, int);
extern int func_0206adfc(Obj_0206adfc_t *, void *, void *);
extern void *__memcpy(void *, const void *, unsigned long);
typedef struct { unsigned char b[4]; } Bytes4;
int func_0206950c(Obj *o, unsigned int addr, unsigned short port, void *data, int len) {
    unsigned short size;
    unsigned char packet[16];
    int result;
    if (o->state == 1) func_0206ab88(o, 0, 0, 2, 0);
    if (o->state == 1) return 3;
    size = (((unsigned short)(len + 9) >> 8) & 0xff) | (((unsigned short)(len + 9) << 8) & 0xff00);
    __memcpy(packet, &size, 2);
    packet[2] = 2;
    __memcpy(packet + 3, &addr, 4);
    __memcpy(packet + 7, &port, 2);
    result = func_0206adfc((Obj_0206adfc_t *)o, packet, (void *)9);
    if (result != 0) return result;
    if (func_02054cf8(o->socket, data, len, 0) < 0) return 3;
    return 0;
}





