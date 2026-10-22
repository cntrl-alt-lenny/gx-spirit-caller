typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
extern struct {
    u8 pad[0xd0c];
    int active;
} data_ov002_022d016c;
extern struct {
    u8 pad[0x5d4];
    u32 count;
    u8 pad2[4];
    u8 bytes[32];
    u32 values[32];
} data_ov002_022ce288;
extern void func_ov002_021b1570(int a, int b, void *c, int n);
void func_ov002_02245100(int flag) {
    u16 buf[98];
    u32 i, pos;
    u8 *p;
    u32 count;
    if (data_ov002_022d016c.active == 0) return;
    p = (u8 *)&data_ov002_022ce288;
    i = 0;
    count = data_ov002_022ce288.count;
    pos = 0;
    buf[pos++] = count;
    for (; i < count; i++) {
        u32 value;
        buf[pos++] = p[0x5dc];
        value = data_ov002_022ce288.values[i];
        buf[pos++] = value;
        buf[pos++] = value >> 16;
        p++;
    }
    func_ov002_021b1570((u16)(flag ? 12 : 11), -1, buf, pos * 2);
}



