typedef unsigned short u16;
typedef unsigned int u32;

int func_ov002_021f4194(u16 *p)
{
    switch (*p) {
    case 4750:
    case 5655:
        return 1;
    case 5653:
    case 5681:
    case 5684:
        return 2;
    case 5648:
    case 5649:
    case 5658:
    case 5781:
        return 3;
    case 5677:
        return 10;
    }
    return 0;
}
