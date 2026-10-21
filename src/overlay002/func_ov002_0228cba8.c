extern unsigned int func_ov002_021b00d0(unsigned int x);
extern unsigned int func_0202b8c0(int id);
extern unsigned char data_ov002_022cf16c[];
typedef struct { unsigned int id:13; unsigned int rest:19; } CardBits;
typedef struct { unsigned int pad:1; unsigned int a:1; unsigned int b:1; unsigned int rest:17; unsigned int c:1; unsigned int tail:11; } Flags;
int func_ov002_0228cba8(int player, unsigned int mask)
{
    int list[11];
    int i, shift, temp, slot;
    int count = 0;
    unsigned char *entry;
    shift = (player << 4) + 5;
    for (i = 5; i <= 10; i++) {
        if (mask & (1u << shift)) {
            list[count] = i;
            count++;
        }
        shift++;
    }
    for (i = count - 1; i > 0; i--) {
        int random = func_ov002_021b00d0(i + 1);
        temp = list[i];
        list[i] = list[random];
        list[random] = temp;
    }
    for (i = 0; i < count; i++) {
        slot = list[i];
        entry = data_ov002_022cf16c + (player & 1) * 0x868 + slot * 20;
        if (((*(unsigned int *)(entry + 0x40) >> 1) | (*(unsigned int *)(entry + 0x40) >> 2)) & 1) {
            int type = func_0202b8c0(((CardBits *)(entry + 0x30))->id);
            switch (type) { case 2: case 3: case 4: return slot; }
        }
    }
    for (i = 0; i < count; i++) {
        slot = list[i];
        entry = data_ov002_022cf16c + (player & 1) * 0x868 + slot * 20;
        if (*(unsigned short *)(entry + 0x38) != 0) {
            if (!(((*(unsigned int *)(entry + 0x40) >> 1) | (*(unsigned int *)(entry + 0x40) >> 2)) & 1)) return slot;
        }
    }
    for (i = 0; i < count; i++) {
        slot = list[i];
        entry = data_ov002_022cf16c + (player & 1) * 0x868 + slot * 20;
        if (*(unsigned short *)(entry + 0x38) == 0) {
            if (((*(unsigned int *)(entry + 0x40) >> 20) & 1)) return slot;
        }
    }
    for (i = 0; i < count; i++) {
        slot = list[i];
        entry = data_ov002_022cf16c + (player & 1) * 0x868 + slot * 20;
        if (*(unsigned short *)(entry + 0x38) == 0) return slot;
    }
    if (count <= 0) return -1;
    return list[func_ov002_021b00d0(count)];
}



