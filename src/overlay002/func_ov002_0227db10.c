int func_ov002_0227db10(int id, int flag, int enabled)
{
    switch (id) {
    case 0x1175:
    case 0x11bc:
    case 0x1653:
    case 0x1655:
    case 0x1793:
    case 0x1794:
    case 0x1799:
        if (flag == 0 && enabled != 0) return 1;
        return 0;
    case 0x12a2:
    case 0x13e3:
    case 0x14a5:
    case 0x16f9:
    case 0x17c5:
    case 0x1946:
    case 0x197f:
    case 0x19fe:
    case 0x1aaa:
    case 0x1b2a:
        return 1;
    case 0x1965:
    case 0x1966:
    case 0x1968:
    case 0x1969:
        return flag == 0;
    default:
        return 0;
    }
}
