extern int func_ov002_022813f8(int a);
extern int func_ov002_022814f0(int id);

int func_ov002_022815a4(int id, int flag)
{
    switch (id) {
    case 0x1466:
    case 0x1522:
    case 0x1645:
    case 0x185c:
        return flag == 0;
    case 0x10f4:
    case 0x1256:
    case 0x1302:
    case 0x130c:
    case 0x1322:
    case 0x134a:
    case 0x140e:
    case 0x1468:
    case 0x150a:
    case 0x150b:
    case 0x15ee:
    case 0x1636:
    case 0x166c:
    case 0x17a6:
    case 0x1992:
    case 0x1a7e:
        return 1;
    }
    if (func_ov002_022813f8(id))
        return 1;
    return func_ov002_022814f0(id) != 0;
}
