int func_02019210(int x) {
    switch (x) {
    case 2: case 0x4a: return 2;
    case 3: case 0x5e: return 3;
    case 5: case 0x4b: return 5;
    case 0x2d: case 0x49: return 0x2d;
    case 0x3b: case 0x3c: case 0x3d: return 0x3b;
    case 7: case 0x3f: case 0x47: return 7;
    case 0x3e: return 0x3c;
    case 0x34: return 0x34;
    case 0x48: return 0x43;
    case 0x3a: case 0x5f: return 0x3a;
    case 0x40: return 0x56;
    default:
        if (x >= 0x41 && x <= 0x46) return x - 4;
        if (x >= 0x4c && x <= 0x5d) return x - 8;
        return x;
    }
}
