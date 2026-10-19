typedef struct {
    char pad[0xd4];
    short hd4;
    short hd6;
} Obj;

int func_02028024(Obj *o) {
    int index = o->hd4;
    int value = o->hd6;
    switch (index) {
    case 0: *(unsigned short *)0x04000008 = (*(unsigned short *)0x04000008 & ~3) | value; break;
    case 1: *(unsigned short *)0x0400000a = (*(unsigned short *)0x0400000a & ~3) | value; break;
    case 2: *(unsigned short *)0x0400000c = (*(unsigned short *)0x0400000c & ~3) | value; break;
    case 3: *(unsigned short *)0x0400000e = (*(unsigned short *)0x0400000e & ~3) | value; break;
    case 4: *(unsigned short *)0x04001008 = (*(unsigned short *)0x04001008 & ~3) | value; break;
    case 5: *(unsigned short *)0x0400100a = (*(unsigned short *)0x0400100a & ~3) | value; break;
    case 6: *(unsigned short *)0x0400100c = (*(unsigned short *)0x0400100c & ~3) | value; break;
    case 7: *(unsigned short *)0x0400100e = (*(unsigned short *)0x0400100e & ~3) | value; break;
    }
    return 1;
}
