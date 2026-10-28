int func_0202f620(int x, int *out) {
    int tmp[2];
    if (out == 0) out = tmp;
    switch (x) {
    case 0x17d1: out[0] = 0x1822; return 1;
    case 0x17d2: out[0] = 0x17d3; return 1;
    case 0x17d3: out[0] = 0x17d4; return 1;
    case 0x17d4: out[0] = 0x17d3; return 1;
    case 0x17d5: out[0] = 0x17d6; return 1;
    case 0x17d6: out[0] = 0x17d5; return 1;
    case 0x17d7: out[0] = 0x17d8; return 1;
    case 0x17d8: out[0] = 0x1823; return 1;
    case 0x17d9: out[0] = 0x17da; return 1;
    case 0x17da: out[0] = 0x17db; return 1;
    case 0x17db: out[0] = 0x17da; return 1;
    case 0x1812: out[0] = 0x1814; return 1;
    case 0x1814: out[0] = 0x1816; return 1;
    case 0x1816: out[0] = 0x1814; return 1;
    case 0x1817: out[0] = 0x181a; return 1;
    case 0x181a: out[0] = 0x1817; return 1;
    case 0x1822: out[0] = 0x17d1; out[1] = 0x185e; return 2;
    case 0x1823: break;
    case 0x185e: out[0] = 0x1822; out[1] = 0x18af; return 2;
    case 0x18af: out[0] = 0x185e; return 1;
    case 0x1906: break;
    case 0x198c: out[0] = 0x17db; return 1;
    case 0x1a6c: out[0] = 0x1a70; return 1;
    case 0x1ad6: out[0] = 0x1ad7; return 1;
    case 0x1ad7: out[0] = 0x1ad6; out[1] = 0x1ad8; return 2;
    case 0x1ad8: out[0] = 0x1ad7; return 1;
    case 0x1adc: out[0] = 0x1add; return 1;
    case 0x1add: out[0] = 0x1adc; out[1] = 0x1ade; return 2;
    case 0x1ade: out[0] = 0x1add; return 1;
    }
    return 0;
}
