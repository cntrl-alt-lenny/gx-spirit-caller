/* func_020ace00: atoi-style thunk — `func_020acd38(s, 0, 0xa)` (strtol). */

extern int func_020acd38(const char *str, char **endptr, int base);

int func_020ace00(const char *s) {
    return func_020acd38(s, 0, 0xa);
}
