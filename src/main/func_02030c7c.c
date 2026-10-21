extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8c0(int id);

int func_02030c7c(int id) {
    unsigned int type = func_0202b878(id);
    unsigned int attr = func_0202b8c0(id);
    switch (type) {
    case 0x17:
        return attr == 1 ? 3 : 2;
    case 0x16:
        return attr == 5 ? 2 : 1;
    }
    switch (id) {
    case 0xfe0:
    case 0x1119:
    case 0x111a:
    case 0x111b:
    case 0x13a7:
    case 0x148c:
    case 0x14b6:
    case 0x14c7:
    case 0x158a:
    case 0x1594:
    case 0x15fc:
    case 0x168f:
    case 0x16b9:
    case 0x1771:
    case 0x1774:
    case 0x17c2:
    case 0x17c6:
    case 0x17d4:
    case 0x183a:
    case 0x1906:
    case 0x1936:
    case 0x1a24:
    case 0x1a25:
    case 0x1a60:
    case 0x1aac:
    case 0x1b2c:
    case 0x1b44:
        return 2;
    }
    return 1;
}


