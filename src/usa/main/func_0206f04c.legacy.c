extern int func_0206f0fc(char *str, char **out);

int func_0206f04c(char *str, unsigned int *out) {
    unsigned int val = 0;
    int i;
    char *p = str;

    for (i = 0; i < 4; i++) {
        char *next;
        int octet;

        val = val << 8;
        octet = func_0206f0fc(p, &next);
        if (p == next) {
            return 0;
        }
        p = next;

        if ((unsigned int)octet > 0xff) {
            goto fail;
        }
        if (i == 3) {
            goto check3;
        }

        {
            unsigned char c = *(unsigned char *)p;
            p = p + 1;
            if (c != '.') {
                goto fail;
            }
        }

    check3:
        if (i != 3) {
            goto success;
        }
        if (*(unsigned char *)p == 0) {
            goto success;
        }

    fail:
        return 0;

    success:
        val |= octet;
    }

    *out = val;
    return 1;
}
