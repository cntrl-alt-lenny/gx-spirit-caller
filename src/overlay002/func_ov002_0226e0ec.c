extern int func_ov002_021bbd54(int arg0, int arg2);

int func_ov002_0226e0ec(int player, int id)
{
    switch (id) {
    case 0x15b1:
        if (func_ov002_021bbd54(player, 0x1580) == 0) return 0;
        if (func_ov002_021bbd54(player, 0x15b0) == 0) return 0;
        break;
    case 0x15b4:
        if (func_ov002_021bbd54(player, 0x1580) == 0) return 0;
        if (func_ov002_021bbd54(player, 0x15b0) == 0) return 0;
        if (func_ov002_021bbd54(player, 0x15b3) == 0) return 0;
        break;
    case 0x15f9:
        if (func_ov002_021bbd54(player, 0x1580) == 0) return 0;
        if (func_ov002_021bbd54(player, 0x15b3) == 0) return 0;
        break;
    case 0x15fa:
        if (func_ov002_021bbd54(player, 0x15b0) == 0) return 0;
        if (func_ov002_021bbd54(player, 0x15b3) == 0) return 0;
        break;
    case 0x1953:
        if (func_ov002_021bbd54(player, 0x1947) == 0) return 0;
        if (func_ov002_021bbd54(player, 0x194b) == 0) return 0;
        break;
    case 0x1954:
        if (func_ov002_021bbd54(player, 0x1953) == 0) return 0;
        if (func_ov002_021bbd54(player, 0x15b4) == 0) return 0;
        break;
    case 0x1a6d:
        if (func_ov002_021bbd54(player, 0x19fd) == 0) return 0;
        if (func_ov002_021bbd54(player, 0x1a74) == 0) return 0;
        break;
    case 0x1a6e:
        if (func_ov002_021bbd54(player, 0x19fd) == 0) return 0;
        if (func_ov002_021bbd54(player, 0x1a70) == 0) return 0;
        break;
    case 0x1a6f:
        if (func_ov002_021bbd54(player, 0x19fd) == 0) return 0;
        if (func_ov002_021bbd54(player, 0x1a75) == 0) return 0;
        break;
    case 0x1b4c:
        if (func_ov002_021bbd54(player, 0x19fd) == 0) return 0;
        if (func_ov002_021bbd54(player, 0x1a73) == 0) return 0;
        break;
    case 0x1b4d:
        if (func_ov002_021bbd54(player, 0x19fd) == 0) return 0;
        if (func_ov002_021bbd54(player, 0x1a71) == 0) return 0;
        break;
    case 0x1b4e:
        if (func_ov002_021bbd54(player, 0x19fd) == 0) return 0;
        if (func_ov002_021bbd54(player, 0x1a72) == 0) return 0;
        break;
    }
    return 1;
}
