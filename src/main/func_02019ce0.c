extern char *GetSystemWork(void);

int func_02019ce0(int id, unsigned char *out) {
    int count;
    GetSystemWork();
    count = 0;
    switch (id) {
    case 0x1b: out[count++] = 1; break;
    case 0x3f: out[count++] = 2; break;
    case 0x1c: out[count++] = 3; break;
    case 0x5e: out[count++] = 4; break;
    case 0x19: out[count++] = 5; break;
    case 0x3e: out[count++] = 9; break;
    case 0x39: out[count++] = 0xa; break;
    case 0x29: out[count++] = 0x11; break;
    case 0x36: out[count++] = 0x13; break;
    case 0x38: out[count++] = 0x14; break;
    case 0x35: out[count++] = 0x15; break;
    case 0x3a:
    case 0x48: out[count++] = 0x16; break;
    case 0x31:
        out[count++] = 6;
        out[count++] = 0x12;
        break;
    case 5:
    case 0x4b:
        out[count++] = 8;
        out[count++] = 7;
        break;
    }
    return count;
}
