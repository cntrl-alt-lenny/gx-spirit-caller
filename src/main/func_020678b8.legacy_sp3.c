unsigned char func_020678b8(unsigned char *s, unsigned char input) {
    unsigned char old_i;
    unsigned char temp;

    old_i = s[0x100]++;
    s[0x101] += s[old_i];
    temp = s[s[0x104]];
    s[s[0x104]] = s[s[0x101]];
    s[s[0x101]] = s[s[0x103]];
    s[s[0x103]] = s[s[0x100]];
    s[s[0x100]] = temp;
    s[0x102] += s[temp];
    s[0x103] = input ^ s[(s[s[0x102]] + s[s[0x100]]) & 0xff] ^ s[s[(s[s[0x103]] + s[s[0x104]] + s[s[0x101]]) & 0xff]];
    s[0x104] = input;
    return s[0x103];
}

