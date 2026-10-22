int func_0202df78(int a, int b) {
    if (a == b) return 1;
    switch (a) {
    case 0xfa6:
    case 0xfa7:
        if (b == 0xfa6 || b == 0xfa7) return 1;
        break;
    case 0x12e5:
    case 0x1303:
        if (b == 0x12e5 || b == 0x1303) return 1;
        break;
    case 0xfc9:
    case 0x142d:
        if (b == 0xfc9 || b == 0x142d) return 1;
        break;
    case 0xfe4:
    case 0x1477:
    case 0x182a:
    case 0x182b:
    case 0x182c:
        if (b == 0xfe4 || b == 0x1477 || b == 0x182a || b == 0x182b || b == 0x182c) return 1;
        break;
    case 0x10f4:
    case 0x150b:
        if (b == 0x10f4 || b == 0x150b) return 1;
        break;
    case 0x14f9:
    case 0x154f:
    case 0x1550:
    case 0x1551:
        if (b == 0x14f9 || b == 0x154f || b == 0x1550 || b == 0x1551) return 1;
        break;
    case 0x1730:
    case 0x1731:
        if (b == 0x1730 || b == 0x1731) return 1;
        break;
    case 0x1670:
    case 0x1671:
    case 0x1672:
        if (b == 0x1670 || b == 0x1671 || b == 0x1672) return 1;
        break;
    }
    return 0;
}
