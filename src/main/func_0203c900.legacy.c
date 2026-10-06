extern void *data_0219d9b8;
extern void *data_0219d9bc;
extern void *data_0219d9c0;
extern void *data_0219d9c4;
extern void *data_0219d9c8;

void *func_0203c900(int sel) {
    if (sel & 0x1) {
        return data_0219d9c8;
    }
    if (sel & 0x2) {
        return data_0219d9bc;
    }
    if (sel & 0x4) {
        return data_0219d9c0;
    }
    if (sel & 0x8) {
        return data_0219d9c4;
    }
    if (sel & 0x10) {
        return data_0219d9b8;
    }
    return 0;
}
