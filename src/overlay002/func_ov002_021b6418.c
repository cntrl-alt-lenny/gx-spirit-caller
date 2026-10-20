typedef struct {
    unsigned short id;
    unsigned short : 12;
    unsigned short flags : 2;
    unsigned short : 2;
} Card;

int func_ov002_021b6418(Card *arg0)
{
    switch (arg0->id) {
    case 0x12cc:
    case 0x12fa:
    case 0x1769:
    case 0x1970:
    case 0x19b7:
        return 1;
    case 0x1209:
    case 0x1324:
    case 0x1325:
    case 0x1509:
    case 0x150d:
    case 0x151c:
    case 0x1571:
    case 0x176c:
    case 0x182e:
        return 2;
    case 0x199b:
        if (arg0->flags == 3)
            return 2;
        break;
    case 0x11f5:
    case 0x12d5:
    case 0x13b4:
    case 0x14e8:
    case 0x15a4:
    case 0x17a8:
    case 0x1803:
    case 0x1b5a:
        return 3;
    }
    return 0;
}
