extern int Strlen(void);
extern int func_0202b100(int a0);
extern int func_0202c208(int a0);
extern int func_0202c228(int a0);
extern void func_020a6afc(void *a0, int a1);
extern char data_02104f4c[];

int func_ov020_021aa4a0(void *arg0, signed char *arg1) {
    signed char *p;
    char *out;
    int total;
    signed char c;
    signed char c2;
    int a, b, n;

    p = arg1;
    out = (char *)arg0;
    total = 0;
    c = *p;
    if (c != 0) {
        do {
            if (((unsigned int)(*(int *)(data_02104f4c + 4) << 0x1D) >> 0x1D) == 0 && (c & 0x80)) {
                if (out != 0) {
                    out[0] = c;
                    out[1] = p[1];
                    out += 2;
                }
                p += 2;
                total += 2;
            } else if (c == 0x40) {
                c2 = p[1];
                switch (c2) {
                case 0x63:
                    a = ((p[4] - 0x30) * 0xA) + (((p[2] - 0x30) * 0x3E8) + ((p[3] - 0x30) * 0x64));
                    b = p[5] - 0x30;
                    func_0202b100(b + a);
                    n = Strlen();
                    if (out != 0) {
                        func_020a6afc(out, func_0202b100(b + a));
                        out += n;
                    }
                    total += n;
                    p += 6;
                    break;
                case 0x61:
                    a = (p[2] - 0x30) * 0xA;
                    b = p[3] - 0x2F;
                    func_0202c228(b + a);
                    n = Strlen();
                    if (out != 0) {
                        func_020a6afc(out, func_0202c228(b + a));
                        out += n;
                    }
                    total += n;
                    p += 4;
                    break;
                case 0x74:
                    a = (p[2] - 0x30) * 0xA;
                    b = p[3] - 0x2F;
                    func_0202c208(b + a);
                    n = Strlen();
                    if (out != 0) {
                        func_020a6afc(out, func_0202c208(b + a));
                        out += n;
                    }
                    total += n;
                    p += 4;
                    break;
                default:
                    if (out != 0) {
                        out[0] = c;
                        out += 1;
                    }
                    p += 1;
                    total += 1;
                    break;
                }
            } else {
                if (out != 0) {
                    out[0] = c;
                    out += 1;
                }
                p += 1;
                total += 1;
            }
            c = *p;
        } while (c != 0);
    }
    return total;
}
