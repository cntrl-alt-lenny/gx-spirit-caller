typedef struct { unsigned char bytes[20]; } SmallPacket;
typedef struct { unsigned char bytes[21]; } Packet;
typedef struct { char _0[8]; int key; } entry_02065fa8_t;
typedef struct Object Object;
typedef struct Header Header;
typedef struct obj_020652b8 obj_020652b8_t;
typedef struct pkt_020652b8 pkt_020652b8_t;
typedef struct hdr_020652b8 hdr_020652b8_t;
typedef struct obj_020653a0 obj_020653a0_t;
typedef struct pkt_020653a0 pkt_020653a0_t;
extern int func_02065e14(int arg);
extern entry_02065fa8_t *func_02065fa8(int key);
extern void func_020651a8(Object *o, Packet *p, Header *h);
extern void func_020652b8(obj_020652b8_t *o, pkt_020652b8_t *pk, hdr_020652b8_t *h);
extern void func_020653a0(obj_020653a0_t *o, pkt_020653a0_t *pk, int x);
void func_0206504c(unsigned char *p, int len, int arg) {
    SmallPacket small;
    Packet packet;
    unsigned char type;
    unsigned int key;
    entry_02065fa8_t *o;
    if (func_02065e14((int)p) == 0) return;
    type = p[7];
    if (type == 5 || type == 7) {
        if (len < 20) return;
        small = *(SmallPacket *)p;
        key = *(unsigned int *)&small.bytes[8];
        o = func_02065fa8(((key >> 24) & 0xff) | ((key >> 8) & 0xff00) | ((key << 8) & 0xff0000) | ((key << 24) & 0xff000000));
        if (o == 0) return;
        if (type == 5) {
            func_020653a0((obj_020653a0_t *)o, (pkt_020653a0_t *)&small, arg);
        } else {
            func_020652b8((obj_020652b8_t *)o, (pkt_020652b8_t *)&small, (hdr_020652b8_t *)arg);
        }
    } else {
        if (len < 21) return;
        packet = *(Packet *)p;
        key = *(unsigned int *)&packet.bytes[8];
        o = func_02065fa8(((key >> 24) & 0xff) | ((key >> 8) & 0xff00) | ((key << 8) & 0xff0000) | ((key << 24) & 0xff000000));
        if (o == 0) return;
        func_020651a8((Object *)o, &packet, (Header *)arg);
    }
}
