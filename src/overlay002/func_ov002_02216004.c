extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_021c84a8(int a, int b);

int func_ov002_02216004(unsigned short *p, unsigned short *out) {
    int j, i;
    int best = -1;
    int value;
    for (j = 0; j < 2; j++) {
        for (i = 0; i < 5; i++) {
            if (func_ov002_0225764c((int)p, j, i)) {
                switch (*p) {
                case 0x1254:
                case 0x1540:
                case 0x17f2:
                    value = func_ov002_021c8470(j, i);
                    if (best < 0 || value > best) {
                        best = value;
                        if (out) *out = (unsigned char)j | ((unsigned char)i << 8);
                    }
                    break;
                case 0x12e3:
                case 0x195e:
                    value = func_ov002_021c8470(j, i);
                    if (best < 0 || value < best) {
                        best = value;
                        if (out) *out = (unsigned char)j | ((unsigned char)i << 8);
                    }
                    break;
                case 0x1711:
                    value = func_ov002_021c84a8(j, i);
                    if (best < 0 || value > best) {
                        best = value;
                        if (out) *out = (unsigned char)j | ((unsigned char)i << 8);
                    }
                    break;
                }
            }
        }
    }
    return best;
}

