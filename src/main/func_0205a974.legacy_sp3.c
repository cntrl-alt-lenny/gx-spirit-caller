extern int func_0205ae4c(int *a, int b, int c);
extern int func_0205ae8c(int *a, int b, int c);
extern int func_0205ffc0(int *p, int b);
extern int func_020a978c(char *dst, const char *fmt, ...);
extern char data_021007c4[];
extern char data_021007c8[];
extern char data_02100844[];
extern char data_02100878[];
extern char data_0210087c[];
extern char data_02100880[];
extern char data_02100884[];
extern char data_0210088c[];
extern char data_021008d4[];
extern char data_021008dc[];
extern char data_021008e4[];
extern char data_021008ec[];
extern char data_021008f4[];
extern char data_021008fc[];
extern char data_02100904[];
extern char data_0210090c[];
extern char data_02100920[];
extern char data_02100930[];
extern char data_02100940[];
extern char data_0210094c[];
extern char data_02100958[];
extern char data_02100968[];
extern char data_02100978[];
extern char data_02100988[];
extern char data_0210099c[];
int func_0205a974(int *self, int key, int value) {
    char buf[16];
    int result;
    switch (key) {
    case 0x708:
        if (value < 0) {
            func_0205ffc0(self, (int)data_0210090c);
            return 2;
        }
        func_020a978c(buf, data_021007c4, value);
        result = func_0205ae8c(self, (int)data_02100844, (int)buf);
        if (result) return result;
        break;
    case 0x70b:
        switch (value) {
        case 0x500:
            result = func_0205ae8c(self, (int)data_02100884, (int)data_02100878);
            if (result) return result;
            break;
        case 0x501:
            result = func_0205ae8c(self, (int)data_02100884, (int)data_0210087c);
            if (result) return result;
            break;
        case 0x502:
            result = func_0205ae8c(self, (int)data_02100884, (int)data_02100880);
            if (result) return result;
            break;
        default:
            func_0205ffc0(self, (int)data_02100920);
            return 2;
        }
        break;
    case 0x706:
        func_020a978c(buf, data_021007c4, value);
        result = func_0205ae8c(self, (int)data_0210088c, (int)buf);
        if (result) return result;
        break;

    case 0x70c:
        func_020a978c(buf, data_021007c4, value);
        result = func_0205ae4c(self, (int)data_02100930, (int)buf);
        if (result) return result;
        break;

    case 0x70d:
        func_020a978c(buf, data_021007c4, value);
        result = func_0205ae4c(self, (int)data_02100940, (int)buf);
        if (result) return result;
        break;

    case 0x70e:
        func_020a978c(buf, data_021007c4, value / 16);
        result = func_0205ae4c(self, (int)data_0210094c, (int)buf);
        if (result) return result;
        break;

    case 0x710:
        func_020a978c(buf, data_021007c4, value / 4);
        result = func_0205ae4c(self, (int)data_02100958, (int)buf);
        if (result) return result;
        break;

    case 0x712:
        func_020a978c(buf, data_021007c4, value / 4);
        result = func_0205ae4c(self, (int)data_02100968, (int)buf);
        if (result) return result;
        break;

    case 0x713:
        func_020a978c(buf, data_021007c4, value);
        result = func_0205ae4c(self, (int)data_02100978, (int)buf);
        if (result) return result;
        break;

    case 0x714:
        func_020a978c(buf, data_021007c4, value);
        result = func_0205ae4c(self, (int)data_02100988, (int)buf);
        if (result) return result;
        break;

    case 0x715:
        if (value != 0) value = 1;
        func_020a978c(buf, data_021007c4, value);
        result = func_0205ae4c(self, (int)data_0210099c, (int)buf);
        if (result) return result;
        break;

    case 0x718:
        func_020a978c(buf, data_021007c4, value);
        result = func_0205ae8c(self, (int)data_021008d4, (int)buf);
        if (result) return result;
        break;

    case 0x719:
        func_020a978c(buf, data_021007c4, value);
        result = func_0205ae8c(self, (int)data_021008dc, (int)buf);
        if (result) return result;
        break;

    case 0x71a:
        func_020a978c(buf, data_021007c4, value);
        result = func_0205ae8c(self, (int)data_021008e4, (int)buf);
        if (result) return result;
        break;

    case 0x71b:
        func_020a978c(buf, data_021007c4, value);
        result = func_0205ae8c(self, (int)data_021008ec, (int)buf);
        if (result) return result;
        break;

    case 0x71c:
        func_020a978c(buf, data_021007c4, value);
        result = func_0205ae8c(self, (int)data_021008f4, (int)buf);
        if (result) return result;
        break;

    case 0x71d:
        func_020a978c(buf, data_021007c4, value);
        result = func_0205ae8c(self, (int)data_021008fc, (int)buf);
        if (result) return result;
        break;

    case 0x71e:
        func_020a978c(buf, data_021007c4, value);
        result = func_0205ae8c(self, (int)data_02100904, (int)buf);
        if (result) return result;
        break;
    default:
        func_0205ffc0(self, (int)data_021007c8);
        return 2;
    }
    return 0;
}

