unsigned char func_020678b8(unsigned char *s, unsigned char input) {
    unsigned char t = s[0x100];
    s[0x100] = t + 1;
    s[0x101] += s[t];
    t = s[s[0x104]];
    s[s[0x104]] = s[((volatile unsigned char *)s)[0x101]];
    s[s[0x101]] = s[s[0x103]];
    s[s[0x103]] = s[s[0x100]];
    s[s[0x100]] = t;
    s[0x102] = s[0x102] + s[t];
    s[0x103] = input ^ s[(unsigned char)(s[((volatile unsigned char *)s)[0x102]] + s[s[0x100]])] ^ s[s[(unsigned char)(s[s[0x103]] + s[s[0x104]] + s[s[0x101]])]];
    s[0x104] = input;
    return s[0x103];
}

