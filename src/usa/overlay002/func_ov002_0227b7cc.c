extern int func_0202f994(void);

int func_ov002_0227b7cc(int id) {
    if (func_0202f994() != 0) {
        return 1;
    }
    switch (id) {
    case 0x1286:
    case 0x133d:
    case 0x1370:
    case 0x13e8:
    case 0x1476:
    case 0x152e:
    case 0x19bd:
        return 1;
    default:
        return 0;
    }
}
