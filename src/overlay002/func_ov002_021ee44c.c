struct ce288 {
    char pad[0x494];
    int head;
    unsigned short ring[128];
};
extern struct ce288 data_ov002_022ce288;

int func_ov002_021ee44c(int a, int b)
{
    int i;
    for (i = a; i >= 0; i--) {
        int v = data_ov002_022ce288.ring[(data_ov002_022ce288.head + i) & 0x7f];
        if (v < b) {
            if (i != 0 && func_ov002_021ee44c(i - 1, b - v)) return 1;
        } else if (v == b) {
            return 1;
        }
    }
    return b == 0;
}
