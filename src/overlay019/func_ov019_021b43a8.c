typedef struct { char pad[0xc]; } Entry;
extern int func_02019210(int x);
int func_ov019_021b43a8(Entry *p, int id, int count) {
    int type = func_02019210(id);
    int i;
    switch (id) { case 0x34: case 0x3a: case 0x40: case 0x5f: return 0; }
    switch (type) {
    case 2: case 3: case 5: case 7: case 45: case 59: case 67:
        for (i = 0; i < count; i++, p++) {
            if (type == func_02019210(*(unsigned short *)((char *)p + 0x14))) return 0;
        }
        return 1;
    case 1: case 4: case 6: case 8: case 9: case 12: case 13: case 14: case 15: case 17: case 19: case 25: case 27: case 28: case 37: case 38: case 41: case 48: case 49: case 53: case 54: case 55: case 56: case 57: case 60: case 61: case 62: case 63: case 64: case 65: case 66:
        return 1;
    default: return 0;
    }
}

