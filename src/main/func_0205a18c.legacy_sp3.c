extern void *__memcpy(void *dst, const void *src, unsigned long n);
extern char *func_02055298(char *str);
extern int func_0205a974(int *self, int key, int value);
extern int func_0205ae4c(void *a, char *b, char *c);
extern int func_0205ae8c(void *a, char *b, char *c);
extern int func_0205ffc0(void *p, char *msg);
extern void func_020604b0(char *dst, char *src, int n);
extern int func_020aaddc(const char *s);
extern int func_020ace00(const char *s);
extern unsigned char data_020c36d4[];
extern char data_021007c8[];
extern char data_021007e4[];
extern char data_021007f4[];
extern char data_021007fc[];
extern char data_0210080c[];
extern char data_02100814[];
extern char data_02100820[];
extern char data_0210082c[];
extern char data_02100838[];
extern char data_02100844[];
extern char data_02100850[];
extern char data_02100868[];
extern char data_02100878[];
extern char data_0210087c[];
extern char data_02100880[];
extern char data_02100884[];
extern char data_0210088c[];
extern char data_02100898[];
extern char data_021008ac[];
extern char data_021008c0[];
extern char data_021008cc[];
extern char data_021008d4[];
extern char data_021008dc[];
extern char data_021008e4[];
extern char data_021008ec[];
extern char data_021008f4[];
extern char data_021008fc[];
extern char data_02100904[];
int func_0205a18c(int *self, int key, char *value) {
    int base = *self;
    char buf[256];
    int result;
    if (!value) {
        func_0205ffc0(self, data_021007e4);
        return 2;
    }
    switch (key) {
    case 0x700:
        if (!*value) { func_0205ffc0(self, data_021007e4); return 2; }
        func_020604b0(buf, value, 31);
        func_020604b0((char *)(base + 0x110), buf, 31);
        result = func_0205ae8c(self, data_021007f4, buf);
        if (result) return result;
        break;
    case 0x701:
        if (!*value) { func_0205ffc0(self, data_021007e4); return 2; }
        func_020604b0(buf, value, 21);
        func_020604b0((char *)(base + 0x12f), buf, 21);
        result = func_0205ae8c(self, data_021007fc, buf);
        if (result) return result;
        break;
    case 0x702:
        if (!*value) { func_0205ffc0(self, data_021007e4); return 2; }
        func_020604b0(buf, value, 51);
        func_02055298(buf);
        func_020604b0((char *)(base + 0x144), buf, 51);
        result = func_0205ae4c(self, data_0210080c, buf);
        if (result) return result;
        break;
    case 0x703:
        if (!*value) { func_0205ffc0(self, data_021007e4); return 2; }
        func_020604b0(buf, value, 31);
        func_020604b0((char *)(base + 0x177), buf, 31);
        result = func_0205ae4c(self, data_02100814, buf);
        if (result) return result;
        break;
    case 0x704:
        func_020604b0(buf, value, 31);
        result = func_0205ae8c(self, data_02100820, buf);
        if (result) return result;
        break;
    case 0x705:
        func_020604b0(buf, value, 31);
        result = func_0205ae8c(self, data_0210082c, buf);
        if (result) return result;
        break;
    case 0x707:
        func_020604b0(buf, value, 76);
        result = func_0205ae8c(self, data_02100838, buf);
        if (result) return result;
        break;
    case 0x708:
        func_020604b0(buf, value, 11);
        result = func_0205ae8c(self, data_02100844, buf);
        if (result) return result;
        break;
    case 0x709:
        if (func_020aaddc(value) != 2) { func_0205ffc0(self, data_02100850); return 2; }
        func_020604b0(buf, value, 3);
        result = func_0205ae8c(self, data_02100868, buf);
        if (result) return result;
        break;
    case 0x70b:
        {
            int c = *value;
            c = (c < 0 || c >= 0x80) ? c : data_020c36d4[c];
            if ((char)c == 'M') { __memcpy(buf, data_02100878, 2); }
            else if ((char)c == 'F') { __memcpy(buf, data_0210087c, 2); }
            else { __memcpy(buf, data_02100880, 2); }
        }
        result = func_0205ae8c(self, data_02100884, buf);
        if (result) return result;
        break;
    case 0x706:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, data_0210088c, buf);
        if (result) return result;
        break;
    case 0x70d:
        result = func_0205a974(self, 0x70d, func_020ace00(value));
        if (result) return result;
        break;
    case 0x70e:
        result = func_0205a974(self, 0x70e, func_020ace00(value));
        if (result) return result;
        break;
    case 0x70f:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, data_02100898, buf);
        if (result) return result;
        break;
    case 0x710:
        result = func_0205a974(self, 0x710, func_020ace00(value));
        if (result) return result;
        break;
    case 0x711:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, data_021008ac, buf);
        if (result) return result;
        break;
    case 0x712:
        result = func_0205a974(self, 0x712, func_020ace00(value));
        if (result) return result;
        break;
    case 0x714:
        result = func_0205a974(self, 0x714, func_020ace00(value));
        if (result) return result;
        break;
    case 0x715:
        result = func_0205a974(self, 0x715, func_020ace00(value));
        if (result) return result;
        break;
    case 0x716:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, data_021008c0, buf);
        if (result) return result;
        break;
    case 0x717:
        func_020604b0(buf, value, 51);
        result = func_0205ae8c(self, data_021008cc, buf);
        if (result) return result;
        break;
    case 0x718:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, data_021008d4, buf);
        if (result) return result;
        break;
    case 0x719:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, data_021008dc, buf);
        if (result) return result;
        break;
    case 0x71a:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, data_021008e4, buf);
        if (result) return result;
        break;
    case 0x71b:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, data_021008ec, buf);
        if (result) return result;
        break;
    case 0x71c:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, data_021008f4, buf);
        if (result) return result;
        break;
    case 0x71d:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, data_021008fc, buf);
        if (result) return result;
        break;
    case 0x71e:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, data_02100904, buf);
        if (result) return result;
        break;
    default:
        func_0205ffc0(self, data_021007c8);
        return 2;
    }
    return 0;
}


