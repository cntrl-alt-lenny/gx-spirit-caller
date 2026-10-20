typedef struct { unsigned int pad; unsigned int mode:3; unsigned int rest:29; } State;
typedef struct { short a, type; unsigned char pad[4]; unsigned char x,y; unsigned char tail[10]; } Entry;
extern State data_02104f4c;
extern Entry data_ov006_021ce650[];
extern Entry data_ov006_021ce8a8[];
int func_ov006_021c7d60(int *obj, int x, int y) {
    Entry *entry;
    short low, high; int type;
    if (data_02104f4c.mode == 0) entry = &data_ov006_021ce650[obj[0x1d]];
    else entry = &data_ov006_021ce8a8[obj[0x1d]];
    x -= entry->x * (short)20; y -= entry->y * (short)20;
    low = entry->type == 0 ? 20 : 3;
    high = entry->type == 1 ? 172 : 189;
    if (x < 3) x = 3;
    else if (x > 253 - obj[0x1e] * 20) x = 253 - obj[0x1e] * 20;
    if (y < low) y = low;
    else if (y > high - obj[0x1f] * 20) y = high - obj[0x1f] * 20;
    obj[0x22] = x;
    obj[0x23] = y;
    obj[0x26] = 0;
    obj[0x27] = 0;
    type = entry->type;
    if (!type || type == 1) obj[0x26] = -(obj[0x22] + obj[0x24]);
    *(volatile unsigned int *)0x04001014 = ((-(obj[0x22]-8)) & 0x1ff) | ((-(obj[0x23]-8) << 16) & 0x1ff0000);
    *(volatile unsigned int *)0x04001018 = ((-(obj[0x26] + (obj[0x22]+obj[0x24]))) & 0x1ff) | ((-(obj[0x27]+(obj[0x23]+obj[0x25])) << 16) & 0x1ff0000);
    return 1;
}




