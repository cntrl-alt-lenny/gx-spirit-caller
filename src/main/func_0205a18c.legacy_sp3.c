extern void *__memcpy(void *dst, const void *src, unsigned long n);
extern char *func_02055298(char *str);
extern int func_0205a974(int *self, int key, int value);
extern int func_0205ae4c(int *a, int b, int c);
extern int func_0205ae8c(int *a, int b, int c);
extern int func_0205ffc0(int *p, int b);
extern void func_020604b0(char *dst, char *src, int n);
extern int func_020aaddc(const char *s);
/* The original caller supplies only r0 to this four-argument parser thunk. */
extern int func_020ace00();
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
        func_0205ffc0(self, (int)data_021007e4);
        return 2;
    }
    switch (key) {
    case 0x700:
        if (!*value) { func_0205ffc0(self, (int)data_021007e4); return 2; }
        func_020604b0(buf, value, 31);
        func_020604b0((char *)(base + 0x110), buf, 31);
        result = func_0205ae8c(self, (int)data_021007f4, (int)buf);
        if (result) return result;
        break;
    case 0x701:
        if (!*value) { func_0205ffc0(self, (int)data_021007e4); return 2; }
        func_020604b0(buf, value, 21);
        func_020604b0((char *)(base + 0x12f), buf, 21);
        result = func_0205ae8c(self, (int)data_021007fc, (int)buf);
        if (result) return result;
        break;
    case 0x702:
        if (!*value) { func_0205ffc0(self, (int)data_021007e4); return 2; }
        func_020604b0(buf, value, 51);
        func_02055298(buf);
        func_020604b0((char *)(base + 0x144), buf, 51);
        result = func_0205ae4c(self, (int)data_0210080c, (int)buf);
        if (result) return result;
        break;
    case 0x703:
        if (!*value) { func_0205ffc0(self, (int)data_021007e4); return 2; }
        func_020604b0(buf, value, 31);
        func_020604b0((char *)(base + 0x177), buf, 31);
        result = func_0205ae4c(self, (int)data_02100814, (int)buf);
        if (result) return result;
        break;
    case 0x704:
        func_020604b0(buf, value, 31);
        result = func_0205ae8c(self, (int)data_02100820, (int)buf);
        if (result) return result;
        break;
    case 0x705:
        func_020604b0(buf, value, 31);
        result = func_0205ae8c(self, (int)data_0210082c, (int)buf);
        if (result) return result;
        break;
    case 0x707:
        func_020604b0(buf, value, 76);
        result = func_0205ae8c(self, (int)data_02100838, (int)buf);
        if (result) return result;
        break;
    case 0x708:
        func_020604b0(buf, value, 11);
        result = func_0205ae8c(self, (int)data_02100844, (int)buf);
        if (result) return result;
        break;
    case 0x709:
        if (func_020aaddc(value) != 2) { func_0205ffc0(self, (int)data_02100850); return 2; }
        func_020604b0(buf, value, 3);
        result = func_0205ae8c(self, (int)data_02100868, (int)buf);
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
        result = func_0205ae8c(self, (int)data_02100884, (int)buf);
        if (result) return result;
        break;
    case 0x706:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, (int)data_0210088c, (int)buf);
        if (result) return result;
        break;
    case 0x70d:
        result = func_0205a974(self, 0x70d, func_020ace00((int)value));
        if (result) return result;
        break;
    case 0x70e:
        result = func_0205a974(self, 0x70e, func_020ace00((int)value));
        if (result) return result;
        break;
    case 0x70f:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, (int)data_02100898, (int)buf);
        if (result) return result;
        break;
    case 0x710:
        result = func_0205a974(self, 0x710, func_020ace00((int)value));
        if (result) return result;
        break;
    case 0x711:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, (int)data_021008ac, (int)buf);
        if (result) return result;
        break;
    case 0x712:
        result = func_0205a974(self, 0x712, func_020ace00((int)value));
        if (result) return result;
        break;
    case 0x714:
        result = func_0205a974(self, 0x714, func_020ace00((int)value));
        if (result) return result;
        break;
    case 0x715:
        result = func_0205a974(self, 0x715, func_020ace00((int)value));
        if (result) return result;
        break;
    case 0x716:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, (int)data_021008c0, (int)buf);
        if (result) return result;
        break;
    case 0x717:
        func_020604b0(buf, value, 51);
        result = func_0205ae8c(self, (int)data_021008cc, (int)buf);
        if (result) return result;
        break;
    case 0x718:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, (int)data_021008d4, (int)buf);
        if (result) return result;
        break;
    case 0x719:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, (int)data_021008dc, (int)buf);
        if (result) return result;
        break;
    case 0x71a:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, (int)data_021008e4, (int)buf);
        if (result) return result;
        break;
    case 0x71b:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, (int)data_021008ec, (int)buf);
        if (result) return result;
        break;
    case 0x71c:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, (int)data_021008f4, (int)buf);
        if (result) return result;
        break;
    case 0x71d:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, (int)data_021008fc, (int)buf);
        if (result) return result;
        break;
    case 0x71e:
        func_020604b0(buf, value, 256);
        result = func_0205ae8c(self, (int)data_02100904, (int)buf);
        if (result) return result;
        break;
    default:
        func_0205ffc0(self, (int)data_021007c8);
        return 2;
    }
    return 0;
}


