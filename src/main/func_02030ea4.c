int func_02030ea4(int id) {
    switch (id) {
    case 0xff9:
    case 0x1009:
    case 0x1810:
        return 0xffff;
    case 0x1102:
    case 0x1aa3:
        return 3;
    case 0x1400:
        return 2;
    case 0x14ac:
    case 0x1aa9:
        return 3;
    case 0x149d:
    case 0x159c:
    case 0x17a1:
    case 0x187c:
    case 0x1a7e:
        return 2;
    case 0x123b:
    case 0x12c8:
    case 0x169c:
    case 0x188c:
        return 0;
    case 0x1811:
        return 0;
    case 0xfee:
    case 0x130d:
    case 0x131a:
    case 0x1529:
    case 0x15a0:
    case 0x15ee:
    case 0x180f:
    case 0x1909:
        return 0xffff;
    }
    return 0;
}

