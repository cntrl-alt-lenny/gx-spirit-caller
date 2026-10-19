int func_ov002_0226e46c(int value)
{
    switch (value) {
    case 0x1466:
        return 3;
    case 0x1483:
    case 0x16c6:
    case 0x19ca:
        return 2;
    case 0x1484:
    case 0x1485:
    case 0x1486:
    case 0x1487:
    case 0x16c5:
    case 0x16c7:
    case 0x16c8:
    case 0x16c9:
    case 0x16cb:
    case 0x16e4:
    case 0x18b4:
        return 1;
    default:
        return 0;
    }
}
